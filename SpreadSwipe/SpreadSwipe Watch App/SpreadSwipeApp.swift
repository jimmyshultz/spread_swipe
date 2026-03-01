//
//  SpreadSwipeApp.swift
//  SpreadSwipe Watch App
//
//  Created by Jimmy Shultz on 2/28/26.
//

import SwiftUI
import WatchKit

@main
struct SpreadSwipeApp: App {
    @StateObject private var viewModel = SpreadViewModel()
    
    @WKApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            MainSwipeView(viewModel: viewModel)
                .onAppear {
                    // Share the view model with the app delegate for background refresh
                    appDelegate.viewModel = viewModel
                    
                    // Schedule the first background refresh
                    BackgroundRefreshManager.shared.scheduleNextRefresh()
                }
        }
    }
}

/// App delegate to handle background tasks on watchOS.
class AppDelegate: NSObject, WKApplicationDelegate {
    
    /// Reference to the view model, set when the app appears.
    var viewModel: SpreadViewModel?
    
    func handle(_ backgroundTasks: Set<WKRefreshBackgroundTask>) {
        for task in backgroundTasks {
            switch task {
            case let refreshTask as WKApplicationRefreshBackgroundTask:
                guard let viewModel = viewModel else {
                    task.setTaskCompletedWithSnapshot(false)
                    return
                }
                
                Task { @MainActor in
                    await BackgroundRefreshManager.shared.handleBackgroundRefresh(
                        task: refreshTask,
                        viewModel: viewModel
                    )
                }
                
            case let snapshotTask as WKSnapshotRefreshBackgroundTask:
                snapshotTask.setTaskCompleted(
                    restoredDefaultState: true,
                    estimatedSnapshotExpiration: Date.distantFuture,
                    userInfo: nil
                )
                
            default:
                task.setTaskCompletedWithSnapshot(false)
            }
        }
    }
}
