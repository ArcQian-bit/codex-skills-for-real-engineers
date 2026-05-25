# Porting Audit

Source checked:

- Repository: https://github.com/mattpocock/skills
- Upstream commit used locally: `b8be62ffacb0118fa3eaa29a0923c87c8c11985c`
- Scope: skills listed in upstream `.claude-plugin/plugin.json`

The upstream repo contains deprecated, in-progress, personal, and misc skills in addition to the public plugin manifest. This Codex port treats the upstream plugin manifest as the function-complete public product surface.

All 14 public plugin skills are ported. `setup-matt-pocock-skills` is intentionally renamed to `setup-real-engineer-skills` for Codex and now writes `AGENTS.md` by default.

Codex-specific changes:

- GitHub issue-tracker docs prefer the Codex GitHub connector, with `gh` as a fallback.
- Claude-only frontmatter keys were removed.
- Claude Agent-tool references were changed to optional Codex multi-agent usage with direct fallback.
- `agents/openai.yaml` was generated for every skill.
