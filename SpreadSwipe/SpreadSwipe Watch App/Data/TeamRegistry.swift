//
//  TeamRegistry.swift
//  SpreadSwipe Watch App
//
//  Created by Jimmy Shultz on 2/28/26.
//

import Foundation

/// Static registry of all supported teams across all leagues.
/// Team colors sourced from official team brand guidelines.
struct TeamRegistry {
    
    // MARK: - NFL (32 teams)
    
    static let nflTeams: [Team] = [
        Team(id: "NFL_ARI", league: .nfl, apiName: "Arizona Cardinals", assetName: "logo_nfl_ari", primaryColor: "97233F", secondaryColor: "FFFFFF"),
        Team(id: "NFL_ATL", league: .nfl, apiName: "Atlanta Falcons", assetName: "logo_nfl_atl", primaryColor: "A71930", secondaryColor: "000000"),
        Team(id: "NFL_BAL", league: .nfl, apiName: "Baltimore Ravens", assetName: "logo_nfl_bal", primaryColor: "241773", secondaryColor: "9E7C0C"),
        Team(id: "NFL_BUF", league: .nfl, apiName: "Buffalo Bills", assetName: "logo_nfl_buf", primaryColor: "00338D", secondaryColor: "C60C30"),
        Team(id: "NFL_CAR", league: .nfl, apiName: "Carolina Panthers", assetName: "logo_nfl_car", primaryColor: "0085CA", secondaryColor: "101820"),
        Team(id: "NFL_CHI", league: .nfl, apiName: "Chicago Bears", assetName: "logo_nfl_chi", primaryColor: "0B162A", secondaryColor: "C83803"),
        Team(id: "NFL_CIN", league: .nfl, apiName: "Cincinnati Bengals", assetName: "logo_nfl_cin", primaryColor: "FB4F14", secondaryColor: "000000"),
        Team(id: "NFL_CLE", league: .nfl, apiName: "Cleveland Browns", assetName: "logo_nfl_cle", primaryColor: "311D00", secondaryColor: "FF3C00"),
        Team(id: "NFL_DAL", league: .nfl, apiName: "Dallas Cowboys", assetName: "logo_nfl_dal", primaryColor: "003594", secondaryColor: "FFFFFF"),
        Team(id: "NFL_DEN", league: .nfl, apiName: "Denver Broncos", assetName: "logo_nfl_den", primaryColor: "FB4F14", secondaryColor: "002244"),
        Team(id: "NFL_DET", league: .nfl, apiName: "Detroit Lions", assetName: "logo_nfl_det", primaryColor: "0076B6", secondaryColor: "B0B7BC"),
        Team(id: "NFL_GB", league: .nfl, apiName: "Green Bay Packers", assetName: "logo_nfl_gb", primaryColor: "203731", secondaryColor: "FFB612"),
        Team(id: "NFL_HOU", league: .nfl, apiName: "Houston Texans", assetName: "logo_nfl_hou", primaryColor: "03202F", secondaryColor: "A71930"),
        Team(id: "NFL_IND", league: .nfl, apiName: "Indianapolis Colts", assetName: "logo_nfl_ind", primaryColor: "002C5F", secondaryColor: "FFFFFF"),
        Team(id: "NFL_JAX", league: .nfl, apiName: "Jacksonville Jaguars", assetName: "logo_nfl_jax", primaryColor: "006778", secondaryColor: "D7A22A"),
        Team(id: "NFL_KC", league: .nfl, apiName: "Kansas City Chiefs", assetName: "logo_nfl_kc", primaryColor: "E31837", secondaryColor: "FFB81C"),
        Team(id: "NFL_LV", league: .nfl, apiName: "Las Vegas Raiders", assetName: "logo_nfl_lv", primaryColor: "000000", secondaryColor: "A5ACAF"),
        Team(id: "NFL_LAC", league: .nfl, apiName: "Los Angeles Chargers", assetName: "logo_nfl_lac", primaryColor: "0080C6", secondaryColor: "FFC20E"),
        Team(id: "NFL_LAR", league: .nfl, apiName: "Los Angeles Rams", assetName: "logo_nfl_lar", primaryColor: "003594", secondaryColor: "FFA300"),
        Team(id: "NFL_MIA", league: .nfl, apiName: "Miami Dolphins", assetName: "logo_nfl_mia", primaryColor: "008E97", secondaryColor: "FC4C02"),
        Team(id: "NFL_MIN", league: .nfl, apiName: "Minnesota Vikings", assetName: "logo_nfl_min", primaryColor: "4F2683", secondaryColor: "FFC62F"),
        Team(id: "NFL_NE", league: .nfl, apiName: "New England Patriots", assetName: "logo_nfl_ne", primaryColor: "002244", secondaryColor: "C60C30"),
        Team(id: "NFL_NO", league: .nfl, apiName: "New Orleans Saints", assetName: "logo_nfl_no", primaryColor: "D3BC8D", secondaryColor: "101820"),
        Team(id: "NFL_NYG", league: .nfl, apiName: "New York Giants", assetName: "logo_nfl_nyg", primaryColor: "0B2265", secondaryColor: "A71930"),
        Team(id: "NFL_NYJ", league: .nfl, apiName: "New York Jets", assetName: "logo_nfl_nyj", primaryColor: "125740", secondaryColor: "FFFFFF"),
        Team(id: "NFL_PHI", league: .nfl, apiName: "Philadelphia Eagles", assetName: "logo_nfl_phi", primaryColor: "004C54", secondaryColor: "A5ACAF"),
        Team(id: "NFL_PIT", league: .nfl, apiName: "Pittsburgh Steelers", assetName: "logo_nfl_pit", primaryColor: "FFB612", secondaryColor: "101820"),
        Team(id: "NFL_SF", league: .nfl, apiName: "San Francisco 49ers", assetName: "logo_nfl_sf", primaryColor: "AA0000", secondaryColor: "B3995D"),
        Team(id: "NFL_SEA", league: .nfl, apiName: "Seattle Seahawks", assetName: "logo_nfl_sea", primaryColor: "002244", secondaryColor: "69BE28"),
        Team(id: "NFL_TB", league: .nfl, apiName: "Tampa Bay Buccaneers", assetName: "logo_nfl_tb", primaryColor: "D50A0A", secondaryColor: "34302B"),
        Team(id: "NFL_TEN", league: .nfl, apiName: "Tennessee Titans", assetName: "logo_nfl_ten", primaryColor: "0C2340", secondaryColor: "4B92DB"),
        Team(id: "NFL_WAS", league: .nfl, apiName: "Washington Commanders", assetName: "logo_nfl_was", primaryColor: "5A1414", secondaryColor: "FFB612"),
    ]
    
