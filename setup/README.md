# Setup Shortcuts

Quick-start scripts to connect the tools referenced by the hotel team skills.

Run any script from this directory to configure the integration for Claude Code.

## Available Setup Scripts

| Script | What it sets up | Used by skills |
|---|---|---|
| [`setup-firecrawl.sh`](./setup-firecrawl.sh) | **Firecrawl** — bootstrap the shared Knowledge Base from an existing hotel website | All skills |
| [`setup-agentmail.sh`](./setup-agentmail.sh) | AgentMail — AI-native email inboxes | All skills |
| [`setup-gmail.sh`](./setup-gmail.sh) | Gmail connector | All skills |
| [`setup-google-calendar.sh`](./setup-google-calendar.sh) | Google Calendar connector | General Manager, Front Office, Sales & Marketing, Food & Beverage |
| [`setup-google-drive.sh`](./setup-google-drive.sh) | Google Drive connector — shared Knowledge Base host | All skills |
| [`setup-zoom.sh`](./setup-zoom.sh) | Zoom for meetings and recordings | General Manager, Sales & Marketing, Food & Beverage |
| [`setup-canva.sh`](./setup-canva.sh) | Canva for design assets | Sales & Marketing, Food & Beverage, Vibe Coder |
| [`setup-apollo.sh`](./setup-apollo.sh) | Apollo.io for group-sales prospecting & contact enrichment | Sales & Marketing |
| [`setup-twenty-crm.sh`](./setup-twenty-crm.sh) | Twenty CRM for contact/pipeline management | Sales & Marketing, Finance & Controller, Front Office, Food & Beverage |
| [`setup-vercel.sh`](./setup-vercel.sh) | Vercel for direct-booking site deployment | Sales & Marketing, Vibe Coder |
| [`setup-clickup.sh`](./setup-clickup.sh) | ClickUp for project/task management | All skills |
| [`setup-asana.sh`](./setup-asana.sh) | Asana for project/task management | All skills |
| [`setup-obsidian.sh`](./setup-obsidian.sh) | Obsidian for knowledge base and notes | All skills |
| [`setup-context7.sh`](./setup-context7.sh) | Context7 for current framework/library docs | Vibe Coder |
| [`setup-all.sh`](./setup-all.sh) | Run all setup scripts at once | — |

## Usage

```bash
# Set up a single integration
bash setup/setup-gmail.sh

# Set up everything
bash setup/setup-all.sh
```

Most integrations require OAuth authentication — the script will open a browser for you to authorize.

> **Note:** You don't need all integrations. Each skill works without any connectors — integrations just make them more powerful. Pick the ones your team already uses.

## Using OpenAI Codex instead of Claude Code?

See [`CODEX.md`](./CODEX.md) for the equivalent `~/.codex/config.toml` blocks for every connector above. Same OAuth flow, same tools.
