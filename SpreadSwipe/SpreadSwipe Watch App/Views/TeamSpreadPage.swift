//
//  TeamSpreadPage.swift
//  SpreadSwipe Watch App
//
//  Created by Jimmy Shultz on 2/28/26.
//

import SwiftUI

/// A single full-screen page showing:
/// - Team logo (centered)
/// - Spread value (top-right)
/// - Opponent info (bottom-right): small opponent logo, @/vs, date & time
struct TeamSpreadPage: View {
    
    let context: TeamSpreadContext
    
    /// ISO 8601 date formatter for parsing commenceTime.
    private static let isoFormatter: ISO8601DateFormatter = {
        let f = ISO8601DateFormatter()
        f.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        return f
    }()
    
    /// Fallback ISO formatter without fractional seconds.
    private static let isoFormatterNoFrac: ISO8601DateFormatter = {
        let f = ISO8601DateFormatter()
        f.formatOptions = [.withInternetDateTime]
        return f
    }()
    
    var body: some View {
        ZStack {
            // Pure black background (OLED)
            Color.black.ignoresSafeArea()
            
            // Center: Team logo
            teamLogo(for: context.team)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            // Top-right: Spread value
            VStack {
                HStack {
                    Spacer()
                    spreadBadge
                }
                Spacer()
            }
            .padding(.top, 4)
            .padding(.trailing, 4)
            
            // Bottom-right: Opponent info
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    opponentInfo
                }
            }
            .padding(.bottom, 4)
            .padding(.trailing, 4)
        }
    }
    
    // MARK: - Team Logo
    
    @ViewBuilder
    private func teamLogo(for team: Team) -> some View {
        if UIImage(named: team.assetName) != nil {
            Image(team.assetName)
                .resizable()
                .scaledToFit()
                .frame(width: 90, height: 90)
        } else {
            // Fallback: league sport icon
            Image(systemName: team.league.sfSymbol)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .foregroundStyle(.white.opacity(0.5))
        }
    }
    
    // MARK: - Spread Badge
    
    @ViewBuilder
    private var spreadBadge: some View {
        let text = context.spreadState.displayText
        
        Text(text)
            .font(.system(size: 16, weight: .bold, design: .rounded))
            .foregroundStyle(spreadColor)
            .padding(.horizontal, 6)
            .padding(.vertical, 2)
            .background(
                Capsule()
                    .fill(.ultraThinMaterial)
            )
    }
    
    /// Color for the spread number.
    private var spreadColor: Color {
        switch context.spreadState {
        case .spread(let info):
            if info.spread.hasPrefix("-") { return .green }
            if info.spread.hasPrefix("+") { return .red }
            return .yellow // PK
        case .error:
            return .red
        default:
            return .white
        }
    }
    
    // MARK: - Opponent Info
    
    @ViewBuilder
    private var opponentInfo: some View {
        switch context.spreadState {
        case .spread(let info):
            HStack(spacing: 3) {
                // Date & Time
                VStack(alignment: .trailing, spacing: 0) {
                    Text(formattedDate(info.commenceTime))
                        .font(.system(size: 10, weight: .medium, design: .rounded))
                        .foregroundStyle(.white.opacity(0.6))
                    Text(formattedTime(info.commenceTime))
                        .font(.system(size: 10, weight: .medium, design: .rounded))
                        .foregroundStyle(.white.opacity(0.6))
                }
                
                // @ or vs
                Text(info.isHome ? "vs" : "@")
                    .font(.system(size: 10, weight: .bold, design: .rounded))
                    .foregroundStyle(.white.opacity(0.7))
                
                // Opponent logo
                opponentLogo(for: info)
                    .frame(width: 22, height: 22)
            }
            
        default:
            EmptyView()
        }
    }
    
    // MARK: - Opponent Logo
    
    @ViewBuilder
    private func opponentLogo(for info: SpreadState.GameInfo) -> some View {
        // Look up the opponent's asset name from the registry
        let opponentTeam = TeamRegistry.allTeams.first { $0.apiName == info.opponent }
        
        if let team = opponentTeam, UIImage(named: team.assetName) != nil {
            Image(team.assetName)
                .resizable()
                .scaledToFit()
        } else if let team = opponentTeam {
            Image(systemName: team.league.sfSymbol)
                .resizable()
                .scaledToFit()
                .foregroundStyle(.white.opacity(0.4))
        } else {
            Image(systemName: "questionmark.circle")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.white.opacity(0.4))
        }
    }
    
    // MARK: - Date/Time Formatting
    
    /// Formats an ISO 8601 string to "MM/dd".
    private func formattedDate(_ isoString: String) -> String {
        guard let date = parseISO(isoString) else { return "" }
        let formatter = DateFormatter()
        formatter.dateFormat = "M/dd"
        formatter.timeZone = .current
        return formatter.string(from: date)
    }
    
    /// Formats an ISO 8601 string to local time (e.g. "7:30p").
    private func formattedTime(_ isoString: String) -> String {
        guard let date = parseISO(isoString) else { return "" }
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mma"
        formatter.amSymbol = "a"
        formatter.pmSymbol = "p"
        formatter.timeZone = .current
        return formatter.string(from: date)
    }
    
    /// Parses an ISO 8601 date string (with or without fractional seconds).
    private func parseISO(_ string: String) -> Date? {
        Self.isoFormatter.date(from: string)
            ?? Self.isoFormatterNoFrac.date(from: string)
    }
}

// MARK: - Preview

#Preview {
    let team = Team(id: "NBA_LAL", league: .nba, apiName: "Los Angeles Lakers", assetName: "logo_nba_lal")
    let gameInfo = SpreadState.GameInfo(
        spread: "-4",
        opponent: "Golden State Warriors",
        commenceTime: "2026-03-01T02:30:00Z",
        isHome: true
    )
    return TeamSpreadPage(
        context: TeamSpreadContext(team: team, spreadState: .spread(gameInfo))
    )
}
