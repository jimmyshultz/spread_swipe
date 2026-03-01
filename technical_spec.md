Technical Specification: SpreadSwipe (watchOS)
1. Project Overview

    App Name: SpreadSwipe (Placeholder)

    Platform: Standalone Apple Watch Application (watchOS 10+ target).

    Core Philosophy: Extreme minimalism. The user gets in, sees the spread for their favorite teams instantly, and drops their wrist. Zero clutter.

    Scope: Supports up to 5 favorite teams concurrently, drawn exclusively from the NFL, NBA, MLB, NHL, and MLS.

2. Architecture & Tech Stack

    UI Framework: SwiftUI.

    Architecture Pattern: MVVM (Model-View-ViewModel) paired with an ObservableObject or @Observable macro for global state.

    Local Storage: UserDefaults (using @AppStorage for lightweight saving of the 5 selected team IDs) or SwiftData if future expansion is planned.

    Network: Standard URLSession utilizing async/await concurrency.

3. User Interface (UI) Requirements
3.1 Main View (The "Swipe" Interface)

    Component: SwiftUI TabView configured with .tabViewStyle(.page).

    State Empty: If no teams are selected, show a single page with a generic "+" icon prompting the user to go to Settings.

    State Populated: 1 to 5 pages, one for each selected team.

    Page Layout Constraints:

        Background: Solid Color.black (recommended for OLED screen blending) or a very dark, heavily dimmed gradient of the team's primary color.

        Center Element: High-resolution local SVG logo. Use .resizable(), .scaledToFit(), and add padding so it breathes well within the circular/rectangular watch face.

        Top Right Element: A Text view anchored using a ZStack and .topTrailing alignment.

        Typography: Large, legible, bold font for the spread (e.g., .font(.system(size: 24, weight: .bold, design: .rounded))). Color should be high-contrast (e.g., White or Neon Green).

    STRICT RULE: Do not render team names, opponent names, dates, times, or moneyline odds. Render only the logo and the spread.

3.2 Team Selection / Settings View

    Trigger: A .onLongPressGesture on the Main View, or an "Edit" button on the final tab page.

    Selection Flow (Hierarchical List):

        Level 1: Select League (List showing NFL, NBA, MLB, NHL, MLS).

        Level 2: Select Team (Alphabetical list of teams within that league).

    Validation: The view model must enforce a hard limit of 5 selected teams. If the user attempts to add a 6th, disable the add function or present an alert: "Maximum 5 teams. Remove one to add another."

    Deletion: Users must be able to swipe-to-delete teams from their active list.

4. Data Models

These models dictate how the app handles local state and API mapping.
Swift

import Foundation

// Defines the supported leagues and maps to the API's expected sport keys
enum League: String, Codable, CaseIterable {
    case nfl = "americanfootball_nfl"
    case nba = "basketball_nba"
    case mlb = "baseball_mlb"
    case nhl = "icehockey_nhl"
    case mls = "soccer_usa_mls"
    
    var displayName: String {
        switch self {
        case .nfl: return "NFL"
        case .nba: return "NBA"
        case .mlb: return "MLB"
        case .nhl: return "NHL"
        case .mls: return "MLS"
        }
    }
}

// Represents a team locally and in user preferences
struct Team: Identifiable, Codable, Hashable {
    let id: String         // e.g., "NFL_DAL"
    let league: League     // e.g., .nfl
    let apiName: String    // e.g., "Dallas Cowboys" (Used to match JSON)
    let assetName: String  // e.g., "logo_nfl_dal"
}

// Represents the UI state for the top-right text
enum SpreadState: Equatable {
    case loading
    case noGameScheduled // Renders as "-" or "Off"
    case spread(String)  // Renders as e.g., "+3.5", "-7.0", or "PK"
    case error           // Renders as "?"
}

// Wrapper for the team and its current spread status
struct TeamSpreadContext: Identifiable {
    var id: String { team.id }
    let team: Team
    var spreadState: SpreadState
}

5. API Integration & Network Logic

    Provider: The Odds API (or equivalent).

    Endpoint Strategy: Do not pull the entire global sports schedule. Iterate through the user's selected League types and hit the specific endpoint for those sports only.

    Response Parsing: * Filter the JSON response for games where either the home_team or away_team matches the Team.apiName.

        Extract the h2h (head-to-head) or spreads market.

        If the selected team is the underdog, ensure the positive sign + is explicitly prepended. If the spread is 0, format as "PK".

    Caching: Store the last known spread in UserDefaults with a timestamp. If the network is unavailable on app launch, display the cached spread to ensure the app is never completely blank.

6. Asset Management

    Format: Bundle all 153 team logos directly in the watchOS app Assets.xcassets folder as vector formats (SVG/PDF).

    Naming Convention: Assets MUST follow a strict, predictable naming convention mapped to the Team.assetName property to allow programmatic loading: logo_{league}_{team_abbreviation}.

        Example: logo_nfl_dal, logo_nba_lal, logo_mlb_nyy.

    Processing: Ensure all logos have transparent backgrounds and are cropped tightly to the edges of the logo to prevent uneven scaling in the UI.

7. App Lifecycle & Background Refresh

    Background Task: Implement WKApplicationRefreshBackgroundTask.

    Frequency: Request a background execution roughly every 3 to 6 hours.

    Execution: When the watch wakes the app in the background, it should silently hit the odds API, update the cached spreads, and tell the UI to redraw. This guarantees that when the user raises their wrist, the data is perfectly up-to-date with zero loading spinners.