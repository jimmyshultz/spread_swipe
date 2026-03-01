//
//  SettingsView.swift
//  SpreadSwipe Watch App
//
//  Created by Jimmy Shultz on 2/28/26.
//

import SwiftUI

/// Settings view for managing selected teams.
/// Shows the active team list with swipe-to-delete and an "Add Team" button.
struct SettingsView: View {
    @ObservedObject var viewModel: SpreadViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            List {
                // Active teams section
                if !viewModel.teamContexts.isEmpty {
                    Section {
                        ForEach(viewModel.teamContexts) { context in
                            HStack {
                                // League icon
                                Image(systemName: context.team.league.sfSymbol)
                                    .foregroundStyle(.secondary)
                                    .frame(width: 20)
                                
                                // Team name (just for settings identification)
                                Text(context.team.apiName)
                                    .font(.system(size: 14, design: .rounded))
                                    .lineLimit(1)
                            }
                        }
                        .onDelete { offsets in
                            viewModel.removeTeam(at: offsets)
                        }
                    } header: {
                        Text("My Teams (\(viewModel.teamContexts.count)/\(UserPreferences.maxTeams))")
                    }
                }
                
                // Add team button
                Section {
                    NavigationLink {
                        LeagueListView(viewModel: viewModel)
                    } label: {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                                .foregroundStyle(.green)
                            Text("Add Team")
                                .font(.system(size: 14, weight: .medium, design: .rounded))
                        }
                    }
                    .disabled(!viewModel.canAddTeam)
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
        }
        .alert("Team Limit", isPresented: Binding(
            get: { viewModel.maxTeamAlert != nil },
            set: { if !$0 { viewModel.maxTeamAlert = nil } }
        )) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(viewModel.maxTeamAlert ?? "")
        }
    }
}

#Preview {
    SettingsView(viewModel: SpreadViewModel())
}