    // MARK: - NBA (30 teams)
    
    static let nbaTeams: [Team] = [
        Team(id: "NBA_ATL", league: .nba, apiName: "Atlanta Hawks", assetName: "logo_nba_atl", primaryColor: "E03A3E", secondaryColor: "C1D32F"),
        Team(id: "NBA_BOS", league: .nba, apiName: "Boston Celtics", assetName: "logo_nba_bos", primaryColor: "007A33", secondaryColor: "FFFFFF"),
        Team(id: "NBA_BKN", league: .nba, apiName: "Brooklyn Nets", assetName: "logo_nba_bkn", primaryColor: "000000", secondaryColor: "FFFFFF"),
        Team(id: "NBA_CHA", league: .nba, apiName: "Charlotte Hornets", assetName: "logo_nba_cha", primaryColor: "1D1160", secondaryColor: "00788C"),
        Team(id: "NBA_CHI", league: .nba, apiName: "Chicago Bulls", assetName: "logo_nba_chi", primaryColor: "CE1141", secondaryColor: "000000"),
        Team(id: "NBA_CLE", league: .nba, apiName: "Cleveland Cavaliers", assetName: "logo_nba_cle", primaryColor: "860038", secondaryColor: "FDBB30"),
        Team(id: "NBA_DAL", league: .nba, apiName: "Dallas Mavericks", assetName: "logo_nba_dal", primaryColor: "00538C", secondaryColor: "B8C4CA"),
        Team(id: "NBA_DEN", league: .nba, apiName: "Denver Nuggets", assetName: "logo_nba_den", primaryColor: "0E2240", secondaryColor: "FEC524"),
        Team(id: "NBA_DET", league: .nba, apiName: "Detroit Pistons", assetName: "logo_nba_det", primaryColor: "C8102E", secondaryColor: "1D428A"),
        Team(id: "NBA_GSW", league: .nba, apiName: "Golden State Warriors", assetName: "logo_nba_gsw", primaryColor: "1D428A", secondaryColor: "FFC72C"),
        Team(id: "NBA_HOU", league: .nba, apiName: "Houston Rockets", assetName: "logo_nba_hou", primaryColor: "CE1141", secondaryColor: "000000"),
        Team(id: "NBA_IND", league: .nba, apiName: "Indiana Pacers", assetName: "logo_nba_ind", primaryColor: "002D62", secondaryColor: "FDBB30"),
        Team(id: "NBA_LAC", league: .nba, apiName: "Los Angeles Clippers", assetName: "logo_nba_lac", primaryColor: "C8102E", secondaryColor: "1D428A"),
        Team(id: "NBA_LAL", league: .nba, apiName: "Los Angeles Lakers", assetName: "logo_nba_lal", primaryColor: "552583", secondaryColor: "FDB927"),
        Team(id: "NBA_MEM", league: .nba, apiName: "Memphis Grizzlies", assetName: "logo_nba_mem", primaryColor: "5D76A9", secondaryColor: "12173F"),
        Team(id: "NBA_MIA", league: .nba, apiName: "Miami Heat", assetName: "logo_nba_mia", primaryColor: "98002E", secondaryColor: "F9A01B"),
        Team(id: "NBA_MIL", league: .nba, apiName: "Milwaukee Bucks", assetName: "logo_nba_mil", primaryColor: "00471B", secondaryColor: "EEE1C6"),
        Team(id: "NBA_MIN", league: .nba, apiName: "Minnesota Timberwolves", assetName: "logo_nba_min", primaryColor: "0C2340", secondaryColor: "236192"),
        Team(id: "NBA_NOP", league: .nba, apiName: "New Orleans Pelicans", assetName: "logo_nba_nop", primaryColor: "0C2340", secondaryColor: "C8102E"),
        Team(id: "NBA_NYK", league: .nba, apiName: "New York Knicks", assetName: "logo_nba_nyk", primaryColor: "006BB6", secondaryColor: "F58426"),
        Team(id: "NBA_OKC", league: .nba, apiName: "Oklahoma City Thunder", assetName: "logo_nba_okc", primaryColor: "007AC1", secondaryColor: "EF6C00"),
        Team(id: "NBA_ORL", league: .nba, apiName: "Orlando Magic", assetName: "logo_nba_orl", primaryColor: "0077C0", secondaryColor: "C4CED4"),
        Team(id: "NBA_PHI", league: .nba, apiName: "Philadelphia 76ers", assetName: "logo_nba_phi", primaryColor: "006BB6", secondaryColor: "ED174C"),
        Team(id: "NBA_PHX", league: .nba, apiName: "Phoenix Suns", assetName: "logo_nba_phx", primaryColor: "1D1160", secondaryColor: "E56020"),
        Team(id: "NBA_POR", league: .nba, apiName: "Portland Trail Blazers", assetName: "logo_nba_por", primaryColor: "E03A3E", secondaryColor: "000000"),
        Team(id: "NBA_SAC", league: .nba, apiName: "Sacramento Kings", assetName: "logo_nba_sac", primaryColor: "5A2D81", secondaryColor: "63727A"),
        Team(id: "NBA_SAS", league: .nba, apiName: "San Antonio Spurs", assetName: "logo_nba_sas", primaryColor: "C4CED4", secondaryColor: "000000"),
        Team(id: "NBA_TOR", league: .nba, apiName: "Toronto Raptors", assetName: "logo_nba_tor", primaryColor: "CE1141", secondaryColor: "000000"),
        Team(id: "NBA_UTA", league: .nba, apiName: "Utah Jazz", assetName: "logo_nba_uta", primaryColor: "002B5C", secondaryColor: "F9A01B"),
        Team(id: "NBA_WAS", league: .nba, apiName: "Washington Wizards", assetName: "logo_nba_was", primaryColor: "002B5C", secondaryColor: "E31837"),
    ]
    
