#!/bin/bash
# Setup Zoom integration for Claude Code
# Used by: General Manager, Sales & Marketing, Food & Beverage
echo "Setting up Zoom integration..."
echo ""
echo "Option 1: Connect via Claude.ai (recommended)"
echo "  1. Go to https://claude.ai/settings/connectors"
echo "  2. Find 'Zoom' and click Connect"
echo "  3. Authorize with your Zoom account"
echo "  4. Zoom will be available in Claude Code automatically"
echo ""
echo "Option 2: Connect via MCP server"
claude mcp add zoom --transport http https://mcp.zoom.us/mcp
echo ""
echo "Done! Zoom is now available in Claude Code."
echo "Test it by asking Claude: 'Show my recent Zoom recordings'"
