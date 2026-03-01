//
//  League.swift
//  SpreadSwipe Watch App
//
//  Created by Jimmy Shultz on 2/28/26.
//

import Foundation

/// Defines the supported leagues and maps to the Odds API's expected sport keys.
enum League: String, Codable, CaseIterable, Hashable {
    case nfl = "americanfootball_nfl"
    case nba = "basketball_nba"
    case mlb = "baseball_mlb"
    case nhl = "icehockey_nhl"
    case mls = "soccer_usa_mls"
    
    /// Human-readable league name for the UI.
    var displayName: String {
        switch self {
        case .nfl: return "NFL"
        case .nba: return "NBA"
        case .mlb: return "MLB"
        case .nhl: return "NHL"
        case .mls: return "MLS"
        }
    }
    
    /// SF Symbol used as a placeholder icon for each league.
    var sfSymbol: String {
        switch self {
        case .nfl: return "football.fill"
        case .nba: return "basketball.fill"
        case .mlb: return "baseball.fill"
        case .nhl: return "hockey.puck.fill"
        case .mls: return "soccerball"
        }
    }
}
