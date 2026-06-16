#!/bin/bash
# Setup Google Drive integration for Claude Code
# Used by: All hotel team skills
echo "Setting up Google Drive integration..."
echo ""
echo "This will open a browser for Google OAuth authorization."
echo ""
claude mcp add google-drive --transport http https://mcp.google.com/drive
echo ""
echo "Done! Google Drive is now available in Claude Code."
echo "Test it by asking Claude: 'List my recent Google Drive files'"
