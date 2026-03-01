//
//  BackgroundRefreshManager.swift
//  SpreadSwipe Watch App
//
//  Created by Jimmy Shultz on 2/28/26.
//

import Foundation
import WatchKit

/// Manages background app refresh for silently updating spread data.
/// Schedules refresh every ~6 hours (2 refreshes per day) to stay
/// within the 500-credit/month API budget.
class BackgroundRefreshManager {
    
    static let shared = BackgroundRefreshManager()
    
    /// Interval between background refreshes: 6 hours.
    /// At 2 refreshes/day × up to 5 leagues × 30 days = 300 credits/month max.
    private let refreshInterval: TimeInterval = 6 * 60 * 60
    
    private init() {}
    
    // MARK: - Scheduling
    
    /// Schedules the next background refresh.
    func scheduleNextRefresh() {
        let preferredDate = Date().addingTimeInterval(refreshInterval)
        
        WKApplication.shared().scheduleBackgroundRefresh(
            withPreferredDate: preferredDate,
            userInfo: nil
        ) { error in
            if let error = error {
                print("[BackgroundRefresh] Failed to schedule: \(error)")
            } else {
                print("[BackgroundRefresh] Scheduled for \(preferredDate)")
            }
        }
    }
    
    // MARK: - Handling
    
    /// Handles a background refresh task by fetching fresh spreads.
    @MainActor
    func handleBackgroundRefresh(
        task: WKApplicationRefreshBackgroundTask,
        viewModel: SpreadViewModel
    ) async {
        print("[BackgroundRefresh] Starting background fetch")
        
        // Fetch fresh spreads
        await viewModel.loadSpreads()
        
        // Schedule the next refresh
        scheduleNextRefresh()
        
        // Mark the task as complete
        task.setTaskCompletedWithSnapshot(true)
        
        print("[BackgroundRefresh] Completed")
    }
}
