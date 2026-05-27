# BrewMe Capability Map

This skill focuses on the BrewMe surfaces that help answer one operator question from one watchlist.

## Relevant MCP capability groups

- `brewme.health.get`
- `brewme.retrieval.search`
- `brewme.jobs.get`
- `brewme.jobs.compare`
- `brewme.artifacts.get`
- `brewme.reports.daily_send`
- `brewme.workflows.run`

## Best default order

1. health
2. watchlist + briefing payload
3. retrieval / ask-style evidence lookup
4. jobs or artifacts only when the answer needs proof of what changed
5. do not drift into subscription or notification changes unless the operator changes the task
