# Be the hotel that answers when guests plan with AI

Reference for the AI Planner skill. It covers how a hotel gets its own app inside ChatGPT (and other AI assistants), what the hotel has to prepare, and how guests and partners use it.

## The thesis, the challenge, the answer

- **Thesis.** Is the future of travel planning going to be on ChatGPT or similar LLMs? Guests already ask an assistant to "plan my stay", "what's near the hotel" and "where should we eat".
- **Challenge.** None of that activity reaches the hotel: not the questions, not the interest, not the guest. Booking.com and Expedia already have apps inside ChatGPT (launch partners, October 2025) that show live rates and send guests to finish booking on their own sites. A single hotel will not win a generic "find me a hotel in X" search.
- **Answer.** The hotel wins **"plan my stay at [hotel]"**. The hotel's own app in ChatGPT does three things:
  - plans the stay from the hotel's own picks;
  - offers a direct booking on the hotel's own engine;
  - hands the guest to the hotel's WhatsApp concierge, with the guest's opt-in.

  So the questions and the conversation come back to the hotel.

## What the guest experiences

1. **Plan.** In ChatGPT the guest asks to plan their stay. The hotel's app returns a day-by-day plan on a card. The plan is built only from the hotel's catalog: its own outlets and spa, plus vetted places nearby, each open on the guest's dates and suited to the party. It adds restaurant picks for their dietary needs.
2. **Book direct.** A **Book direct** button opens the hotel's own booking engine with the guest's dates and party filled in.
3. **Continue on WhatsApp.** One tap gives a WhatsApp link with a visit code. Sending it is the opt-in. The concierge replies at once with a welcome and the plan, then sends the visit cards: a welcome menu, visit info, things to do, and restaurants with Directions and Menu buttons.
4. **Questions the catalog does not cover.** For a specific event, a price or a rule, the app says plainly that the hotel's information does not cover it. It then gives the hotel's email and WhatsApp, rather than answering from the web in the hotel's name.

**Privacy by design.** Planning is read-only. A visit pass is created only when the guest says yes. No phone number or booking reference ever passes through the AI assistant: the concierge asks for the booking reference on WhatsApp, where it already knows the guest's number.

## Four ways in

| Door | Who it suits | How |
|---|---|---|
| **The hotel's own app** | Guests who add it | ChatGPT: **Plugins → + → Add custom MCP server**, paste the hotel's app URL (msg2ai provides it), no authentication. Directory listing comes later, under OpenAI's submission rules. |
| **The plan link** | Everyone; no install | `https://<msg2ai-host>/api/public/visit/<hotel>/start?from=YYYY-MM-DD&to=YYYY-MM-DD&party=N`. Put it on the website, in the confirmation email and on a QR code. It works from any AI assistant or browser: it previews the plan, then one tap opens WhatsApp. |
| **Claude** | Guests and staff on Claude | **Customize → Connectors → Add custom connector** with the same app URL. |
| **Hotel group / tourism bureau** | Groups with several properties; members of a bureau | One app for the whole group (find the hotel, plan, book direct, hand off to that property's concierge). A tourism bureau's app can list the hotel under "Where to stay", with **Website** and **Hotel concierge on WhatsApp**. |

Never put a guest's name, notes or booking details in a plan link. Links are shared and logged. Dates, party size, interests, language and dietary needs are fine.

## What the hotel prepares (the catalog)

Keep these in the Knowledge Base under `10-msg2ai-export/visit-pass/`. They are not uploaded with `property.json`: msg2ai loads them into the hotel's app during set-up (and again whenever you send an update), exactly as they are.

**`hotel.json`**
- display name, destination, `homeArea` (where the hotel is; every plan is based there);
- `bookingUrl`, the hotel's own booking engine, https only, with `{arrival}`, `{departure}` and `{adults}` where the dates and party go. Example: `https://book.example.com/?in={arrival}&out={departure}&adults={adults}`;
- the WhatsApp number the concierge runs on;
- `contactEmail`, `contactWhatsApp` (E.164) and `contactUrl`: where guests ask what the catalog does not cover.

**`experiences.json`** is the hotel's own places and the outings nearby, one entry each:

| Field | Rule |
|---|---|
| `key` | lower-case letters, digits, hyphens |
| `title` | ≤ 60 characters |
| `blurb` | ≤ 160 characters, one sentence, no line breaks |
| `area` | e.g. the hotel's neighbourhood; use the same spelling as `homeArea` for anything nearby |
| `interests` | from: beaches, food, music, culture, history, nature, adventure, wellness, nightlife, shopping, family-activities, architecture, markets, diving |
| `slot` | morning, afternoon, evening or fullDay |
| `durationHours` | 0.5–14 |
| `suits` | optional: solo, couple, family, friends, business. Leave empty if it suits everyone; a type not listed is excluded |
| `costBand` | value, mid or luxury |
| `months`, `closedWeekdays` | optional season (1–12) and closed days (0 = Sunday) |
| `tip` | optional, ≤ 160 characters |
| `imageUrl` | 1125×600 photo, hosted by msg2ai |

**`restaurants.json`** is one entry per outlet, plus a few vetted places nearby:
- `title`, a `blurb` of ≤ 160 characters, `area`, `cuisine` (≤ 40), `costBand`;
- `dietary` lists only what the kitchen reliably serves: vegetarian, vegan, halal, kosher, gluten-free;
- a 1125×600 photo;
- `mapsUrl`, a Google Maps link;
- `menuUrl`, the **real menu page**, never the maps link again.

**`info-card.json`** is one card of practical information (getting around, money, emergency numbers): a title of ≤ 60 characters and a body of ≤ 1024 characters.

**Photos:** 1125×600, JPEG, ≤ 60 KB each. They must show the actual place, without identifiable guests. Use your own photography, or Wikimedia Commons with the credit recorded.

## Verification checklist (before anything goes live)

- Every place is **open now**: check its own site and social posts, and news from the last 12 months. Closures, renovations, storm damage and seasonal openings are the classic traps. Anything without a recent signal is held back, not recommended.
- Every link loads: maps, menu and booking.
- Seasons and closed days are set wherever they apply.
- The catalog says only what is true. Recommend only places you would send your own guests to.

## KPIs to report

| KPI | What it counts |
|---|---|
| Plans | `plan_visit` calls |
| WhatsApp hand-offs | visit codes sent |
| Book-direct taps | taps on **Book direct**, and the direct bookings attributed to them through the booking engine's UTM |
| Plan-link taps | taps from the website, confirmation email and QR codes |
| Questions not covered | the gaps to add to the catalog next |

## Engagement with msg2ai

1. **Discovery call:** goals, the guest journey, the booking engine, the WhatsApp number.
2. **Scope definition:** which doors (own app, plan link, group, bureau partner), the catalog of outlets and nearby places, languages, and the contact channels for questions.
3. **Prototype + knowledge base:** catalog, restaurants with photos and menu links, the knowledge base, the WhatsApp concierge, and a test in ChatGPT.
4. **Roll-out:** the plan link on the website and in the confirmation email, QR codes, a staff briefing, and the ChatGPT directory submission when ready.

Typical engagement: approx. USD 500–2,000, depending on scope, over 2–6 weeks. Contact: bart@msg2.ai.
