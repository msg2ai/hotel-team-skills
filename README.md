# Hotel Team Skills

A Claude Code plugin that gives an independent or small-chain hotel (typically 50–300 keys) the leverage of a much larger corporate office. It ships a team of AI role-skills that work from one shared knowledge base and speak the language of hotel operations.

## Roles

| Skill | Acts as |
| --- | --- |
| `hotel-general-manager` | General Manager / Director of Operations |
| `hotel-front-office` | Front Office / Rooms leader |
| `hotel-revenue-management` | Revenue Manager |
| `hotel-finance-controller` | Controller / Director of Finance |
| `hotel-food-beverage` | F&B Manager |
| `hotel-housekeeping-rooms` | Housekeeping / Rooms executive |
| `hotel-sales-marketing` | Director of Sales & Marketing |
| `hotel-vibe-coder` | Engineering / automation helper |

Each skill is a folder containing a `SKILL.md` that defines the role, its rhythm, and the shared knowledge-base structure it expects.

## Shared Knowledge Base

Every role works from one shared knowledge base (Google Drive, Dropbox, OneDrive, Notion, etc.). If none exists, the skills will bootstrap one with a canonical folder structure: property brief, brand & voice, rooms inventory, channels & distribution, rate strategy, rooms & housekeeping, F&B, finance & accounting, and guests. See any `SKILL.md` for the full layout.

## Status

Early / under active development.
