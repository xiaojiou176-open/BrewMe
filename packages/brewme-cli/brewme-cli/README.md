# @brewme/cli

Thin public CLI bridge for the BrewMe repo-local command surface.

This package is intentionally smaller than the repo-local `./bin/brewme`
operator facade. Its job is not to invent a second runtime manager. Its job is
to make the existing repo-owned command surface easier to discover and reuse.

## Install

From a BrewMe checkout:

```bash
npm install -g ./packages/brewme-cli
```

If you later publish this package to a registry, replace the local path with
the published package name.

## Examples

```bash
cd /path/to/brewme
brewme help
brewme doctor
brewme mcp
brewme templates
brewme search "agent workflows"
brewme ask "What changed this week?"
```

For `templates`, `search`, `ask`, and `job`, point the CLI at a real
BrewMe API first. The easiest path is to source
`.runtime-cache/run/full-stack/resolved.env` after `./bin/full-stack up`, or
set `SOURCE_HARBOR_API_BASE_URL` yourself if the API is not on `9000`.

## Boundary

- This package is a **repo-aware delegate**, not a second runtime stack.
- Inside a checkout it forwards to `./bin/brewme`.
- Outside a checkout it falls back to public docs guidance.
- For typed application integration, use `@brewme/sdk`.
- The public HTTP helpers stay intentionally thin: `templates`, `search`, `ask`,
  and `job` only call the current BrewMe HTTP contract.
