#!/bin/bash
# Setup Twenty CRM integration for Claude Code
# Used by: Sales & Marketing, Finance & Controller, Front Office, Food & Beverage
#
# Twenty is an open-source CRM: https://twenty.com
# Self-host or use Twenty Cloud at https://app.twenty.com
echo "Setting up Twenty CRM integration..."
echo ""

read -p "Enter your Twenty CRM URL (e.g., https://your-instance.twenty.com): " TWENTY_URL
read -p "Enter your Twenty API key: " TWENTY_API_KEY

if [ -z "$TWENTY_URL" ] || [ -z "$TWENTY_API_KEY" ]; then
  echo "Error: Both URL and API key are required."
  echo ""
  echo "To get your API key:"
  echo "  1. Log into your Twenty CRM instance"
  echo "  2. Go to Settings → API & Integrations"
  echo "  3. Generate a new API key"
  exit 1
fi

claude mcp add twenty-crm \
  --transport stdio \
  --env TWENTY_CRM_URL="$TWENTY_URL" \
  --env TWENTY_API_KEY="$TWENTY_API_KEY" \
  -- npx -y twenty-mcp-server

echo ""
echo "Done! Twenty CRM is now available in Claude Code."
echo "Test it by asking Claude: 'List my contacts in Twenty CRM'"
