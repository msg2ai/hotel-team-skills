# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

A collection of 8 Claude Code skills for independent and small-chain hotel teams (typically 50–300 keys — urban, resort, or boutique), packaged three ways:
1. **Personal skills** — clone into `~/.claude/skills/` and they're auto-detected
2. **Claude Code plugin** — load via `claude --plugin-dir` using the `.claude-plugin/plugin.json` manifest
3. **npm package** — `npx hotel-team-skills install` runs `bin/cli.js` which clones to the skills directory

There is no build step, no tests, and no dependencies. The deliverables are markdown files.

## Architecture

Each skill is a folder at the repo root containing a single `SKILL.md` file with YAML frontmatter (`name`, `description`) and markdown instructions. The frontmatter `description` field is what Claude uses to decide when to invoke the skill, so it must contain trigger phrases.

The 8 skills: `hotel-general-manager`, `hotel-front-office`, `hotel-revenue-management`, `hotel-finance-controller`, `hotel-food-beverage`, `hotel-housekeeping-rooms`, `hotel-sales-marketing`, `hotel-vibe-coder`. Each directory name **must** match the `name:` field in its `SKILL.md` frontmatter — Claude Code's skill loader will silently skip skills where they diverge.

Every skill follows the same shape: `### 0. Connect to / read from the Shared Knowledge Base` (Google Drive / Dropbox / OneDrive / Notion) is the first capability, with **Firecrawl** as the website-bootstrap path (GM skill owns bootstrap). The last capability of every skill is `### N. Export … slice to the Property JSON` — each skill owns a slice of `10-msg2ai-export/property.json`. The General Manager owns the master file and merges the slices; the merged file is uploaded to **hello.msg2ai.xyz** to drive the public-facing property site, booking engine, and guest concierge.

The `.claude-plugin/plugin.json` manifest points `"skills": "./"` at the repo root so the plugin loader finds skill folders directly (no `skills/` subdirectory).

`bin/cli.js` is a zero-dependency Node.js CLI that shells out to `git clone`/`git pull` to install/update skills into `~/.claude/skills/hotel-team-skills/`. It resolves the home directory cross-platform via `HOME`, `USERPROFILE`, or `HOMEDRIVE`+`HOMEPATH`.

## Key conventions

- Skill names use the pattern `hotel-<role>` (e.g., `hotel-general-manager`).
- Every skill references Claude connectors (Gmail, Google Calendar, Google Drive, the PMS/RMS/POS) but none depend on them — they're optional accelerators.
- Hotel economics vocabulary runs through every skill: ADR, RevPAR, TRevPAR, GOPPAR, occupancy, flow-through, GOP margin, FF&E reserve, USALI line-of-sight. Keep it consistent.
- `mock/` contains a fully worked fictional hotel (The Meridian Nashville, 174 keys) with a property definition and 3 sample outputs per skill. The personas (Elena, Marcus, Priya, David, Sofia, Grace, Tomás, Noor) carry across all mock artifacts — keep them consistent when editing.
- `package.json` `files` array controls what ships to npm — every skill folder and `.claude-plugin/` must be listed there.

## When editing skills

- Keep the frontmatter `description` rich with trigger phrases — this is how Claude decides to activate the skill.
- Each skill is self-contained. Do not create cross-dependencies between skills.
- The `## What you do` section defines numbered capabilities; `### 0.` is always the Knowledge Base connection, the last `###` is always the Property JSON export.
- All skills should produce outputs ready to use (send, present, paste into a PMS/report) — not rough drafts.

## npm / CLI

```bash
node bin/cli.js help       # test CLI locally
node bin/cli.js list       # verify skill listing
```

The package name on npm is `hotel-team-skills`. The binary name is also `hotel-team-skills`.
