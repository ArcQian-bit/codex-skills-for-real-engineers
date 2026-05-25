# Porting Audit

Source checked:

- Repository: https://github.com/mattpocock/skills
- Upstream commit used locally: `b8be62ffacb0118fa3eaa29a0923c87c8c11985c`
- Scope: skills listed in upstream `.claude-plugin/plugin.json`

## Scope Decision

The upstream repo contains deprecated, in-progress, personal, and misc skills in
addition to the public plugin manifest. This Codex port treats the upstream
plugin manifest as the function-complete public product surface.

Deprecated and personal skills were intentionally not included. Misc skills not
listed in the upstream plugin manifest were also not included because they are
not part of the advertised "Skills For Real Engineers" plugin set.

## Migration Matrix

| Status | Upstream path | Codex path | Notes |
| --- | --- | --- | --- |
| Ported | `skills/engineering/diagnose` | `skills/diagnose` | Preserves HITL reproduction script. |
| Ported | `skills/engineering/grill-with-docs` | `skills/grill-with-docs` | Preserves CONTEXT and ADR formats. |
| Ported | `skills/engineering/triage` | `skills/triage` | Preserves agent brief and out-of-scope references. |
| Ported | `skills/engineering/improve-codebase-architecture` | `skills/improve-codebase-architecture` | Preserves architecture language, HTML report, interface design references. |
| Ported and renamed | `skills/engineering/setup-matt-pocock-skills` | `skills/setup-real-engineer-skills` | Renamed for Codex; now writes `AGENTS.md` by default. |
| Ported | `skills/engineering/tdd` | `skills/tdd` | Preserves tests, mocking, refactoring, interface, deep-module references. |
| Ported | `skills/engineering/to-issues` | `skills/to-issues` | Preserves vertical-slice issue workflow. |
| Ported | `skills/engineering/to-prd` | `skills/to-prd` | Preserves PRD template. |
| Ported | `skills/engineering/zoom-out` | `skills/zoom-out` | Removed Claude-specific invocation metadata. |
| Ported | `skills/engineering/prototype` | `skills/prototype` | Preserves logic and UI prototype branches. |
| Ported | `skills/productivity/caveman` | `skills/caveman` | Codex trigger wording adjusted. |
| Ported | `skills/productivity/grill-me` | `skills/grill-me` | Preserves one-question-at-a-time plan grilling. |
| Ported | `skills/productivity/handoff` | `skills/handoff` | Removed Claude-specific argument hint; description carries trigger context. |
| Ported | `skills/productivity/write-a-skill` | `skills/write-a-skill` | Preserves progressive-disclosure skill-writing guidance. |

## Codex-Specific Changes

- `setup-real-engineer-skills` creates or updates `AGENTS.md`, because Codex
  reads that file for repo instructions.
- GitHub issue-tracker docs prefer the Codex GitHub connector when available,
  with `gh` as a fallback.
- Claude-only frontmatter keys were removed so Codex skill validation accepts
  the skill files.
- Upstream references that required Claude's Agent tool were changed to
  optional Codex multi-agent usage with a direct-exploration fallback.
- `agents/openai.yaml` was generated for every skill.

## Verification

Run:

```bash
python3 tests/validate_port.py
```

The tests check:

- Exact expected 14-skill inventory.
- Upstream-to-Codex mapping completeness.
- Required resource files per skill.
- Codex-compatible frontmatter.
- `agents/openai.yaml` presence.
- Markdown links in skill resources resolve.
- No unsupported Claude-only invocation metadata remains.
