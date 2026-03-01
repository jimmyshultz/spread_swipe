//
//  Team.swift
//  SpreadSwipe Watch App
//
//  Created by Jimmy Shultz on 2/28/26.
//

import Foundation

/// Represents a team locally and in user preferences.
struct Team: Identifiable, Codable, Hashable {
    /// Unique identifier, e.g. "NFL_DAL"
    let id: String
    
    /// The league this team belongs to
    let league: League
    
    /// The exact team name as returned by The Odds API, e.g. "Dallas Cowboys"
    /// Used to match against JSON responses
    let apiName: String
    
    /// The asset catalog image name, e.g. "logo_nfl_dal"
    /// Maps to a vector asset in Assets.xcassets
    let assetName: String
    
    /// Short display abbreviation for compact UI, e.g. "DAL"
    var abbreviation: String {
        // Extract the abbreviation from the id (after the league prefix + underscore)
        let parts = id.split(separator: "_", maxSplits: 1)
        return parts.count > 1 ? String(parts[1]) : id
    }
}
