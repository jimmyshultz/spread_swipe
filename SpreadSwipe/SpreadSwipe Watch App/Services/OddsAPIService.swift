//
//  OddsAPIService.swift
//  SpreadSwipe Watch App
//
//  Created by Jimmy Shultz on 2/28/26.
//

import Foundation

/// Network service that fetches cached point spreads from the
/// Cloudflare Worker proxy. The Worker handles all Odds API calls
/// and credit management — the client just reads the cached JSON.
actor OddsAPIService {
    
    static let shared = OddsAPIService()
    
    /// The Cloudflare Worker endpoint that serves cached spreads.
    private let workerURL = "https://spread-swipe-worker.spreadswipe.workers.dev/spreads"
    
    // MARK: - Worker Response Models
    
    /// Per-team spread info returned by the Worker.
    private struct TeamSpreadInfo: Decodable {
        let spread: String
        let opponent: String
        let commenceTime: String
        let isHome: Bool
    }
    
    /// Top-level response from the Cloudflare Worker.
    private struct WorkerResponse: Decodable {
        let lastUpdated: String
        let creditsRemaining: Int?
        let leagues: [String: [String: TeamSpreadInfo]]
    }
    
    // MARK: - Public API
    
    /// Fetches spreads for all given teams from the Cloudflare Worker.
    /// Returns a dictionary mapping team ID → SpreadState.GameInfo.
    func fetchSpreads(for teams: [Team]) async -> [String: SpreadState.GameInfo] {
        do {
            let response = try await fetchFromWorker()
            return mapSpreads(from: response, for: teams)
        } catch {
            print("[OddsAPI] Error fetching from worker: \(error)")
            return [:]
        }
    }
    
    // MARK: - Private Helpers
    
    /// Fetches the cached spreads JSON from the Cloudflare Worker.
    private func fetchFromWorker() async throws -> WorkerResponse {
        guard let url = URL(string: workerURL) else {
            throw OddsAPIError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        if let httpResponse = response as? HTTPURLResponse {
            guard httpResponse.statusCode == 200 else {
                throw OddsAPIError.httpError(httpResponse.statusCode)
            }
        }
        
        let decoder = JSONDecoder()
        return try decoder.decode(WorkerResponse.self, from: data)
    }
    
    /// Maps the worker's league/team data to SpreadState.GameInfo per team ID.
    private func mapSpreads(
        from response: WorkerResponse,
        for teams: [Team]
    ) -> [String: SpreadState.GameInfo] {
        var results: [String: SpreadState.GameInfo] = [:]
        
        for team in teams {
            let sportKey = team.league.rawValue
            
            guard let leagueSpreads = response.leagues[sportKey] else {
                continue
            }
            
            if let info = leagueSpreads[team.apiName] {
                results[team.id] = SpreadState.GameInfo(
                    spread: info.spread,
                    opponent: info.opponent,
                    commenceTime: info.commenceTime,
                    isHome: info.isHome
                )
            }
        }
        
        return results
    }
    
    // MARK: - Errors
    
    enum OddsAPIError: LocalizedError {
        case invalidURL
        case httpError(Int)
        
        var errorDescription: String? {
            switch self {
            case .invalidURL:
                return "Invalid worker URL"
            case .httpError(let code):
                return "HTTP error: \(code)"
            }
        }
    }
}
