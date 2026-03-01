//
//  TeamRegistry.swift
//  SpreadSwipe Watch App
//
//  Created by Jimmy Shultz on 2/28/26.
//

import Foundation

/// Static registry of all teams across all supported leagues.
/// Team `apiName` values must exactly match the names returned by The Odds API.
struct TeamRegistry {
    
    // MARK: - NFL (32 teams)
    
    static let nflTeams: [Team] = [
        Team(id: "NFL_ARI", league: .nfl, apiName: "Arizona Cardinals", assetName: "logo_nfl_ari"),
        Team(id: "NFL_ATL", league: .nfl, apiName: "Atlanta Falcons", assetName: "logo_nfl_atl"),
        Team(id: "NFL_BAL", league: .nfl, apiName: "Baltimore Ravens", assetName: "logo_nfl_bal"),
        Team(id: "NFL_BUF", league: .nfl, apiName: "Buffalo Bills", assetName: "logo_nfl_buf"),
        Team(id: "NFL_CAR", league: .nfl, apiName: "Carolina Panthers", assetName: "logo_nfl_car"),
        Team(id: "NFL_CHI", league: .nfl, apiName: "Chicago Bears", assetName: "logo_nfl_chi"),
        Team(id: "NFL_CIN", league: .nfl, apiName: "Cincinnati Bengals", assetName: "logo_nfl_cin"),
        Team(id: "NFL_CLE", league: .nfl, apiName: "Cleveland Browns", assetName: "logo_nfl_cle"),
        Team(id: "NFL_DAL", league: .nfl, apiName: "Dallas Cowboys", assetName: "logo_nfl_dal"),
        Team(id: "NFL_DEN", league: .nfl, apiName: "Denver Broncos", assetName: "logo_nfl_den"),
        Team(id: "NFL_DET", league: .nfl, apiName: "Detroit Lions", assetName: "logo_nfl_det"),
        Team(id: "NFL_GB", league: .nfl, apiName: "Green Bay Packers", assetName: "logo_nfl_gb"),
        Team(id: "NFL_HOU", league: .nfl, apiName: "Houston Texans", assetName: "logo_nfl_hou"),
        Team(id: "NFL_IND", league: .nfl, apiName: "Indianapolis Colts", assetName: "logo_nfl_ind"),
        Team(id: "NFL_JAX", league: .nfl, apiName: "Jacksonville Jaguars", assetName: "logo_nfl_jax"),
        Team(id: "NFL_KC", league: .nfl, apiName: "Kansas City Chiefs", assetName: "logo_nfl_kc"),
        Team(id: "NFL_LV", league: .nfl, apiName: "Las Vegas Raiders", assetName: "logo_nfl_lv"),
        Team(id: "NFL_LAC", league: .nfl, apiName: "Los Angeles Chargers", assetName: "logo_nfl_lac"),
        Team(id: "NFL_LAR", league: .nfl, apiName: "Los Angeles Rams", assetName: "logo_nfl_lar"),
        Team(id: "NFL_MIA", league: .nfl, apiName: "Miami Dolphins", assetName: "logo_nfl_mia"),
        Team(id: "NFL_MIN", league: .nfl, apiName: "Minnesota Vikings", assetName: "logo_nfl_min"),
        Team(id: "NFL_NE", league: .nfl, apiName: "New England Patriots", assetName: "logo_nfl_ne"),
        Team(id: "NFL_NO", league: .nfl, apiName: "New Orleans Saints", assetName: "logo_nfl_no"),
        Team(id: "NFL_NYG", league: .nfl, apiName: "New York Giants", assetName: "logo_nfl_nyg"),
        Team(id: "NFL_NYJ", league: .nfl, apiName: "New York Jets", assetName: "logo_nfl_nyj"),
        Team(id: "NFL_PHI", league: .nfl, apiName: "Philadelphia Eagles", assetName: "logo_nfl_phi"),
        Team(id: "NFL_PIT", league: .nfl, apiName: "Pittsburgh Steelers", assetName: "logo_nfl_pit"),
        Team(id: "NFL_SF", league: .nfl, apiName: "San Francisco 49ers", assetName: "logo_nfl_sf"),
        Team(id: "NFL_SEA", league: .nfl, apiName: "Seattle Seahawks", assetName: "logo_nfl_sea"),
        Team(id: "NFL_TB", league: .nfl, apiName: "Tampa Bay Buccaneers", assetName: "logo_nfl_tb"),
        Team(id: "NFL_TEN", league: .nfl, apiName: "Tennessee Titans", assetName: "logo_nfl_ten"),
        Team(id: "NFL_WAS", league: .nfl, apiName: "Washington Commanders", assetName: "logo_nfl_was"),
    ]
    
