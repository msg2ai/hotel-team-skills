#!/bin/bash
# Setup Apollo.io integration for Claude Code
# Used by: Sales & Marketing (group-sales prospecting, account research, contact enrichment).
#          Complements Twenty CRM — Apollo *fills* the group-sales pipeline, Twenty *manages* it.
echo "Setting up Apollo.io integration..."
echo ""
echo "Apollo.io is the prospecting engine for the Sales & Marketing skill:"
echo "  - Search companies by industry, size, geography, technographics"
echo "  - Find decision-maker contacts (Director of Sales, HR/Events lead, Travel Manager, etc.)"
echo "  - Enrich existing contact records"
echo "  - Trigger outreach sequences from confirmed prospects"
echo ""
echo "Connect via Claude.ai (recommended):"
echo "  1. Go to https://claude.ai/settings/connectors"
echo "  2. Find 'Apollo.io' and click Connect"
echo "  3. Authorize with your Apollo account (OAuth)"
echo "  4. Apollo will be available in Claude Code automatically"
echo ""
echo "Or add it directly to Claude Code:"
echo "  claude mcp add apollo --transport http https://mcp.apollo.io"
echo ""
echo "After connecting, test it by asking Claude:"
echo "  'Find 30 Nashville-area corporations with 200-1000 employees that book holiday parties and off-sites'"
