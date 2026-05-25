# Skills For Real Engineers for Codex

[![GitHub stars](https://img.shields.io/github/stars/ArcQian-bit/codex-skills-for-real-engineers?style=social)](https://github.com/ArcQian-bit/codex-skills-for-real-engineers/stargazers)
[![Source](https://img.shields.io/badge/source-mattpocock%2Fskills-blue)](https://github.com/mattpocock/skills)

A Codex port of Matt Pocock's **Skills For Real Engineers**. The goal is a
function-complete migration of the public upstream plugin skill set into native
Codex skill folders, with Codex project setup, GitHub connector guidance, and
`agents/openai.yaml` metadata.

This is an independent Codex adaptation, not the upstream official repository.
Upstream source: https://github.com/mattpocock/skills

## Quick Install

Install all 14 Codex skills:

```bash
curl -fsSL https://raw.githubusercontent.com/ArcQian-bit/codex-skills-for-real-engineers/main/install.sh | bash
```

Install selected skills:

```bash
CODEX_REAL_ENGINEER_SKILLS=tdd,diagnose,grill-with-docs \
  curl -fsSL https://raw.githubusercontent.com/ArcQian-bit/codex-skills-for-real-engineers/main/install.sh | bash
```

Install from a local checkout:

```bash
CODEX_REAL_ENGINEER_SOURCE_DIR="$PWD" ./install.sh
```

Restart Codex after installation so the new skills are discovered.

## Included Skills

| Codex skill | Upstream source | Purpose |
| --- | --- | --- |
| `diagnose` | `skills/engineering/diagnose` | Build a reproducible feedback loop before fixing hard bugs and regressions. |
| `grill-with-docs` | `skills/engineering/grill-with-docs` | Stress-test plans against project domain language and ADRs. |
| `triage` | `skills/engineering/triage` | Move issues through a maintainer/agent triage state machine. |
| `improve-codebase-architecture` | `skills/engineering/improve-codebase-architecture` | Find shallow modules and propose deeper, more testable shapes. |
| `setup-real-engineer-skills` | `skills/engineering/setup-matt-pocock-skills` | Configure `AGENTS.md` and `docs/agents/` for Codex. |
| `tdd` | `skills/engineering/tdd` | Work in red/green/refactor vertical slices. |
| `to-issues` | `skills/engineering/to-issues` | Break PRDs and plans into independently grabbable issues. |
| `to-prd` | `skills/engineering/to-prd` | Turn existing conversation context into a PRD issue. |
| `zoom-out` | `skills/engineering/zoom-out` | Map a code area in broader system context. |
| `prototype` | `skills/engineering/prototype` | Build throwaway logic or UI prototypes to answer design questions. |
| `caveman` | `skills/productivity/caveman` | Use terse, high-signal technical communication. |
| `grill-me` | `skills/productivity/grill-me` | Interview a plan until the decision tree is resolved. |
| `handoff` | `skills/productivity/handoff` | Write a continuation brief for another agent or fresh session. |
| `write-a-skill` | `skills/productivity/write-a-skill` | Create concise agent skills with progressive disclosure. |

## Codex Adaptation

- Flattened upstream plugin paths into `skills/<skill-name>` for direct Codex installation.
- Renamed `setup-matt-pocock-skills` to `setup-real-engineer-skills` and made `AGENTS.md` the default Codex project instruction file.
- Removed Claude-specific frontmatter unsupported by Codex skill validation.
- Updated GitHub issue-tracker instructions to prefer the Codex GitHub connector, falling back to `gh` when needed.
- Made multi-agent architecture exploration optional: use Codex multi-agent tools when available, otherwise perform independent passes directly.
- Added `agents/openai.yaml` metadata for every skill.

## Coverage Audit

See [PORTING-AUDIT.md](PORTING-AUDIT.md) for the migration checklist. The test
suite verifies that all 14 upstream public plugin skills are present, required
support files are included, Codex frontmatter is valid, and local skill links
resolve.

## Verify

```bash
python3 tests/validate_port.py
```

## Attribution

This repository adapts MIT-licensed work from Matt Pocock's
[`mattpocock/skills`](https://github.com/mattpocock/skills), "Skills For Real
Engineers. Straight from my .claude directory."

The upstream repository remains the canonical source for Matt's original
skills. This repository exists to make that public skill set easier to install
and use in Codex.
