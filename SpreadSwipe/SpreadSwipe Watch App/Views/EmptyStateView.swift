//
//  EmptyStateView.swift
//  SpreadSwipe Watch App
//
//  Created by Jimmy Shultz on 2/28/26.
//

import SwiftUI

/// Shown when no teams are selected. Prompts the user to add teams.
struct EmptyStateView: View {
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            VStack(spacing: 12) {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 44, height: 44)
                    .foregroundStyle(.green)
                
                Text("Add Teams")
                    .font(.system(size: 14, weight: .medium, design: .rounded))
                    .foregroundColor(.gray)
            }
        }
        .buttonStyle(.plain)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
    }
}

#Preview {
    EmptyStateView(onTap: {})
}
