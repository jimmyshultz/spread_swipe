//
//  TeamListView.swift
//  SpreadSwipe Watch App
//
//  Created by Jimmy Shultz on 2/28/26.
//

import SwiftUI

/// Level 2 of the team selection flow: pick a team within a league.
/// Shows an alphabetical list with checkmarks for selected teams.
struct TeamListView: View {
    @ObservedObject var viewModel: SpreadViewModel
    let league: League
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        List(TeamRegistry.teams(for: league)) { team in
            Button {
                handleTeamTap(team)
            } label: {
                HStack {
                    Text(team.apiName)
                        .font(.system(size: 13, design: .rounded))
                        .foregroundColor(.white)
                        .lineLimit(1)
                    
                    Spacer()
                    
                    if viewModel.isSelected(team) {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundStyle(.green)
                    }
                }
            }
            .listRowBackground(
                viewModel.isSelected(team)
                    ? Color.green.opacity(0.15)
                    : Color.clear
            )
        }
        .navigationTitle(league.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .alert("Team Limit", isPresented: Binding(
            get: { viewModel.maxTeamAlert != nil },
            set: { if !$0 { viewModel.maxTeamAlert = nil } }
        )) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(viewModel.maxTeamAlert ?? "")
        }
    }
    
    /// Handles tapping on a team — toggles selection.
    private func handleTeamTap(_ team: Team) {
        if viewModel.isSelected(team) {
            viewModel.removeTeam(team)
        } else {
            viewModel.addTeam(team)
        }
    }
}

#Preview {
    NavigationStack {
        TeamListView(viewModel: SpreadViewModel(), league: .nfl)
    }
}
