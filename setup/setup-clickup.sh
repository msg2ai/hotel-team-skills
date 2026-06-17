#!/bin/bash
# Setup ClickUp integration for Claude Code
# Used by: All hotel team skills (project/task management)
#
# ClickUp: https://clickup.com
echo "Setting up ClickUp integration..."
echo ""

read -p "Enter your ClickUp API key: " CLICKUP_API_KEY

if [ -z "$CLICKUP_API_KEY" ]; then
  echo "Error: API key is required."
  echo ""
  echo "To get your ClickUp API key:"
  echo "  1. Log into ClickUp"
  echo "  2. Go to Settings → Apps"
  echo "  3. Click 'Generate' under API Token"
  exit 1
fi

claude mcp add clickup \
  --transport stdio \
  --env CLICKUP_API_KEY="$CLICKUP_API_KEY" \
  -- npx -y @anthropic/mcp-clickup

echo ""
echo "Done! ClickUp is now available in Claude Code."
echo "Test it by asking Claude: 'List my ClickUp spaces'"
