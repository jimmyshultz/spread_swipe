//
//  MainSwipeView.swift
//  SpreadSwipe Watch App
//
//  Created by Jimmy Shultz on 2/28/26.
//

import SwiftUI

/// The primary view of the app — a vertical paging TabView showing
/// one page per selected team with their current spread.
struct MainSwipeView: View {
    @ObservedObject var viewModel: SpreadViewModel
    
    var body: some View {
        Group {
            if viewModel.hasTeams {
                TabView {
                    ForEach(viewModel.teamContexts) { context in
                        TeamSpreadPage(context: context)
                    }
                }
                .tabViewStyle(.verticalPage)
                .onLongPressGesture {
                    viewModel.showingSettings = true
                }
            } else {
                EmptyStateView {
                    viewModel.showingSettings = true
                }
            }
        }
        .sheet(isPresented: $viewModel.showingSettings) {
            SettingsView(viewModel: viewModel)
        }
        .task {
            // Load cached spreads immediately for instant UI
            viewModel.loadCachedSpreads()
            // Then fetch fresh data from API
            await viewModel.loadSpreads()
        }
    }
}

#Preview("With Teams") {
    let vm = SpreadViewModel()
    let _ = {
        vm.teamContexts = [
            TeamSpreadContext(
                team: Team(id: "NFL_DAL", league: .nfl, apiName: "Dallas Cowboys", assetName: "logo_nfl_dal", primaryColor: "003594", secondaryColor: "FFFFFF"),
                spreadState: .spread(SpreadState.GameInfo(spread: "+3.5", opponent: "Philadelphia Eagles", commenceTime: "2026-03-02T18:00:00Z", isHome: true))
            ),
            TeamSpreadContext(
                team: Team(id: "NBA_LAL", league: .nba, apiName: "Los Angeles Lakers", assetName: "logo_nba_lal", primaryColor: "552583", secondaryColor: "FDB927"),
                spreadState: .spread(SpreadState.GameInfo(spread: "-7", opponent: "Golden State Warriors", commenceTime: "2026-03-01T02:30:00Z", isHome: false))
            ),
        ]
    }()
    MainSwipeView(viewModel: vm)
}

#Preview("Empty") {
    MainSwipeView(viewModel: SpreadViewModel())
}
