#!/bin/bash
# Setup Context7 integration for Claude Code
# Used by: Vibe Coder (current Next.js / Vercel / Tailwind / Stripe docs);
#          also useful for any skill that references library APIs or framework docs.
echo "Setting up Context7 integration..."
echo ""
echo "Context7 serves up-to-date documentation for libraries, frameworks, SDKs,"
echo "CLIs, and cloud services (Next.js, Vercel, Tailwind, Stripe, etc.). It's"
echo "version-aware, so the Vibe Coder doesn't ship code against a stale model"
echo "of the framework."
echo ""
echo "Connect via Claude.ai (recommended):"
echo "  1. Go to https://claude.ai/settings/connectors"
echo "  2. Find 'Context7' and click Connect"
echo "  3. Context7 will be available in Claude Code automatically"
echo ""
echo "Or add it directly to Claude Code:"
echo "  claude mcp add context7 --transport http https://mcp.context7.com/mcp"
echo ""
echo "After connecting, test it by asking Claude:"
echo "  'Show me the current Next.js 15 App Router docs for route handlers'"
