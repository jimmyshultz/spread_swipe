//
//  SpreadCacheService.swift
//  SpreadSwipe Watch App
//
//  Created by Jimmy Shultz on 2/28/26.
//

import Foundation

/// Caches the last-known spread info for each team along with a timestamp.
/// Ensures the app is never completely blank even when offline.
struct SpreadCacheService {
    
    private static let cacheKey = "spreadCache_v2"
    
    /// How long a cached spread is considered "fresh" (3 hours).
    private static let freshnessDuration: TimeInterval = 3 * 60 * 60
    
    /// A single cached spread entry.
    private struct CachedSpread: Codable {
        let gameInfo: SpreadState.GameInfo
        let timestamp: Date
    }
    
    /// Retrieves the cached game info for a team, if available.
    static func getCachedSpread(for teamId: String) -> (gameInfo: SpreadState.GameInfo, timestamp: Date)? {
        guard let cache = loadCache(),
              let entry = cache[teamId] else {
            return nil
        }
        return (entry.gameInfo, entry.timestamp)
    }
    
    /// Stores game info in the cache for the given team.
    static func cacheSpread(_ gameInfo: SpreadState.GameInfo, for teamId: String) {
        var cache = loadCache() ?? [:]
        cache[teamId] = CachedSpread(gameInfo: gameInfo, timestamp: Date())
        saveCache(cache)
    }
    
    /// Checks if the cached spread for a team is still fresh (< 3 hours old).
    static func isCacheFresh(for teamId: String) -> Bool {
        guard let entry = getCachedSpread(for: teamId) else { return false }
        return Date().timeIntervalSince(entry.timestamp) < freshnessDuration
    }
    
    /// Clears the entire cache.
    static func clearCache() {
        UserDefaults.standard.removeObject(forKey: cacheKey)
    }
    
    /// Removes the cached entry for a specific team.
    static func removeCachedSpread(for teamId: String) {
        var cache = loadCache() ?? [:]
        cache.removeValue(forKey: teamId)
        saveCache(cache)
    }
    
    // MARK: - Private Helpers
    
    private static func loadCache() -> [String: CachedSpread]? {
        guard let data = UserDefaults.standard.data(forKey: cacheKey) else { return nil }
        return try? JSONDecoder().decode([String: CachedSpread].self, from: data)
    }
    
    private static func saveCache(_ cache: [String: CachedSpread]) {
        if let data = try? JSONEncoder().encode(cache) {
            UserDefaults.standard.set(data, forKey: cacheKey)
        }
    }
}
