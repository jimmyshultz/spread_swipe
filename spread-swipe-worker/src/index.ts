/**
 * SpreadSwipe Cloudflare Worker
 *
 * Cron handler: Fetches spreads from The Odds API for all 5 leagues,
 *               caches results in KV.
 * HTTP handler: Serves cached spreads as JSON to the watchOS app.
 */

export interface Env {
    SPREADS_CACHE: KVNamespace;
    ODDS_API_KEY: string; // Set via: npx wrangler secret put ODDS_API_KEY
}

// The 5 supported leagues and their Odds API sport keys
const LEAGUES = [
    "americanfootball_nfl",
    "basketball_nba",
    "baseball_mlb",
    "icehockey_nhl",
    "soccer_usa_mls",
] as const;

const ODDS_API_BASE = "https://api.the-odds-api.com/v4/sports";
const KV_KEY = "all_spreads";
// Cache TTL: 9 hours (slightly longer than the 8-hour cron interval for safety)
const KV_TTL_SECONDS = 9 * 60 * 60;

// --- Types ---

interface OddsEvent {
    id: string;
    sport_key: string;
    commence_time: string;
    home_team: string;
    away_team: string;
    bookmakers: Bookmaker[];
}

interface Bookmaker {
    key: string;
    title: string;
    markets: Market[];
}

interface Market {
    key: string;
    outcomes: Outcome[];
}

interface Outcome {
    name: string;
    price: number;
    point?: number;
}

interface TeamSpreadInfo {
    spread: string;
    opponent: string;
    commenceTime: string; // ISO 8601
    isHome: boolean;
}

interface SpreadsResponse {
    lastUpdated: string;
    creditsRemaining: number | null;
    leagues: Record<string, Record<string, TeamSpreadInfo>>;
}

// --- Cron Handler: Fetch from Odds API and write to KV ---

async function fetchAllSpreads(env: Env): Promise<SpreadsResponse> {
    const leagues: Record<string, Record<string, TeamSpreadInfo>> = {};
    let creditsRemaining: number | null = null;

    for (const sportKey of LEAGUES) {
        try {
            const url = new URL(`${ODDS_API_BASE}/${sportKey}/odds/`);
            url.searchParams.set("apiKey", env.ODDS_API_KEY);
            url.searchParams.set("regions", "us");
            url.searchParams.set("markets", "spreads");
            url.searchParams.set("oddsFormat", "american");

            const response = await fetch(url.toString());

            // Track credits from response headers
            const remaining = response.headers.get("x-requests-remaining");
            if (remaining) {
                creditsRemaining = parseInt(remaining, 10);
                console.log(`[${sportKey}] Credits remaining: ${creditsRemaining}`);
            }

            if (!response.ok) {
                console.error(`[${sportKey}] HTTP ${response.status}`);
                if (response.status === 429) {
                    console.error("Rate limited! Stopping.");
                    break;
                }
                continue;
            }

            const events: OddsEvent[] = await response.json();

            const leagueSpreads: Record<string, TeamSpreadInfo> = {};

            for (const event of events) {
                const bookmaker = event.bookmakers[0];
                if (!bookmaker) continue;

                const spreadsMarket = bookmaker.markets.find(
                    (m) => m.key === "spreads"
                );
                if (!spreadsMarket) continue;

                for (const outcome of spreadsMarket.outcomes) {
                    if (outcome.point !== undefined) {
                        const teamName = outcome.name;
                        const isHome = teamName === event.home_team;
                        const opponent = isHome
                            ? event.away_team
                            : event.home_team;

                        leagueSpreads[teamName] = {
                            spread: formatSpread(outcome.point),
                            opponent,
                            commenceTime: event.commence_time,
                            isHome,
                        };
                    }
                }
            }

            leagues[sportKey] = leagueSpreads;
            console.log(
                `[${sportKey}] Found spreads for ${Object.keys(leagueSpreads).length} teams`
            );
        } catch (err) {
            console.error(`[${sportKey}] Error:`, err);
        }
    }

    return {
        lastUpdated: new Date().toISOString(),
        creditsRemaining,
        leagues,
    };
}

function formatSpread(point: number): string {
    if (point === 0) return "PK";

    // Remove trailing .0 for whole numbers
    const formatted =
        point === Math.round(point) ? point.toFixed(0) : point.toFixed(1);

    return point > 0 ? `+${formatted}` : formatted;
}

// --- HTTP Handler: Serve cached spreads ---

async function handleRequest(
    request: Request,
    env: Env
): Promise<Response> {
    const url = new URL(request.url);

    // CORS headers for flexibility
    const corsHeaders = {
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Methods": "GET, OPTIONS",
        "Content-Type": "application/json",
    };

    // Handle CORS preflight
    if (request.method === "OPTIONS") {
        return new Response(null, { headers: corsHeaders });
    }

    if (url.pathname === "/spreads" || url.pathname === "/") {
        // Serve cached data from KV
        const cached = await env.SPREADS_CACHE.get(KV_KEY);

        if (cached) {
            return new Response(cached, {
                headers: {
                    ...corsHeaders,
                    "Cache-Control": "public, max-age=900",
                },
            });
        }

        // No cache yet — return empty but valid response
        const empty: SpreadsResponse = {
            lastUpdated: "",
            creditsRemaining: null,
            leagues: {},
        };
        return new Response(JSON.stringify(empty), {
            status: 200,
            headers: corsHeaders,
        });
    }

    return new Response(JSON.stringify({ error: "Not found" }), {
        status: 404,
        headers: corsHeaders,
    });
}

// --- Worker export ---

export default {
    // HTTP requests
    async fetch(request: Request, env: Env): Promise<Response> {
        return handleRequest(request, env);
    },

    // Cron trigger
    async scheduled(
        _event: ScheduledEvent,
        env: Env,
        ctx: ExecutionContext
    ): Promise<void> {
        console.log("Cron triggered: fetching all spreads");
        const data = await fetchAllSpreads(env);
        await env.SPREADS_CACHE.put(KV_KEY, JSON.stringify(data), {
            expirationTtl: KV_TTL_SECONDS,
        });
        console.log(`Cron complete. Updated at ${data.lastUpdated}`);
    },
};
