# BrewMe OpenClaw Setup

## Fastest local setup

From the BrewMe repo root:

```bash
./bin/dev-mcp
```

If the MCP client is not wired yet, keep the HTTP fallback ready:

```bash
export SOURCE_HARBOR_API_BASE_URL=http://127.0.0.1:9000
```

## OpenClaw starter-pack files

- `../../openclaw.plugin.json`
- `../../brewme-mcp-template.json`
- `../../README.md`

## Minimum handoff to the agent

- one `WATCHLIST_ID`
- one `QUESTION`
- whether MCP is connected
- the live `SOURCE_HARBOR_API_BASE_URL` if HTTP fallback is needed