    // MARK: - NBA (30 teams)
    
    static let nbaTeams: [Team] = [
        Team(id: "NBA_ATL", league: .nba, apiName: "Atlanta Hawks", assetName: "logo_nba_atl"),
        Team(id: "NBA_BOS", league: .nba, apiName: "Boston Celtics", assetName: "logo_nba_bos"),
        Team(id: "NBA_BKN", league: .nba, apiName: "Brooklyn Nets", assetName: "logo_nba_bkn"),
        Team(id: "NBA_CHA", league: .nba, apiName: "Charlotte Hornets", assetName: "logo_nba_cha"),
        Team(id: "NBA_CHI", league: .nba, apiName: "Chicago Bulls", assetName: "logo_nba_chi"),
        Team(id: "NBA_CLE", league: .nba, apiName: "Cleveland Cavaliers", assetName: "logo_nba_cle"),
        Team(id: "NBA_DAL", league: .nba, apiName: "Dallas Mavericks", assetName: "logo_nba_dal"),
        Team(id: "NBA_DEN", league: .nba, apiName: "Denver Nuggets", assetName: "logo_nba_den"),
        Team(id: "NBA_DET", league: .nba, apiName: "Detroit Pistons", assetName: "logo_nba_det"),
        Team(id: "NBA_GSW", league: .nba, apiName: "Golden State Warriors", assetName: "logo_nba_gsw"),
        Team(id: "NBA_HOU", league: .nba, apiName: "Houston Rockets", assetName: "logo_nba_hou"),
        Team(id: "NBA_IND", league: .nba, apiName: "Indiana Pacers", assetName: "logo_nba_ind"),
        Team(id: "NBA_LAC", league: .nba, apiName: "Los Angeles Clippers", assetName: "logo_nba_lac"),
        Team(id: "NBA_LAL", league: .nba, apiName: "Los Angeles Lakers", assetName: "logo_nba_lal"),
        Team(id: "NBA_MEM", league: .nba, apiName: "Memphis Grizzlies", assetName: "logo_nba_mem"),
        Team(id: "NBA_MIA", league: .nba, apiName: "Miami Heat", assetName: "logo_nba_mia"),
        Team(id: "NBA_MIL", league: .nba, apiName: "Milwaukee Bucks", assetName: "logo_nba_mil"),
        Team(id: "NBA_MIN", league: .nba, apiName: "Minnesota Timberwolves", assetName: "logo_nba_min"),
        Team(id: "NBA_NOP", league: .nba, apiName: "New Orleans Pelicans", assetName: "logo_nba_nop"),
        Team(id: "NBA_NYK", league: .nba, apiName: "New York Knicks", assetName: "logo_nba_nyk"),
        Team(id: "NBA_OKC", league: .nba, apiName: "Oklahoma City Thunder", assetName: "logo_nba_okc"),
        Team(id: "NBA_ORL", league: .nba, apiName: "Orlando Magic", assetName: "logo_nba_orl"),
        Team(id: "NBA_PHI", league: .nba, apiName: "Philadelphia 76ers", assetName: "logo_nba_phi"),
        Team(id: "NBA_PHX", league: .nba, apiName: "Phoenix Suns", assetName: "logo_nba_phx"),
        Team(id: "NBA_POR", league: .nba, apiName: "Portland Trail Blazers", assetName: "logo_nba_por"),
        Team(id: "NBA_SAC", league: .nba, apiName: "Sacramento Kings", assetName: "logo_nba_sac"),
        Team(id: "NBA_SAS", league: .nba, apiName: "San Antonio Spurs", assetName: "logo_nba_sas"),
        Team(id: "NBA_TOR", league: .nba, apiName: "Toronto Raptors", assetName: "logo_nba_tor"),
        Team(id: "NBA_UTA", league: .nba, apiName: "Utah Jazz", assetName: "logo_nba_uta"),
        Team(id: "NBA_WAS", league: .nba, apiName: "Washington Wizards", assetName: "logo_nba_was"),
    ]
    
    // MARK: - MLB (30 teams)
    
