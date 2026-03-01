//
//  UserPreferences.swift
//  SpreadSwipe Watch App
//
//  Created by Jimmy Shultz on 2/28/26.
//

import Foundation
import Combine
import SwiftUI

/// Manages persistent storage of the user's selected teams in UserDefaults.
/// Enforces a hard limit of 5 selected teams.
class UserPreferences: ObservableObject {
    
    static let shared = UserPreferences()
    
    private static let selectedTeamIdsKey = "selectedTeamIds"
    static let maxTeams = 5
    
    /// The IDs of the currently selected teams, persisted in UserDefaults.
    @Published private(set) var selectedTeamIds: [String] {
        didSet {
            UserDefaults.standard.set(selectedTeamIds, forKey: Self.selectedTeamIdsKey)
        }
    }
    
    /// The full Team objects for the currently selected teams, in selection order.
    var selectedTeams: [Team] {
        selectedTeamIds.compactMap { TeamRegistry.team(byId: $0) }
    }
    
    /// Whether the user can add more teams (under the 5-team limit).
    var canAddTeam: Bool {
        selectedTeamIds.count < Self.maxTeams
    }
    
    /// How many team slots remain.
    var remainingSlots: Int {
        max(0, Self.maxTeams - selectedTeamIds.count)
    }
    
    private init() {
        self.selectedTeamIds = UserDefaults.standard.stringArray(
            forKey: Self.selectedTeamIdsKey
        ) ?? []
    }
    
    /// Adds a team to the selected list. Returns false if at max capacity.
    @discardableResult
    func addTeam(_ team: Team) -> Bool {
        guard canAddTeam else { return false }
        guard !selectedTeamIds.contains(team.id) else { return true } // already selected
        selectedTeamIds.append(team.id)
        return true
    }
    
    /// Removes a team from the selected list.
    func removeTeam(_ team: Team) {
        selectedTeamIds.removeAll { $0 == team.id }
    }
    
    /// Removes a team at the given index offset.
    func removeTeam(at offsets: IndexSet) {
        selectedTeamIds.remove(atOffsets: offsets)
    }
    
    /// Checks if a specific team is currently selected.
    func isSelected(_ team: Team) -> Bool {
        selectedTeamIds.contains(team.id)
    }
    
    /// Reorders teams (for drag-and-drop, if ever needed).
    func moveTeam(from source: IndexSet, to destination: Int) {
        selectedTeamIds.move(fromOffsets: source, toOffset: destination)
    }
}
