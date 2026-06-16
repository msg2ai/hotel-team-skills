#!/bin/bash
# Setup Asana integration for Claude Code
# Used by: All hotel team skills (project/task management)
#
# Asana: https://asana.com
echo "Setting up Asana integration..."
echo ""

read -p "Enter your Asana Personal Access Token: " ASANA_TOKEN

if [ -z "$ASANA_TOKEN" ]; then
  echo "Error: Personal Access Token is required."
  echo ""
  echo "To get your Asana token:"
  echo "  1. Log into Asana"
  echo "  2. Go to My Settings → Apps → Developer Apps"
  echo "  3. Click 'Create New Token'"
  exit 1
fi

claude mcp add asana \
  --transport sse \
  --header "Authorization: Bearer $ASANA_TOKEN" \
  -- https://mcp.asana.com/sse

echo ""
echo "Done! Asana is now available in Claude Code."
echo "Test it by asking Claude: 'List my Asana projects'"