    static let mlbTeams: [Team] = [
        Team(id: "MLB_ARI", league: .mlb, apiName: "Arizona Diamondbacks", assetName: "logo_mlb_ari"),
        Team(id: "MLB_ATL", league: .mlb, apiName: "Atlanta Braves", assetName: "logo_mlb_atl"),
        Team(id: "MLB_BAL", league: .mlb, apiName: "Baltimore Orioles", assetName: "logo_mlb_bal"),
        Team(id: "MLB_BOS", league: .mlb, apiName: "Boston Red Sox", assetName: "logo_mlb_bos"),
        Team(id: "MLB_CHC", league: .mlb, apiName: "Chicago Cubs", assetName: "logo_mlb_chc"),
        Team(id: "MLB_CWS", league: .mlb, apiName: "Chicago White Sox", assetName: "logo_mlb_cws"),
        Team(id: "MLB_CIN", league: .mlb, apiName: "Cincinnati Reds", assetName: "logo_mlb_cin"),
        Team(id: "MLB_CLE", league: .mlb, apiName: "Cleveland Guardians", assetName: "logo_mlb_cle"),
        Team(id: "MLB_COL", league: .mlb, apiName: "Colorado Rockies", assetName: "logo_mlb_col"),
        Team(id: "MLB_DET", league: .mlb, apiName: "Detroit Tigers", assetName: "logo_mlb_det"),
        Team(id: "MLB_HOU", league: .mlb, apiName: "Houston Astros", assetName: "logo_mlb_hou"),
        Team(id: "MLB_KC", league: .mlb, apiName: "Kansas City Royals", assetName: "logo_mlb_kc"),
        Team(id: "MLB_LAA", league: .mlb, apiName: "Los Angeles Angels", assetName: "logo_mlb_laa"),
        Team(id: "MLB_LAD", league: .mlb, apiName: "Los Angeles Dodgers", assetName: "logo_mlb_lad"),
        Team(id: "MLB_MIA", league: .mlb, apiName: "Miami Marlins", assetName: "logo_mlb_mia"),
        Team(id: "MLB_MIL", league: .mlb, apiName: "Milwaukee Brewers", assetName: "logo_mlb_mil"),
        Team(id: "MLB_MIN", league: .mlb, apiName: "Minnesota Twins", assetName: "logo_mlb_min"),
        Team(id: "MLB_NYM", league: .mlb, apiName: "New York Mets", assetName: "logo_mlb_nym"),
        Team(id: "MLB_NYY", league: .mlb, apiName: "New York Yankees", assetName: "logo_mlb_nyy"),
        Team(id: "MLB_OAK", league: .mlb, apiName: "Oakland Athletics", assetName: "logo_mlb_oak"),
        Team(id: "MLB_PHI", league: .mlb, apiName: "Philadelphia Phillies", assetName: "logo_mlb_phi"),
        Team(id: "MLB_PIT", league: .mlb, apiName: "Pittsburgh Pirates", assetName: "logo_mlb_pit"),
        Team(id: "MLB_SD", league: .mlb, apiName: "San Diego Padres", assetName: "logo_mlb_sd"),
        Team(id: "MLB_SF", league: .mlb, apiName: "San Francisco Giants", assetName: "logo_mlb_sf"),
        Team(id: "MLB_SEA", league: .mlb, apiName: "Seattle Mariners", assetName: "logo_mlb_sea"),
        Team(id: "MLB_STL", league: .mlb, apiName: "St. Louis Cardinals", assetName: "logo_mlb_stl"),
        Team(id: "MLB_TB", league: .mlb, apiName: "Tampa Bay Rays", assetName: "logo_mlb_tb"),
        Team(id: "MLB_TEX", league: .mlb, apiName: "Texas Rangers", assetName: "logo_mlb_tex"),
        Team(id: "MLB_TOR", league: .mlb, apiName: "Toronto Blue Jays", assetName: "logo_mlb_tor"),
        Team(id: "MLB_WAS", league: .mlb, apiName: "Washington Nationals", assetName: "logo_mlb_was"),
    ]
    
    // MARK: - NHL (32 teams)
    
