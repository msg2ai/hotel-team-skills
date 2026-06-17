#!/bin/bash
# Setup ALL integrations for Hotel Team Skills
# Run this to configure every available connector at once
echo "============================================"
echo "  Hotel Team Skills — Full Setup"
echo "============================================"
echo ""
echo "This will walk you through connecting all available integrations."
echo "Press Ctrl+C at any time to stop."
echo ""

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

SCRIPTS=(
  "setup-firecrawl.sh"
  "setup-google-drive.sh"
  "setup-agentmail.sh"
  "setup-gmail.sh"
  "setup-google-calendar.sh"
  "setup-zoom.sh"
  "setup-canva.sh"
  "setup-apollo.sh"
  "setup-twenty-crm.sh"
  "setup-vercel.sh"
  "setup-clickup.sh"
  "setup-asana.sh"
  "setup-obsidian.sh"
  "setup-context7.sh"
)

for script in "${SCRIPTS[@]}"; do
  echo ""
  echo "--------------------------------------------"
  echo "  Running: $script"
  echo "--------------------------------------------"
  read -p "Set up $(echo $script | sed 's/setup-//;s/\.sh//')? (y/n/q to quit): " choice
  case "$choice" in
    y|Y) bash "$SCRIPT_DIR/$script" ;;
    q|Q) echo "Setup stopped."; exit 0 ;;
    *) echo "Skipped." ;;
  esac
done

echo ""
echo "============================================"
echo "  Setup complete!"
echo "============================================"
echo ""
echo "All selected integrations are now configured."
echo "Open Claude Code and start using the hotel team skills."
