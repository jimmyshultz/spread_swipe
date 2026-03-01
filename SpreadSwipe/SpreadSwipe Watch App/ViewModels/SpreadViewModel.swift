//
//  SpreadViewModel.swift
//  SpreadSwipe Watch App
//
//  Created by Jimmy Shultz on 2/28/26.
//

import Foundation
import SwiftUI
import Combine

/// Main view model that drives the app's UI state.
/// Combines user preferences, API data, and caching to build
/// the list of TeamSpreadContexts shown in the swipe view.
@MainActor
class SpreadViewModel: ObservableObject {
    
    // MARK: - Published State
    
    /// The team spread contexts powering the TabView pages.
    @Published var teamContexts: [TeamSpreadContext] = []
    
    /// Whether a data fetch is currently in progress.
    @Published var isLoading = false
    
    /// Whether the settings view is showing.
    @Published var showingSettings = false
    
    /// Alert text for max-team limit, nil if no alert.
    @Published var maxTeamAlert: String?
    
    // MARK: - Dependencies
    
    let preferences: UserPreferences
    private let apiService = OddsAPIService.shared
    
    // MARK: - Computed Properties
    
    /// Whether there are any selected teams.
    var hasTeams: Bool {
        !preferences.selectedTeamIds.isEmpty
    }
    
    /// Whether the user can add more teams.
    var canAddTeam: Bool {
        preferences.canAddTeam
    }
    
    // MARK: - Init
    
    init(preferences: UserPreferences = .shared) {
        self.preferences = preferences
        rebuildContexts()
    }
    
    // MARK: - Team Management
    
    /// Adds a team to the user's favorites. Shows alert if at max.
    func addTeam(_ team: Team) {
        guard preferences.canAddTeam else {
            maxTeamAlert = "Maximum \(UserPreferences.maxTeams) teams. Remove one to add another."
            return
        }
        
        preferences.addTeam(team)
        rebuildContexts()
        
        // Fetch spread for the newly added team
        Task {
            await loadSpreadForTeam(team)
        }
    }
    
    /// Removes a team at the given offsets.
    func removeTeam(at offsets: IndexSet) {
        preferences.removeTeam(at: offsets)
        rebuildContexts()
    }
    
    /// Removes a specific team.
    func removeTeam(_ team: Team) {
        preferences.removeTeam(team)
        rebuildContexts()
    }
    
    /// Checks if a team is currently selected.
    func isSelected(_ team: Team) -> Bool {
        preferences.isSelected(team)
    }
    
    // MARK: - Data Loading
    
    /// Loads spreads for all selected teams.
    /// Falls back to cached values on API failure.
    func loadSpreads() async {
        guard hasTeams else { return }
        
        isLoading = true
        defer { isLoading = false }
        
        let teams = preferences.selectedTeams
        
        // Set all to loading state
        for i in teamContexts.indices {
            teamContexts[i].spreadState = .loading
        }
        
        // Fetch from API (returns GameInfo per team ID)
        let apiResults = await apiService.fetchSpreads(for: teams)
        
        // Update each team context
        for i in teamContexts.indices {
            let teamId = teamContexts[i].team.id
            
            if let gameInfo = apiResults[teamId] {
                // Fresh API data
                teamContexts[i].spreadState = .spread(gameInfo)
                SpreadCacheService.cacheSpread(gameInfo, for: teamId)
            } else if apiResults.isEmpty {
                // API call completely failed — use cache
                if let cached = SpreadCacheService.getCachedSpread(for: teamId) {
                    teamContexts[i].spreadState = .spread(cached.gameInfo)
                } else {
                    teamContexts[i].spreadState = .error("Offline")
                }
            } else {
                // API succeeded but no game found for this team
                teamContexts[i].spreadState = .noGame
            }
        }
    }
    
    /// Loads the spread for a single team (used when adding a new team).
    func loadSpreadForTeam(_ team: Team) async {
        guard let index = teamContexts.firstIndex(where: { $0.team.id == team.id }) else { return }
        
        teamContexts[index].spreadState = .loading
        
        let apiResults = await apiService.fetchSpreads(for: [team])
        
        if let gameInfo = apiResults[team.id] {
            teamContexts[index].spreadState = .spread(gameInfo)
            SpreadCacheService.cacheSpread(gameInfo, for: team.id)
        } else if let cached = SpreadCacheService.getCachedSpread(for: team.id) {
            teamContexts[index].spreadState = .spread(cached.gameInfo)
        } else {
            teamContexts[index].spreadState = .noGame
        }
    }
    
    /// Loads spreads using only cached data (no network calls).
    func loadCachedSpreads() {
        for i in teamContexts.indices {
            let teamId = teamContexts[i].team.id
            if let cached = SpreadCacheService.getCachedSpread(for: teamId) {
                teamContexts[i].spreadState = .spread(cached.gameInfo)
            } else {
                teamContexts[i].spreadState = .noGame
            }
        }
    }
    
    // MARK: - Private Helpers
    
    /// Rebuilds teamContexts from the current user preferences.
    private func rebuildContexts() {
        let selectedTeams = preferences.selectedTeams
        
        teamContexts = selectedTeams.map { team in
            if let existing = teamContexts.first(where: { $0.team.id == team.id }) {
                return existing
            }
            
            if let cached = SpreadCacheService.getCachedSpread(for: team.id) {
                return TeamSpreadContext(team: team, spreadState: .spread(cached.gameInfo))
            }
            
            return TeamSpreadContext(team: team, spreadState: .loading)
        }
    }
}
