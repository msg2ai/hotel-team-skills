#!/bin/bash
# ============================================================
# create-hotel-skills-repo.sh
# Run this from your terminal to create the GitHub repo
# and push all 8 hotel team skills.
#
# Prerequisites:
#   - GitHub CLI installed: https://cli.github.com
#   - Logged in: gh auth login
#   - Or set GITHUB_TOKEN env var with a personal access token
# ============================================================

set -e

REPO_NAME="hotel-team-skills"
ORG="msg2ai"
DESCRIPTION="8 free Claude skills — one AI seat for every role in your independent or small-chain hotel, plus a Vibe Coder to ship the direct-booking site. Built by MSG2AI."
SKILLS_DIR="$(dirname "$0")"

echo "🚀 Creating GitHub repo: $ORG/$REPO_NAME"

# Create the repo under msg2ai org
gh repo create "$ORG/$REPO_NAME" \
  --public \
  --description "$DESCRIPTION" \
  --homepage "https://msg2ai.xyz" \
  --clone=false

echo "✅ Repo created: https://github.com/$ORG/$REPO_NAME"

# Init git in the skills directory if not already
cd "$SKILLS_DIR"

if [ ! -d ".git" ]; then
  git init
  git branch -M main
fi

# Stage everything
git add .
git commit -m "Initial commit: 8 hotel team Claude skills

- General Manager / Director of Operations (Flash report, ops review, USALI owner report, risk, capex)
- Director of Rooms / Front Office (Arrivals, reservations triage, room blocking, walk strategy, upsells)
- Revenue Manager (BAR ladder, restrictions, pickup & pace, comp-set, channel mix, displacement)
- Controller / Director of Finance (Revenue audit, USALI P&L, OTA recon, AR/AP, payroll, cash flow)
- Director of Food & Beverage (BEOs, covers forecast, menu engineering, pour cost, banquet RevPASF)
- Director of Housekeeping / Rooms (Turnover, inspection, linen/supply pars, deep-clean, work orders)
- Director of Sales & Marketing (Group pipeline, RFPs, marketing calendar, direct-booking, OTA, PR)
- Director of Digital / Vibe Coder (Hotel website, landing pages, booking engine, owner portal — Vercel)

Each skill reads from a shared Knowledge Base (Drive / Dropbox / Notion)
and bootstraps via Firecrawl from an existing hotel website.

Built by MSG2AI — https://msg2ai.xyz"

# Set remote and push
git remote add origin "https://github.com/$ORG/$REPO_NAME.git"
git push -u origin main

echo ""
echo "✅ All done!"
echo "🔗 Repo live at: https://github.com/$ORG/$REPO_NAME"
echo ""
echo "Next steps:"
echo "  1. Go to the repo and add topics: claude, ai, hotel, hospitality, claude-skills"
echo "  2. Upload hotel-team-skills.zip as a Release asset"
echo "  3. Use this URL in your LinkedIn post CTA:"
echo "     https://github.com/$ORG/$REPO_NAME"