    // MARK: - MLB (30 teams)
    
    static let mlbTeams: [Team] = [
        Team(id: "MLB_ARI", league: .mlb, apiName: "Arizona Diamondbacks", assetName: "logo_mlb_ari", primaryColor: "A71930", secondaryColor: "E3D4AD"),
        Team(id: "MLB_ATL", league: .mlb, apiName: "Atlanta Braves", assetName: "logo_mlb_atl", primaryColor: "CE1141", secondaryColor: "13274F"),
        Team(id: "MLB_BAL", league: .mlb, apiName: "Baltimore Orioles", assetName: "logo_mlb_bal", primaryColor: "DF4601", secondaryColor: "000000"),
        Team(id: "MLB_BOS", league: .mlb, apiName: "Boston Red Sox", assetName: "logo_mlb_bos", primaryColor: "BD3039", secondaryColor: "0C2340"),
        Team(id: "MLB_CHC", league: .mlb, apiName: "Chicago Cubs", assetName: "logo_mlb_chc", primaryColor: "0E3386", secondaryColor: "CC3433"),
        Team(id: "MLB_CWS", league: .mlb, apiName: "Chicago White Sox", assetName: "logo_mlb_cws", primaryColor: "27251F", secondaryColor: "C4CED4"),
        Team(id: "MLB_CIN", league: .mlb, apiName: "Cincinnati Reds", assetName: "logo_mlb_cin", primaryColor: "C6011F", secondaryColor: "000000"),
        Team(id: "MLB_CLE", league: .mlb, apiName: "Cleveland Guardians", assetName: "logo_mlb_cle", primaryColor: "00385D", secondaryColor: "E31937"),
        Team(id: "MLB_COL", league: .mlb, apiName: "Colorado Rockies", assetName: "logo_mlb_col", primaryColor: "33006F", secondaryColor: "C4CED4"),
        Team(id: "MLB_DET", league: .mlb, apiName: "Detroit Tigers", assetName: "logo_mlb_det", primaryColor: "0C2340", secondaryColor: "FA4616"),
        Team(id: "MLB_HOU", league: .mlb, apiName: "Houston Astros", assetName: "logo_mlb_hou", primaryColor: "002D62", secondaryColor: "EB6E1F"),
        Team(id: "MLB_KC", league: .mlb, apiName: "Kansas City Royals", assetName: "logo_mlb_kc", primaryColor: "004687", secondaryColor: "BD9B60"),
        Team(id: "MLB_LAA", league: .mlb, apiName: "Los Angeles Angels", assetName: "logo_mlb_laa", primaryColor: "BA0021", secondaryColor: "003263"),
        Team(id: "MLB_LAD", league: .mlb, apiName: "Los Angeles Dodgers", assetName: "logo_mlb_lad", primaryColor: "005A9C", secondaryColor: "FFFFFF"),
        Team(id: "MLB_MIA", league: .mlb, apiName: "Miami Marlins", assetName: "logo_mlb_mia", primaryColor: "00A3E0", secondaryColor: "EF3340"),
        Team(id: "MLB_MIL", league: .mlb, apiName: "Milwaukee Brewers", assetName: "logo_mlb_mil", primaryColor: "12284B", secondaryColor: "FFC52F"),
        Team(id: "MLB_MIN", league: .mlb, apiName: "Minnesota Twins", assetName: "logo_mlb_min", primaryColor: "002B5C", secondaryColor: "D31145"),
        Team(id: "MLB_NYM", league: .mlb, apiName: "New York Mets", assetName: "logo_mlb_nym", primaryColor: "002D72", secondaryColor: "FF5910"),
        Team(id: "MLB_NYY", league: .mlb, apiName: "New York Yankees", assetName: "logo_mlb_nyy", primaryColor: "003087", secondaryColor: "FFFFFF"),
        Team(id: "MLB_OAK", league: .mlb, apiName: "Oakland Athletics", assetName: "logo_mlb_oak", primaryColor: "003831", secondaryColor: "EFB21E"),
        Team(id: "MLB_PHI", league: .mlb, apiName: "Philadelphia Phillies", assetName: "logo_mlb_phi", primaryColor: "E81828", secondaryColor: "002D72"),
        Team(id: "MLB_PIT", league: .mlb, apiName: "Pittsburgh Pirates", assetName: "logo_mlb_pit", primaryColor: "27251F", secondaryColor: "FDB827"),
        Team(id: "MLB_SD", league: .mlb, apiName: "San Diego Padres", assetName: "logo_mlb_sd", primaryColor: "2F241D", secondaryColor: "FFC425"),
        Team(id: "MLB_SF", league: .mlb, apiName: "San Francisco Giants", assetName: "logo_mlb_sf", primaryColor: "FD5A1E", secondaryColor: "27251F"),
        Team(id: "MLB_SEA", league: .mlb, apiName: "Seattle Mariners", assetName: "logo_mlb_sea", primaryColor: "0C2C56", secondaryColor: "005C5C"),
        Team(id: "MLB_STL", league: .mlb, apiName: "St. Louis Cardinals", assetName: "logo_mlb_stl", primaryColor: "C41E3A", secondaryColor: "0C2340"),
        Team(id: "MLB_TB", league: .mlb, apiName: "Tampa Bay Rays", assetName: "logo_mlb_tb", primaryColor: "092C5C", secondaryColor: "8FBCE6"),
        Team(id: "MLB_TEX", league: .mlb, apiName: "Texas Rangers", assetName: "logo_mlb_tex", primaryColor: "003278", secondaryColor: "C0111F"),
        Team(id: "MLB_TOR", league: .mlb, apiName: "Toronto Blue Jays", assetName: "logo_mlb_tor", primaryColor: "134A8E", secondaryColor: "E8291C"),
        Team(id: "MLB_WAS", league: .mlb, apiName: "Washington Nationals", assetName: "logo_mlb_was", primaryColor: "AB0003", secondaryColor: "14225A"),
    ]
    
