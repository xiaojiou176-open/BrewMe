<p align="center">
  <img src="https://em-content.zobj.net/source/apple/391/hot-beverage_2615.png" width="120" alt="hot beverage" />
</p>

<h1 align="center">BrewMe</h1>

<p align="center">
  <strong>wake up, news already brewed</strong>
</p>

<p align="center">
  <a href="https://github.com/xiaojiou176-open/BrewMe/stargazers"><img src="https://img.shields.io/github/stars/xiaojiou176-open/BrewMe?style=flat&color=yellow" alt="Stars"></a>
  <a href="https://github.com/xiaojiou176-open/BrewMe/commits/main"><img src="https://img.shields.io/github/last-commit/xiaojiou176-open/BrewMe?style=flat" alt="Last Commit"></a>
  <a href="LICENSE"><img src="https://img.shields.io/github/license/xiaojiou176-open/BrewMe?style=flat" alt="License"></a>
</p>

<p align="center">
  <a href="#what-you-get">What You Get</a> •
  <a href="#install">Install</a> •
  <a href="#how-it-work">How It Work</a> •
  <a href="#ecosystem">Ecosystem</a>
</p>

---

BrewMe is your morning news desk in a box. RSS, web, podcasts, papers, GitHub — all in, ranked by what *you* care about, served the moment your alarm rings.

```
┌──────────────────────────────────────┐
│  LOCAL-FIRST          ████████ 100%  │
│  SOURCE-TRACEABLE     ████████ 100%  │
│  TYPING REQUIRED      ░░░░░░░░   0%  │
│  VIBES                ████████ ZERO  │
│                                FILLER│
└──────────────────────────────────────┘
```

> Personal news brewer. Ingest, weigh, summarize. Caffeine-grade signal-to-noise.

## What You Get

| Surface | What |
|---|---|
| `brewme apps` | Web, terminal, and bin entry points. Same brew, different cup. |
| `packages & starter-packs` | Everything you need to brew your own beat. |
| `contracts` | Source schemas, weighing schemas, brief schemas. All versioned. |
| `infra` | One Docker compose. Cron, fetcher, ranker, brewer, server. |
| `evals` | Prove the brew is better than yesterday. |

> [!IMPORTANT]
> Local-first by default. No silent telemetry. No cloud round-trip. Your data stays on your machine until you explicitly ship it somewhere.

## Install

```bash
git clone https://github.com/xiaojiou176-open/BrewMe.git
cd BrewMe
# follow the per-stack quickstart in INSTALL.md or docs/
```

Three commands. No `curl | sh`. No login. Read what you run.

Install break? Open your favorite agent and say *"Read AGENTS.md and bootstrap BrewMe for me."* Agent fix own brain. Long version: [`docs/`](./docs/).

## How It Work

The repo is seven layers — exactly the seven commits in `git log`. New work goes in as small named PRs. No 50-file mystery commits.

| Layer | What |
|---|---|
| `chore: scaffold` | License, governance, hygiene gates, CI scaffolding. |
| `feat(core)` | The primary engine. The reason BrewMe exists. |
| `feat(modules)` | Packages, adapters, services, plugins. The second floor. |
| `feat(contracts)` | Schemas, configs, public boundaries. Other code talks here. |
| `test:` | Receipts. Everything in this layer must run. |
| `feat(ops)` | Scripts, infra, CI helpers, build glue. |
| `docs:` | Public docs surface. The pretty face. |

`git log` reads like a building floor plan. Look once, know the whole shape.

## Ecosystem

BrewMe lives in the ***Me family**: three personal tools. command-style names, stupid-simple jobs.

| Repo | What |
|---|---|
| [**BeamMe**](https://github.com/xiaojiou176-open/BeamMe) | beam your agent config to any planet |
| [**BrewMe**](https://github.com/xiaojiou176-open/BrewMe) *(you here)* | wake up, news already brewed |
| [**AgentGangGang**](https://github.com/xiaojiou176-open/AgentGangGang) | five AIs in one sidebar |

Cross-family taste:
[**BeamMe**](https://github.com/xiaojiou176-open/BeamMe) ·
[**BrewMe**](https://github.com/xiaojiou176-open/BrewMe) ·
[**OpenVibeCoding**](https://github.com/xiaojiou176-open/OpenVibeCoding) ·
[**proofyard**](https://github.com/xiaojiou176-open/proofyard).

## Star This Repo

If BrewMe saves you a click, an hour, or a headache — star costs zero. Fair trade. ⭐

[![Star History Chart](https://api.star-history.com/svg?repos=xiaojiou176-open/BrewMe&type=Date)](https://star-history.com/#xiaojiou176-open/BrewMe&Date)

## Also by Yifeng[Terry] Yu

- **[BeamMe](https://github.com/xiaojiou176-open/BeamMe)** — beam your agent config to any planet
- **[AgentGangGang](https://github.com/xiaojiou176-open/AgentGangGang)** — five AIs in one sidebar
- **[OpenVibeCoding](https://github.com/xiaojiou176-open/OpenVibeCoding)** — AI codes overnight, you ship in the morning
- **[proofyard](https://github.com/xiaojiou176-open/proofyard)** — every claim ships with its receipt
- **[dealyard](https://github.com/xiaojiou176-open/dealyard)** — let prices fight, you sit and watch

## License

MIT — small print, big freedom.
