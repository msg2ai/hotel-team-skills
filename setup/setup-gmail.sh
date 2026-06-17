#!/bin/bash
# Setup Gmail integration for Claude Code
# Used by: All hotel team skills
echo "Setting up Gmail integration..."
echo ""
echo "This will open a browser for Google OAuth authorization."
echo ""
claude mcp add gmail --transport http https://mcp.google.com/gmail
echo ""
echo "Done! Gmail is now available in Claude Code."
echo "Test it by asking Claude: 'Send a test email via Gmail'"
