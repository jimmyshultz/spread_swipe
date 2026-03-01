//
//  LeagueListView.swift
//  SpreadSwipe Watch App
//
//  Created by Jimmy Shultz on 2/28/26.
//

import SwiftUI

/// Level 1 of the team selection flow: pick a league.
struct LeagueListView: View {
    @ObservedObject var viewModel: SpreadViewModel
    
    var body: some View {
        List(League.allCases, id: \.self) { league in
            NavigationLink {
                TeamListView(viewModel: viewModel, league: league)
            } label: {
                HStack(spacing: 10) {
                    Image(systemName: league.sfSymbol)
                        .foregroundStyle(.white)
                        .frame(width: 24)
                    
                    Text(league.displayName)
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                }
            }
        }
        .navigationTitle("League")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        LeagueListView(viewModel: SpreadViewModel())
    }
}
