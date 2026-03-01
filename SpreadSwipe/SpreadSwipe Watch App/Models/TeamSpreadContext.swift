//
//  TeamSpreadContext.swift
//  SpreadSwipe Watch App
//
//  Created by Jimmy Shultz on 2/28/26.
//

import Foundation

/// Wrapper combining a Team with its current spread status.
/// Drives each page in the main swipe view.
struct TeamSpreadContext: Identifiable {
    var id: String { team.id }
    
    /// The team this context represents
    let team: Team
    
    /// The current spread state (loading, spread value, off, or error)
    var spreadState: SpreadState
}