    static let nhlTeams: [Team] = [
        Team(id: "NHL_ANA", league: .nhl, apiName: "Anaheim Ducks", assetName: "logo_nhl_ana"),
        Team(id: "NHL_BOS", league: .nhl, apiName: "Boston Bruins", assetName: "logo_nhl_bos"),
        Team(id: "NHL_BUF", league: .nhl, apiName: "Buffalo Sabres", assetName: "logo_nhl_buf"),
        Team(id: "NHL_CGY", league: .nhl, apiName: "Calgary Flames", assetName: "logo_nhl_cgy"),
        Team(id: "NHL_CAR", league: .nhl, apiName: "Carolina Hurricanes", assetName: "logo_nhl_car"),
        Team(id: "NHL_CHI", league: .nhl, apiName: "Chicago Blackhawks", assetName: "logo_nhl_chi"),
        Team(id: "NHL_COL", league: .nhl, apiName: "Colorado Avalanche", assetName: "logo_nhl_col"),
        Team(id: "NHL_CBJ", league: .nhl, apiName: "Columbus Blue Jackets", assetName: "logo_nhl_cbj"),
        Team(id: "NHL_DAL", league: .nhl, apiName: "Dallas Stars", assetName: "logo_nhl_dal"),
        Team(id: "NHL_DET", league: .nhl, apiName: "Detroit Red Wings", assetName: "logo_nhl_det"),
        Team(id: "NHL_EDM", league: .nhl, apiName: "Edmonton Oilers", assetName: "logo_nhl_edm"),
        Team(id: "NHL_FLA", league: .nhl, apiName: "Florida Panthers", assetName: "logo_nhl_fla"),
        Team(id: "NHL_LA", league: .nhl, apiName: "Los Angeles Kings", assetName: "logo_nhl_la"),
        Team(id: "NHL_MIN", league: .nhl, apiName: "Minnesota Wild", assetName: "logo_nhl_min"),
        Team(id: "NHL_MTL", league: .nhl, apiName: "Montréal Canadiens", assetName: "logo_nhl_mtl"),
        Team(id: "NHL_NSH", league: .nhl, apiName: "Nashville Predators", assetName: "logo_nhl_nsh"),
        Team(id: "NHL_NJ", league: .nhl, apiName: "New Jersey Devils", assetName: "logo_nhl_nj"),
        Team(id: "NHL_NYI", league: .nhl, apiName: "New York Islanders", assetName: "logo_nhl_nyi"),
        Team(id: "NHL_NYR", league: .nhl, apiName: "New York Rangers", assetName: "logo_nhl_nyr"),
        Team(id: "NHL_OTT", league: .nhl, apiName: "Ottawa Senators", assetName: "logo_nhl_ott"),
        Team(id: "NHL_PHI", league: .nhl, apiName: "Philadelphia Flyers", assetName: "logo_nhl_phi"),
        Team(id: "NHL_PIT", league: .nhl, apiName: "Pittsburgh Penguins", assetName: "logo_nhl_pit"),
        Team(id: "NHL_SJ", league: .nhl, apiName: "San Jose Sharks", assetName: "logo_nhl_sj"),
        Team(id: "NHL_SEA", league: .nhl, apiName: "Seattle Kraken", assetName: "logo_nhl_sea"),
        Team(id: "NHL_STL", league: .nhl, apiName: "St Louis Blues", assetName: "logo_nhl_stl"),
        Team(id: "NHL_TB", league: .nhl, apiName: "Tampa Bay Lightning", assetName: "logo_nhl_tb"),
        Team(id: "NHL_TOR", league: .nhl, apiName: "Toronto Maple Leafs", assetName: "logo_nhl_tor"),
        Team(id: "NHL_UTA", league: .nhl, apiName: "Utah Mammoth", assetName: "logo_nhl_uta"),
        Team(id: "NHL_VAN", league: .nhl, apiName: "Vancouver Canucks", assetName: "logo_nhl_van"),
        Team(id: "NHL_VGK", league: .nhl, apiName: "Vegas Golden Knights", assetName: "logo_nhl_vgk"),
        Team(id: "NHL_WAS", league: .nhl, apiName: "Washington Capitals", assetName: "logo_nhl_was"),
        Team(id: "NHL_WPG", league: .nhl, apiName: "Winnipeg Jets", assetName: "logo_nhl_wpg"),
    ]
    
    // MARK: - MLS (29 teams)
    
