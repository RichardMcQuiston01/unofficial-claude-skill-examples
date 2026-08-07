---
name: git-workflow
description: My git branching model and commit message conventions. Use whenever creating a branch, naming a branch, writing a commit message, opening a PR, or discussing git workflow.
---

# Git Workflow

## Branches

| Branch    | Purpose           |
| --------- | ----------------- |
| `main`    | Live/production   |
| `dev`     | Development       |
| `release` | Release candidate |
| `staging` | Staging           |
| `hotfix`  | Hotfixes          |

## Commit Messages

- Always use Conventional Commits (`type(scope): summary`).
- Summary line 50 characters or less.
- Blank line between subject and body.
- Body wraps and explains _why_, not just _what_.

## Workflow

- Work on new features should be performed on a 'feature' prefixed branch that branches from 'dev', but confirm with user first if this rule should be followed.
- Work on fixes should generally be performed on a 'hotfix' prefixed branch that branches from the branch where the error is found, but confirm with user first if this rule should be followed.
- Claude should create merge requests(or Pull Request) for user review unless otherwise specified

## Caveats

- If only 'main' exists in repository, Claude should create the 'dev', 'release', and 'staging' branches from it before beginning afer confirmation by user.
