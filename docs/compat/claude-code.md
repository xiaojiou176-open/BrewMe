# Claude Code Compatibility

This is the shortest honest Claude Code adoption path for BrewMe.

## Pick Your Door

| If you want to... | Use this | Why |
| --- | --- | --- |
| give Claude Code governed access to jobs, retrieval, and artifacts | MCP | same control-tower truth the operator surfaces use |
| call BrewMe from scripts or tools | `@brewme/sdk` | typed HTTP client for the public contract |
| do quick terminal inspection | `@brewme/cli` | thin CLI over the current API |
| boot and manage the whole repo locally | `./bin/brewme` | repo-local runtime management stays in the clone |

## Fastest Path

1. Start with [docs/builders.md](../builders.md).
2. Choose MCP if you want agent reuse, or CLI/SDK if you want builder reuse.
3. Follow [docs/start-here.md](../start-here.md) only when you need the full
   local runtime.

## Starter Template

Use [templates/public-skills/claude-code/brewme-watchlist-briefing.md](../../templates/public-skills/claude-code/brewme-watchlist-briefing.md)
when you want Claude Code to operate over BrewMe watchlists, Ask, and
evidence surfaces without reading any private repo memory first.

## Plugin-Grade Bundle

If you want a stronger, submission-ready bundle instead of a docs-only starter,
use:

- [starter-packs/claude-code/brewme-claude-plugin/README.md](../../starter-packs/claude-code/brewme-claude-plugin/README.md)
- [starter-packs/claude-code/brewme-claude-plugin/.claude-plugin/plugin.json](../../starter-packs/claude-code/brewme-claude-plugin/.claude-plugin/plugin.json)
- [starter-packs/claude-code/brewme-claude-plugin/.mcp.json](../../starter-packs/claude-code/brewme-claude-plugin/.mcp.json)
- [starter-packs/claude-code/brewme-claude-plugin/skills/brewme-watchlist-briefing/SKILL.md](../../starter-packs/claude-code/brewme-claude-plugin/skills/brewme-watchlist-briefing/SKILL.md)

This is the repo's strongest current artifact for Anthropic marketplace
submission or local plugin loading.

## Honest Boundary

- Claude Code is a **ship-now fit** through MCP + HTTP API + the new public
  starter layer.
- BrewMe now ships a plugin-grade Claude Code bundle, but official
  marketplace listing still depends on Anthropic review and directory policy.
- This is still a source-first integration story, not a hosted Claude Code
  product promise.
