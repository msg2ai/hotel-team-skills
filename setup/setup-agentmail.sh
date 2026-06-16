#!/bin/bash
# Setup AgentMail integration for Claude Code
# Used by: All hotel team skills (AI-native email for confirmations, group-sales outreach, invoices, notifications)
#
# AgentMail: https://agentmail.to
# Docs: https://docs.agentmail.to/integrations/mcp
echo "Setting up AgentMail integration..."
echo ""

read -p "Enter your AgentMail API key: " AGENTMAIL_API_KEY

if [ -z "$AGENTMAIL_API_KEY" ]; then
  echo "Error: API key is required."
  echo ""
  echo "To get your AgentMail API key:"
  echo "  1. Go to https://console.agentmail.to"
  echo "  2. Create an account or sign in"
  echo "  3. Generate an API key from the console"
  exit 1
fi

claude mcp add agentmail \
  --transport stdio \
  --env AGENTMAIL_API_KEY="$AGENTMAIL_API_KEY" \
  -- npx -y agentmail-mcp

echo ""
echo "Done! AgentMail is now available in Claude Code."
echo ""
echo "AgentMail creates dedicated AI inboxes — no personal email needed."
echo "Test it by asking Claude: 'Create an AgentMail inbox for group-sales outreach'"
