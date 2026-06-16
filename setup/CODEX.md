---
name: codex-setup
description: Wire the same connectors into OpenAI Codex (the Codex CLI / agent), so users who don't run Claude Code still get Gmail, Calendar, Drive, Vercel, Apollo, Context7, etc.
---

# Codex setup (parallel to the Claude Code scripts)

The `setup/setup-*.sh` scripts in this folder all wire connectors into **Claude Code**. If you (or members of your team) drive these skills from **OpenAI Codex** instead, copy the relevant blocks below into `~/.codex/config.toml`. Same OAuth flow, same tools — Codex picks them up on the next session.

> Codex's MCP support recognizes both stdio (`command` + `args`) servers and remote (`url`) servers. The OAuth-based connectors below all use `transport = "http"` (or `"sse"` where the upstream still requires it).

---

## Where to put this

Codex reads `~/.codex/config.toml` on launch. If the file doesn't exist yet:

```bash
mkdir -p ~/.codex
touch ~/.codex/config.toml
```

Append the blocks you need.

---

## Gmail

```toml
[mcp_servers.gmail]
url = "https://mcp.google.com/gmail"
transport = "http"
```

First call to a Gmail tool opens an OAuth browser flow. Token caches under `~/.codex/mcp/gmail/`.

## Google Calendar

```toml
[mcp_servers.gcal]
url = "https://mcp.google.com/calendar"
transport = "http"
```

## Google Drive

```toml
[mcp_servers.gdrive]
url = "https://mcp.google.com/drive"
transport = "http"
```

## Zoom

```toml
[mcp_servers.zoom]
url = "https://mcp.zoom.us"
transport = "http"
```

## Vercel

```toml
[mcp_servers.vercel]
url = "https://mcp.vercel.com"
transport = "http"
```

## Canva

```toml
[mcp_servers.canva]
url = "https://mcp.canva.com"
transport = "http"
```

## Context7 (library/framework docs — required for the Vibe Coder)

```toml
[mcp_servers.context7]
url = "https://mcp.context7.com/mcp"
transport = "http"
```

## Apollo.io (prospect research — Sales & Marketing)

```toml
[mcp_servers.apollo]
url = "https://mcp.apollo.io"
transport = "http"
```

## Firecrawl

Firecrawl ships as a stdio server. Get an API key at <https://firecrawl.dev>, then:

```toml
[mcp_servers.firecrawl]
command = "npx"
args = ["-y", "firecrawl-mcp"]
env = { FIRECRAWL_API_KEY = "fc-..." }
```

## Twenty CRM

```toml
[mcp_servers.twenty]
command = "npx"
args = ["-y", "twenty-mcp-server"]
env = { TWENTY_CRM_URL = "https://your-instance.twenty.com", TWENTY_API_KEY = "..." }
```

## ClickUp

```toml
[mcp_servers.clickup]
command = "npx"
args = ["-y", "@clickup/mcp-server"]
env = { CLICKUP_API_KEY = "pk_..." }
```

## Asana

```toml
[mcp_servers.asana]
command = "npx"
args = ["-y", "@asana/mcp-server"]
env = { ASANA_ACCESS_TOKEN = "..." }
```

## AgentMail

```toml
[mcp_servers.agentmail]
url = "https://mcp.agentmail.to"
transport = "http"
```

## Obsidian

Run the Obsidian MCP plugin locally, then:

```toml
[mcp_servers.obsidian]
command = "npx"
args = ["-y", "obsidian-mcp"]
env = { OBSIDIAN_VAULT = "/path/to/your/vault" }
```

---

## Verify

After editing `~/.codex/config.toml`, start a fresh Codex session and ask:

```
List the MCP servers I have configured.
```

Codex should enumerate every block you added. If a server fails to connect, the error message names which one — common causes are missing OAuth (re-run the auth flow) and wrong API keys (check the env values).

---

## Tool-name collisions

If you enable **more than one mail tool** at the same time (e.g., Gmail *and* AgentMail *and* Zoho Mail), the model will sometimes pick the wrong one. Pick one per Codex profile, or split them across separate `~/.codex/config.toml` profiles and switch with `CODEX_PROFILE=...`. Same applies to overlapping CRM tools (Twenty + Apollo + a Zoho CRM connector).

## Permission prompts

Codex prompts on every tool call by default. Add common read-only patterns (`*_search`, `*_list`, `*_get_*`) to your Codex allowlist so writes still prompt but reads don't. Configuration lives in the same `~/.codex/config.toml` under `[allowlist]`.
