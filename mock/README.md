# Mock Property — The Meridian Nashville

**The Meridian Nashville** is a fictional 174-key independent lifestyle hotel in downtown Nashville used to showcase what each of the 8 hotel-team skills produces. The leadership personas in `property-portfolio.md` carry across every output — Elena Vasquez (GM), Marcus Bell (Front Office / Rooms), Priya Iyer (Revenue), David Chen (Finance / Controller), Sofia Romano (F&B), Grace Mwangi (Housekeeping / Rooms Division), Tomás Herrera (Sales & Marketing), and Noor Haddad (Web / Vibe Coder).

The hotel: 174 keys across Deluxe, Executive, Corner, Meridian, and Presidential tiers; four F&B outlets (The Ledger restaurant, Loafer's Corner rooftop bar, The Atrium lobby lounge, 24h in-room dining); 12,400 sq ft of meeting space. Opened 2021. FY2026 budget $34.1M total revenue, 39.2% GOP. Channel mix 42% direct / 31% OTA / 18% group.

The "now" is **Tuesday, September 15, 2026** — summer leisure has wound down and corporate/group demand is ramping into Q4. Three live situations drive the sample artifacts: a 110-room Southern Medical Association convention block (Oct 8–11) with displacement tension, the Loafer's Corner rooftop closed Oct 1–10 for a refresh, and a sev-1 east-wing chiller repair (12 rooms OOO Sep 13–16).

## What's in here

```
mock/
├── property-portfolio.md                       ← The fake hotel definition (keys, rooms, F&B, KPIs, current focus)
├── README.md                                   ← You are here
└── outputs/                                    ← 3 sample artifacts per skill
    ├── general-manager/
    │   ├── 01-daily-flash-report.md            ← 9am stand-up one-pager for Sep 15
    │   ├── 02-risk-register.md                 ← Live risks (operational, financial, regulatory, reputational)
    │   └── 03-asset-manager-briefing.md        ← Q3 briefing for the Oct 1 ownership review
    ├── front-office/
    │   ├── 01-arrivals-briefing.md             ← Today's VIPs, groups, walks risk, pickup target
    │   ├── 02-walk-strategy.md                 ← Walk plan if Oct 10 oversells (guests to walk + packet)
    │   └── 03-group-rooming-list.md            ← SMA convention rooming list, validated + pre-blocked
    ├── revenue-management/
    │   ├── 01-weekly-pickup-report.md          ← Pace vs budget/STLY, channel mix, action recommendations
    │   ├── 02-group-displacement.md            ← Oct 8–11 SMA block vs transient displacement analysis
    │   └── 03-bar-ladder-and-restrictions.md   ← 30-day BAR ladder + MLOS/CTA for Oct compression
    ├── finance-controller/
    │   ├── 01-daily-revenue-audit.md           ← Sep 14 DRA: revenue by dept, settlements, variance
    │   ├── 02-monthly-usali-pnl.md             ← August USALI P&L close, actual vs budget vs STLY
    │   └── 03-ota-reconciliation.md            ← Booking.com / Expedia monthly reconciliation
    ├── food-beverage/
    │   ├── 01-banquet-event-order.md           ← BEO for the SMA Saturday banquet (Grand Ballroom)
    │   ├── 02-outlet-covers-forecast.md        ← Weekly covers + labor schedule per outlet (rooftop closed)
    │   └── 03-fnb-pnl-flash.md                 ← F&B P&L flash by outlet, food/bev/labor %
    ├── housekeeping-rooms/
    │   ├── 01-daily-turnover-sheet.md          ← Sep 15 departures/stayovers/OOO, RA credits assigned
    │   ├── 02-engineering-work-orders.md       ← Open WOs incl. sev-1 chiller (floor 7), SLA status
    │   └── 03-preventive-maintenance.md        ← Q4 PM calendar (HVAC, elevators, life-safety, kitchen hood)
    ├── sales-marketing/
    │   ├── 01-rfp-response.md                  ← Tailored RFP response to a corporate group inquiry
    │   ├── 02-marketing-calendar.md            ← Q4 campaign calendar (holiday, corporate, weddings, direct)
    │   └── 03-ota-listing-audit.md             ← Quarterly audit of Booking.com/Expedia listings + actions
    └── vibe-coder/
        ├── 01-weddings-landing-page.md         ← Next.js spec + content map for /weddings
        ├── 02-vercel-deploy-log.md             ← Owner-portal KPI tiles deploy walk-through (Vercel + GitHub)
        └── 03-booking-engine-integration.md    ← Bookassist deep-link + conversion-tracking plan
```

## Knowledge Base Layout

In a real run, this is what the hotel's shared Knowledge Base looks like for The Meridian (Google Drive):

```
The Meridian Nashville/                  ← shared root
├── 01-property-brief/                   ← who, market, positioning, ownership (Elena)
├── 02-brand-and-voice/                  ← logo, colors, tone, signature moments (Tomás)
├── 03-rooms-inventory/                  ← room types, rate codes, suite plans (Marcus)
├── 04-channels-distribution/            ← OTAs, GDS, direct, group blocks (Priya / Tomás)
├── 05-rate-strategy/                    ← BAR ladder, packages, restrictions (Priya)
├── 06-rooms-housekeeping/               ← SOPs, inspection rubric, vendor list, pars (Grace)
├── 07-fnb/                              ← outlets, menus, BEO templates, beverage (Sofia)
├── 08-finance-accounting/               ← USALI COA, DRA, AR/AP, payroll (David)
├── 09-guests/                           ← segments, loyalty, complaint log, NPS, reviews (Marcus)
└── 10-msg2ai-export/                    ← merged property.json for hello.msg2ai.xyz (Elena owns)
```

The KB was bootstrapped by **Firecrawl** scraping `https://meridiannashville.com` in March 2026 — pulling room types, amenities, outlet menus, photography, and brand voice into `01-property-brief/from-website.md` and the relevant folders, saving the team a week of manual entry.

## How the skills connect

```
                              GM (Elena Vasquez)
                              ↑   ↑   ↑   ↑   ↑   ↑   ↑
            ┌────────┬────────┴───┴───┴───┴───┴───┴───┴────────┬────────┐
            │        │             │              │             │        │
     Front Office  Revenue     Housekeeping       F&B        Sales/Mkt  Finance    Web
       (Marcus)   (Priya)       (Grace)         (Sofia)       (Tomás)   (David)  (Noor)
            │        │             │              │             │        │          │
            └────────┴─────────────┴── shared Knowledge Base ───┴────────┘          │
                                                                                     │
                                          property.json (10-msg2ai-export) ──────────┘
```

| From Skill | To Skill | What's handed off |
|---|---|---|
| Revenue → Front Office | Today's pickup target + oversell nights (walk risk) |
| Revenue → Sales | Group displacement results; dates to sell / hold |
| Revenue → F&B | Occupancy forecast → covers forecast for outlets |
| Front Office → Housekeeping | Arrivals/departures + OOO/OOI + same-day-flip risk |
| Front Office → F&B | VIP arrivals → welcome-amenity coordination |
| F&B → Sales | Banquet menus + signature spaces for RFPs |
| F&B → Finance | Weekly F&B P&L flash + banquet revenue |
| Sales → Front Office | Group rooming lists + cutoff dates + billing routing |
| Sales → Revenue | Group inquiries for displacement analysis |
| Sales → Web | Brand assets, campaign briefs, package copy |
| Housekeeping → Front Office | Rooms-ready-by-3pm status; OOO/OOI list (PMS sync) |
| Housekeeping → Finance | Cleaner-pay batch; owner/asset chargebacks (with photos) |
| Finance → GM | Monthly USALI P&L, cash position, top variances |
| Finance → Sales | AR aging on direct-bill accounts |
| Web → All skills | Production + preview URLs; lead/RFP form submissions to Sales |
| All skills → GM | Status slices merged into asset-manager briefing + property.json |

## Using this as a template

To plan a real hotel with these skills:

1. Copy `property-portfolio.md` and replace with your hotel details (keys, room types, F&B outlets, KPIs).
2. Set up your shared Knowledge Base in Google Drive (or Dropbox / OneDrive / Notion) — the GM skill creates the 10-folder structure for you.
3. Bootstrap from your existing hotel website with Firecrawl (one prompt: *"Bootstrap the knowledge base from https://yourhotel.com using Firecrawl"*).
4. Open Claude Code and use the skills naturally:
   ```
   "Run today's daily flash report for the 9am standup"
   "Score the displacement on the SMA convention block Oct 8–11"
   "Generate the August USALI P&L close"
   "Build the BEO for the Saturday-night banquet for 420"
   "Ship the /weddings landing page to Vercel"
   ```
5. Each skill produces outputs like the ones in `outputs/` — ready to send, present, or post.