    // MARK: - NHL (32 teams)
    
    static let nhlTeams: [Team] = [
        Team(id: "NHL_ANA", league: .nhl, apiName: "Anaheim Ducks", assetName: "logo_nhl_ana", primaryColor: "F47A38", secondaryColor: "B9975B"),
        Team(id: "NHL_BOS", league: .nhl, apiName: "Boston Bruins", assetName: "logo_nhl_bos", primaryColor: "FFB81C", secondaryColor: "000000"),
        Team(id: "NHL_BUF", league: .nhl, apiName: "Buffalo Sabres", assetName: "logo_nhl_buf", primaryColor: "002654", secondaryColor: "FCB514"),
        Team(id: "NHL_CGY", league: .nhl, apiName: "Calgary Flames", assetName: "logo_nhl_cgy", primaryColor: "D2001C", secondaryColor: "FAAF19"),
        Team(id: "NHL_CAR", league: .nhl, apiName: "Carolina Hurricanes", assetName: "logo_nhl_car", primaryColor: "CC0000", secondaryColor: "000000"),
        Team(id: "NHL_CHI", league: .nhl, apiName: "Chicago Blackhawks", assetName: "logo_nhl_chi", primaryColor: "CF0A2C", secondaryColor: "000000"),
        Team(id: "NHL_COL", league: .nhl, apiName: "Colorado Avalanche", assetName: "logo_nhl_col", primaryColor: "6F263D", secondaryColor: "236192"),
        Team(id: "NHL_CBJ", league: .nhl, apiName: "Columbus Blue Jackets", assetName: "logo_nhl_cbj", primaryColor: "002654", secondaryColor: "CE1141"),
        Team(id: "NHL_DAL", league: .nhl, apiName: "Dallas Stars", assetName: "logo_nhl_dal", primaryColor: "006847", secondaryColor: "8F8F8C"),
        Team(id: "NHL_DET", league: .nhl, apiName: "Detroit Red Wings", assetName: "logo_nhl_det", primaryColor: "CE1141", secondaryColor: "FFFFFF"),
        Team(id: "NHL_EDM", league: .nhl, apiName: "Edmonton Oilers", assetName: "logo_nhl_edm", primaryColor: "041E42", secondaryColor: "FF4C00"),
        Team(id: "NHL_FLA", league: .nhl, apiName: "Florida Panthers", assetName: "logo_nhl_fla", primaryColor: "041E42", secondaryColor: "C8102E"),
        Team(id: "NHL_LA", league: .nhl, apiName: "Los Angeles Kings", assetName: "logo_nhl_la", primaryColor: "111111", secondaryColor: "A2AAAD"),
        Team(id: "NHL_MIN", league: .nhl, apiName: "Minnesota Wild", assetName: "logo_nhl_min", primaryColor: "154734", secondaryColor: "A6192E"),
        Team(id: "NHL_MTL", league: .nhl, apiName: "Montréal Canadiens", assetName: "logo_nhl_mtl", primaryColor: "AF1E2D", secondaryColor: "192168"),
        Team(id: "NHL_NSH", league: .nhl, apiName: "Nashville Predators", assetName: "logo_nhl_nsh", primaryColor: "FFB81C", secondaryColor: "041E42"),
        Team(id: "NHL_NJ", league: .nhl, apiName: "New Jersey Devils", assetName: "logo_nhl_nj", primaryColor: "CE1141", secondaryColor: "000000"),
        Team(id: "NHL_NYI", league: .nhl, apiName: "New York Islanders", assetName: "logo_nhl_nyi", primaryColor: "00539B", secondaryColor: "F47D30"),
        Team(id: "NHL_NYR", league: .nhl, apiName: "New York Rangers", assetName: "logo_nhl_nyr", primaryColor: "0038A8", secondaryColor: "CE1141"),
        Team(id: "NHL_OTT", league: .nhl, apiName: "Ottawa Senators", assetName: "logo_nhl_ott", primaryColor: "C52032", secondaryColor: "C2912C"),
        Team(id: "NHL_PHI", league: .nhl, apiName: "Philadelphia Flyers", assetName: "logo_nhl_phi", primaryColor: "F74902", secondaryColor: "000000"),
        Team(id: "NHL_PIT", league: .nhl, apiName: "Pittsburgh Penguins", assetName: "logo_nhl_pit", primaryColor: "FCB514", secondaryColor: "000000"),
        Team(id: "NHL_SJ", league: .nhl, apiName: "San Jose Sharks", assetName: "logo_nhl_sj", primaryColor: "006D75", secondaryColor: "EA7200"),
        Team(id: "NHL_SEA", league: .nhl, apiName: "Seattle Kraken", assetName: "logo_nhl_sea", primaryColor: "001628", secondaryColor: "99D9D9"),
        Team(id: "NHL_STL", league: .nhl, apiName: "St Louis Blues", assetName: "logo_nhl_stl", primaryColor: "002F87", secondaryColor: "FCB514"),
        Team(id: "NHL_TB", league: .nhl, apiName: "Tampa Bay Lightning", assetName: "logo_nhl_tb", primaryColor: "002868", secondaryColor: "FFFFFF"),
        Team(id: "NHL_TOR", league: .nhl, apiName: "Toronto Maple Leafs", assetName: "logo_nhl_tor", primaryColor: "00205B", secondaryColor: "FFFFFF"),
        Team(id: "NHL_UTA", league: .nhl, apiName: "Utah Mammoth", assetName: "logo_nhl_uta", primaryColor: "6CACE4", secondaryColor: "000000"),
        Team(id: "NHL_VAN", league: .nhl, apiName: "Vancouver Canucks", assetName: "logo_nhl_van", primaryColor: "00205B", secondaryColor: "00843D"),
        Team(id: "NHL_VGK", league: .nhl, apiName: "Vegas Golden Knights", assetName: "logo_nhl_vgk", primaryColor: "B4975A", secondaryColor: "333F42"),
        Team(id: "NHL_WAS", league: .nhl, apiName: "Washington Capitals", assetName: "logo_nhl_was", primaryColor: "C8102E", secondaryColor: "041E42"),
        Team(id: "NHL_WPG", league: .nhl, apiName: "Winnipeg Jets", assetName: "logo_nhl_wpg", primaryColor: "041E42", secondaryColor: "004C97"),
    ]
    