    static let mlsTeams: [Team] = [
        Team(id: "MLS_ATL", league: .mls, apiName: "Atlanta United FC", assetName: "logo_mls_atl"),
        Team(id: "MLS_AUS", league: .mls, apiName: "Austin FC", assetName: "logo_mls_aus"),
        Team(id: "MLS_CHA", league: .mls, apiName: "Charlotte FC", assetName: "logo_mls_cha"),
        Team(id: "MLS_CHI", league: .mls, apiName: "Chicago Fire FC", assetName: "logo_mls_chi"),
        Team(id: "MLS_CIN", league: .mls, apiName: "FC Cincinnati", assetName: "logo_mls_cin"),
        Team(id: "MLS_COL", league: .mls, apiName: "Colorado Rapids", assetName: "logo_mls_col"),
        Team(id: "MLS_CLB", league: .mls, apiName: "Columbus Crew SC", assetName: "logo_mls_clb"),
        Team(id: "MLS_DAL", league: .mls, apiName: "FC Dallas", assetName: "logo_mls_dal"),
        Team(id: "MLS_DC", league: .mls, apiName: "D.C. United", assetName: "logo_mls_dc"),
        Team(id: "MLS_HOU", league: .mls, apiName: "Houston Dynamo", assetName: "logo_mls_hou"),
        Team(id: "MLS_IA", league: .mls, apiName: "Inter Miami CF", assetName: "logo_mls_ia"),
        Team(id: "MLS_LA", league: .mls, apiName: "LA Galaxy", assetName: "logo_mls_la"),
        Team(id: "MLS_LAFC", league: .mls, apiName: "Los Angeles FC", assetName: "logo_mls_lafc"),
        Team(id: "MLS_MIN", league: .mls, apiName: "Minnesota United FC", assetName: "logo_mls_min"),
        Team(id: "MLS_MTL", league: .mls, apiName: "CF Montreal", assetName: "logo_mls_mtl"),
        Team(id: "MLS_NSH", league: .mls, apiName: "Nashville SC", assetName: "logo_mls_nsh"),
        Team(id: "MLS_NE", league: .mls, apiName: "New England Revolution", assetName: "logo_mls_ne"),
        Team(id: "MLS_NYC", league: .mls, apiName: "New York City FC", assetName: "logo_mls_nyc"),
        Team(id: "MLS_RB", league: .mls, apiName: "New York Red Bulls", assetName: "logo_mls_rb"),
        Team(id: "MLS_ORL", league: .mls, apiName: "Orlando City SC", assetName: "logo_mls_orl"),
        Team(id: "MLS_PHI", league: .mls, apiName: "Philadelphia Union", assetName: "logo_mls_phi"),
        Team(id: "MLS_POR", league: .mls, apiName: "Portland Timbers", assetName: "logo_mls_por"),
        Team(id: "MLS_RSL", league: .mls, apiName: "Real Salt Lake", assetName: "logo_mls_rsl"),
        Team(id: "MLS_SJ", league: .mls, apiName: "San Jose Earthquakes", assetName: "logo_mls_sj"),
        Team(id: "MLS_SEA", league: .mls, apiName: "Seattle Sounders FC", assetName: "logo_mls_sea"),
        Team(id: "MLS_SKC", league: .mls, apiName: "Sporting Kansas City", assetName: "logo_mls_skc"),
        Team(id: "MLS_STL", league: .mls, apiName: "St. Louis City SC", assetName: "logo_mls_stl"),
        Team(id: "MLS_TOR", league: .mls, apiName: "Toronto FC", assetName: "logo_mls_tor"),
        Team(id: "MLS_VAN", league: .mls, apiName: "Vancouver Whitecaps FC", assetName: "logo_mls_van"),
        Team(id: "MLS_SD", league: .mls, apiName: "San Diego FC", assetName: "logo_mls_sd"),
    ]
    
    // MARK: - Lookup Helpers
    
    /// All teams across all leagues, sorted alphabetically within each league.
    static var allTeams: [Team] {
        nflTeams + nbaTeams + mlbTeams + nhlTeams + mlsTeams
    }
    
    /// Returns all teams for a specific league, sorted alphabetically by apiName.
    static func teams(for league: League) -> [Team] {
        switch league {
        case .nfl: return nflTeams.sorted { $0.apiName < $1.apiName }
        case .nba: return nbaTeams.sorted { $0.apiName < $1.apiName }
        case .mlb: return mlbTeams.sorted { $0.apiName < $1.apiName }
        case .nhl: return nhlTeams.sorted { $0.apiName < $1.apiName }
        case .mls: return mlsTeams.sorted { $0.apiName < $1.apiName }
        }
    }
    
    /// Finds a team by its ID.
    static func team(byId id: String) -> Team? {
        allTeams.first { $0.id == id }
    }
    
    /// Finds a team by its Odds API name within a given league.
    static func team(byApiName name: String, league: League) -> Team? {
        teams(for: league).first { $0.apiName == name }
    }
}
