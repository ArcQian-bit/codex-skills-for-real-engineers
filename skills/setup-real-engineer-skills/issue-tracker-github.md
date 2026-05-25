# Issue tracker: GitHub

Issues and PRDs for this repo live as GitHub issues. Prefer the Codex GitHub connector when it is available; otherwise use the `gh` CLI.

## Conventions

- **Create an issue**: use the GitHub connector's create-issue action, or `gh issue create --title "..." --body "..."`. Use a heredoc for multi-line bodies when using `gh`.
- **Read an issue**: `gh issue view <number> --comments`, filtering comments by `jq` and also fetching labels.
- **List issues**: `gh issue list --state open --json number,title,body,labels,comments --jq '[.[] | {number, title, body, labels: [.labels[].name], comments: [.comments[].body]}]'` with appropriate `--label` and `--state` filters.
- **Comment on an issue**: `gh issue comment <number> --body "..."`
- **Apply / remove labels**: `gh issue edit <number> --add-label "..."` / `--remove-label "..."`
- **Close**: `gh issue close <number> --comment "..."`

Infer the repo from `git remote -v`. The Codex connector needs `owner/name`; `gh` infers it automatically when run inside a clone.

## When a skill says "publish to the issue tracker"

Create a GitHub issue.

## When a skill says "fetch the relevant ticket"

Use the GitHub connector to fetch the issue, or run `gh issue view <number> --comments`.