    // MARK: - MLS (30 teams)
    
    static let mlsTeams: [Team] = [
        Team(id: "MLS_ATL", league: .mls, apiName: "Atlanta United FC", assetName: "logo_mls_atl", primaryColor: "80000A", secondaryColor: "A19060"),
        Team(id: "MLS_AUS", league: .mls, apiName: "Austin FC", assetName: "logo_mls_aus", primaryColor: "00B140", secondaryColor: "000000"),
        Team(id: "MLS_CHA", league: .mls, apiName: "Charlotte FC", assetName: "logo_mls_cha", primaryColor: "1A85C8", secondaryColor: "000000"),
        Team(id: "MLS_CHI", league: .mls, apiName: "Chicago Fire FC", assetName: "logo_mls_chi", primaryColor: "FF0000", secondaryColor: "0A174A"),
        Team(id: "MLS_CIN", league: .mls, apiName: "FC Cincinnati", assetName: "logo_mls_cin", primaryColor: "F05323", secondaryColor: "263B80"),
        Team(id: "MLS_COL", league: .mls, apiName: "Colorado Rapids", assetName: "logo_mls_col", primaryColor: "960A2C", secondaryColor: "9CC2EA"),
        Team(id: "MLS_CLB", league: .mls, apiName: "Columbus Crew SC", assetName: "logo_mls_clb", primaryColor: "000000", secondaryColor: "FEDD00"),
        Team(id: "MLS_DAL", league: .mls, apiName: "FC Dallas", assetName: "logo_mls_dal", primaryColor: "BF0D3E", secondaryColor: "002D72"),
        Team(id: "MLS_DC", league: .mls, apiName: "D.C. United", assetName: "logo_mls_dc", primaryColor: "000000", secondaryColor: "EF3E42"),
        Team(id: "MLS_HOU", league: .mls, apiName: "Houston Dynamo", assetName: "logo_mls_hou", primaryColor: "F68712", secondaryColor: "101820"),
        Team(id: "MLS_IA", league: .mls, apiName: "Inter Miami CF", assetName: "logo_mls_ia", primaryColor: "F7B5CD", secondaryColor: "231F20"),
        Team(id: "MLS_LA", league: .mls, apiName: "LA Galaxy", assetName: "logo_mls_la", primaryColor: "00245D", secondaryColor: "FFD200"),
        Team(id: "MLS_LAFC", league: .mls, apiName: "Los Angeles FC", assetName: "logo_mls_lafc", primaryColor: "000000", secondaryColor: "C39E6D"),
        Team(id: "MLS_MIN", league: .mls, apiName: "Minnesota United FC", assetName: "logo_mls_min", primaryColor: "231F20", secondaryColor: "E4E5E6"),
        Team(id: "MLS_MTL", league: .mls, apiName: "CF Montreal", assetName: "logo_mls_mtl", primaryColor: "000000", secondaryColor: "0033A1"),
        Team(id: "MLS_NSH", league: .mls, apiName: "Nashville SC", assetName: "logo_mls_nsh", primaryColor: "ECE83A", secondaryColor: "1F1646"),
        Team(id: "MLS_NE", league: .mls, apiName: "New England Revolution", assetName: "logo_mls_ne", primaryColor: "0A2240", secondaryColor: "CE0037"),
        Team(id: "MLS_NYC", league: .mls, apiName: "New York City FC", assetName: "logo_mls_nyc", primaryColor: "6CACE4", secondaryColor: "F15524"),
        Team(id: "MLS_RB", league: .mls, apiName: "New York Red Bulls", assetName: "logo_mls_rb", primaryColor: "ED1E36", secondaryColor: "FFFFFF"),
        Team(id: "MLS_ORL", league: .mls, apiName: "Orlando City SC", assetName: "logo_mls_orl", primaryColor: "633492", secondaryColor: "FFFFFF"),
        Team(id: "MLS_PHI", league: .mls, apiName: "Philadelphia Union", assetName: "logo_mls_phi", primaryColor: "071B2C", secondaryColor: "B18F2E"),
        Team(id: "MLS_POR", league: .mls, apiName: "Portland Timbers", assetName: "logo_mls_por", primaryColor: "004812", secondaryColor: "D69A00"),
        Team(id: "MLS_RSL", league: .mls, apiName: "Real Salt Lake", assetName: "logo_mls_rsl", primaryColor: "B30838", secondaryColor: "013A81"),
        Team(id: "MLS_SJ", league: .mls, apiName: "San Jose Earthquakes", assetName: "logo_mls_sj", primaryColor: "0067B1", secondaryColor: "000000"),
        Team(id: "MLS_SEA", league: .mls, apiName: "Seattle Sounders FC", assetName: "logo_mls_sea", primaryColor: "658D1B", secondaryColor: "003B2E"),
        Team(id: "MLS_SKC", league: .mls, apiName: "Sporting Kansas City", assetName: "logo_mls_skc", primaryColor: "002F65", secondaryColor: "91B0D5"),
        Team(id: "MLS_STL", league: .mls, apiName: "St. Louis City SC", assetName: "logo_mls_stl", primaryColor: "D2082F", secondaryColor: "0A1E2C"),
        Team(id: "MLS_TOR", league: .mls, apiName: "Toronto FC", assetName: "logo_mls_tor", primaryColor: "B81137", secondaryColor: "455560"),
        Team(id: "MLS_VAN", league: .mls, apiName: "Vancouver Whitecaps FC", assetName: "logo_mls_van", primaryColor: "00245E", secondaryColor: "9DC2EA"),
        Team(id: "MLS_SD", league: .mls, apiName: "San Diego FC", assetName: "logo_mls_sd", primaryColor: "000000", secondaryColor: "E8B830"),
    ]
    
    // MARK: - Lookup Helpers
    
    /// All teams across all leagues.
    static var allTeams: [Team] {
        nflTeams + nbaTeams + mlbTeams + nhlTeams + mlsTeams
    }
    
    /// Returns the teams for a given league.
    static func teams(for league: League) -> [Team] {
        switch league {
        case .nfl: return nflTeams.sorted { $0.apiName < $1.apiName }
        case .nba: return nbaTeams.sorted { $0.apiName < $1.apiName }
        case .mlb: return mlbTeams.sorted { $0.apiName < $1.apiName }
        case .nhl: return nhlTeams.sorted { $0.apiName < $1.apiName }
        case .mls: return mlsTeams.sorted { $0.apiName < $1.apiName }
        }
    }
    
    /// Finds a team by its unique ID.
    static func team(byId id: String) -> Team? {
        allTeams.first { $0.id == id }
    }
}
