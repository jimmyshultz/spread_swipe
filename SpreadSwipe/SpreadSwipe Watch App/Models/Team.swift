//
//  Team.swift
//  SpreadSwipe Watch App
//
//  Created by Jimmy Shultz on 2/28/26.
//

import Foundation
import SwiftUI

/// Represents a team locally and in user preferences.
struct Team: Identifiable, Codable, Hashable {
    /// Unique identifier, e.g. "NFL_DAL"
    let id: String
    
    /// The league this team belongs to
    let league: League
    
    /// The exact team name as returned by The Odds API, e.g. "Dallas Cowboys"
    let apiName: String
    
    /// The asset catalog image name, e.g. "logo_nfl_dal"
    let assetName: String
    
    /// Primary team color as hex string, e.g. "003594"
    let primaryColor: String
    
    /// Secondary team color as hex string, e.g. "FFFFFF"
    let secondaryColor: String
    
    /// Short display abbreviation for compact UI, e.g. "DAL"
    var abbreviation: String {
        let parts = id.split(separator: "_", maxSplits: 1)
        return parts.count > 1 ? String(parts[1]) : id
    }
    
    /// Primary color as SwiftUI Color
    var primarySwiftUIColor: Color {
        Color(hex: primaryColor)
    }
    
    /// Secondary color as SwiftUI Color
    var secondarySwiftUIColor: Color {
        Color(hex: secondaryColor)
    }
}

// MARK: - Color Hex Extension

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let r, g, b: Double
        switch hex.count {
        case 6:
            r = Double((int >> 16) & 0xFF) / 255.0
            g = Double((int >> 8) & 0xFF) / 255.0
            b = Double(int & 0xFF) / 255.0
        default:
            r = 1; g = 1; b = 1
        }
        self.init(red: r, green: g, blue: b)
    }
}
