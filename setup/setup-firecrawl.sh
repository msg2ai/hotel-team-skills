#!/bin/bash
# Setup Firecrawl integration for Claude Code
# Used by: All skills — to bootstrap the shared Knowledge Base from an existing hotel website
echo "Setting up Firecrawl integration..."
echo ""
echo "Firecrawl is the web scraping tool used to bootstrap the Knowledge Base"
echo "from an existing hotel website (and to research your comp-set, competitors, etc.)."
echo ""
echo "Connect via Claude.ai:"
echo "  1. Go to https://claude.ai/settings/connectors"
echo "  2. Find 'Firecrawl' and click Connect"
echo "  3. Sign in or create an account at firecrawl.dev"
echo "  4. Firecrawl will be available in Claude Code automatically"
echo ""
echo "Or set the API key directly (Claude Code):"
echo "  export FIRECRAWL_API_KEY=fc-..."
echo ""
echo "After connecting, test it by asking Claude:"
echo "  'Bootstrap the knowledge base from https://your-hotel.com using Firecrawl'"
