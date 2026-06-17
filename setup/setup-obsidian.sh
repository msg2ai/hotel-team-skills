#!/bin/bash
# Setup Obsidian integration for Claude Code
# Used by: All hotel team skills (knowledge base, notes, institutional memory)
#
# Obsidian: https://obsidian.md
# This sets up the Obsidian MCP server so Claude can read/write your vault
echo "Setting up Obsidian integration..."
echo ""

# Try to find Obsidian vault
DEFAULT_VAULT="$HOME/Documents/Obsidian"
read -p "Enter the path to your Obsidian vault [$DEFAULT_VAULT]: " VAULT_PATH
VAULT_PATH="${VAULT_PATH:-$DEFAULT_VAULT}"

if [ ! -d "$VAULT_PATH" ]; then
  echo "Warning: Directory '$VAULT_PATH' does not exist."
  echo "Create it or provide the correct path to your Obsidian vault."
  read -p "Create this directory? (y/n): " CREATE_DIR
  if [ "$CREATE_DIR" = "y" ]; then
    mkdir -p "$VAULT_PATH"
    echo "Created: $VAULT_PATH"
  else
    exit 1
  fi
fi

claude mcp add obsidian \
  --transport stdio \
  --env OBSIDIAN_VAULT_PATH="$VAULT_PATH" \
  -- npx -y obsidian-mcp-server

echo ""
echo "Done! Obsidian is now available in Claude Code."
echo "Vault path: $VAULT_PATH"
echo ""
echo "Recommended: Create these folders in your vault for hotel operations:"
echo "  $VAULT_PATH/Hotel/"
echo "  $VAULT_PATH/Hotel/Operations"
echo "  $VAULT_PATH/Hotel/Groups"
echo "  $VAULT_PATH/Hotel/Budget"
echo "  $VAULT_PATH/Hotel/Research"
echo ""
echo "Test it by asking Claude: 'Create a note in Obsidian called Hotel Operations'"
