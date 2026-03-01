//
//  SpreadState.swift
//  SpreadSwipe Watch App
//
//  Created by Jimmy Shultz on 2/28/26.
//

import Foundation

/// Represents the current spread display state for a team.
enum SpreadState: Codable, Equatable {
    /// Data is currently loading.
    case loading
    /// No game scheduled — league is off-season or no upcoming events.
    case noGame
    /// A spread is available with full game context.
    case spread(GameInfo)
    /// An error occurred fetching data.
    case error(String)
    
    /// Full game context returned from the Cloudflare Worker.
    struct GameInfo: Codable, Equatable {
        let spread: String       // e.g. "+3.5", "-7", "PK"
        let opponent: String     // Odds API name of the opposing team
        let commenceTime: String // ISO 8601 date string
        let isHome: Bool         // true = home game (vs), false = away (@)
    }
    
    /// The spread text to display (e.g. "+3.5", "—", "!").
    var displayText: String {
        switch self {
        case .loading:
            return "…"
        case .noGame:
            return "—"
        case .spread(let info):
            return info.spread
        case .error:
            return "!"
        }
    }
}
