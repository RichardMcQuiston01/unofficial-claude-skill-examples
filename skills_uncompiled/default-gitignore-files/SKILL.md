---
name: default-gitignore-files
description: Adds a sensible .gitignore file to a project. Use this whenever the user is starting, initializing, or scaffolding a new project (running git init, creating a new repo, setting up a codebase in any language), or explicitly asks for a .gitignore, wants to ignore build artifacts/node_modules/__pycache__/target//.env files, or mentions committing files they didn't mean to commit. Also use it proactively any time you notice a project root has no .gitignore file yet — check for one before your first commit or before creating new source files in a fresh repo, and if a template matches the project's stack, offer to add it. Covers TypeScript/Node, Go, Python, Rust, Ruby, Java, C++, C#, PHP, and Swift out of the box, and can still help (by searching for or drafting one) even for stacks without a bundled template.
---

# Default .gitignore Files

Give a project a good `.gitignore` with minimal friction, using vetted templates for TypeScript/Node, Go, and Python.

## Why this matters

A missing or weak `.gitignore` is how build output, dependency folders (`node_modules/`), secrets (`.env`), and editor/OS clutter end up committed to a repo. It's cheapest to fix before the first commit — but it's still worth fixing later, since anything not yet tracked by git will simply start being ignored going forward.

## When to act

Check for a `.gitignore` in the project root whenever:
- The user is initializing a new project or repo (`git init`, scaffolding a new app, `npm create`, `go mod init`, a fresh Python project, etc.)
- The user explicitly asks for a `.gitignore` or mentions wanting to ignore certain files/folders
- You're about to make the first commit in a repo and notice there's no `.gitignore` yet
- The user mentions accidentally committing something that should have been ignored (e.g. `node_modules`, `.env`, `__pycache__`, build output)

## Workflow

1. **Check whether a `.gitignore` already exists** in the project root. If one exists, don't overwrite it silently — if it looks incomplete for the stack in use, offer to append the missing sections instead of replacing the file.
2. **Identify the project's stack.** Look for clear signals:

   | Stack | Signals |
   |---|---|
   | TypeScript / Node.js | `package.json`, `tsconfig.json` |
   | Go | `go.mod` |
   | Python | `requirements.txt`, `pyproject.toml`, `*.py` files |
   | Rust | `Cargo.toml` |
   | Ruby | `Gemfile`, `*.gemspec` |
   | Java | `pom.xml`, `build.gradle`(`.kts`) |
   | C++ | `CMakeLists.txt`, `*.cpp`/`*.hpp` files |
   | C# | `*.csproj`, `*.sln` |
   | PHP | `composer.json` |
   | Swift | `Package.swift`, `*.xcodeproj`/`*.xcworkspace` |

   A project can match more than one (e.g. a Python backend with a TypeScript frontend) — that's fine, combine templates.
3. **If no `.gitignore` exists and a matching template is available, ask the user before adding it.** Don't add files to their project silently. A short confirmation is enough, e.g.: "This looks like a TypeScript project with no .gitignore yet — want me to add one?" Once they confirm, write the template to `<project-root>/.gitignore`.
4. **If the stack doesn't match a bundled template**, say so plainly rather than guessing — offer to search for a well-known template for that stack (e.g. from GitHub's github/gitignore collection) or draft a reasonable one based on what's in the project directory.
5. **If the stack combines multiple bundled templates** (e.g. Python + TypeScript monorepo), concatenate the relevant templates with a comment header separating each section, and dedupe obviously repeated lines (like `.env`, `.DS_Store`).

## Templates

Bundled templates live in `templates/`:

| Stack | File |
|---|---|
| TypeScript / Node.js | `templates/typescript.gitignore` |
| Go | `templates/go.gitignore` |
| Python | `templates/python.gitignore` |
| Rust | `templates/rust.gitignore` |
| Ruby | `templates/ruby.gitignore` |
| Java | `templates/java.gitignore` |
| C++ | `templates/cpp.gitignore` |
| C# | `templates/csharp.gitignore` |
| PHP | `templates/php.gitignore` |
| Swift | `templates/swift.gitignore` |

Read the relevant file(s) directly and write their contents (or the combined/deduped result) to `.gitignore` at the project root. Don't paraphrase or retype them from memory — copy them as-is so nothing is missed.

## Notes

- Never overwrite an existing `.gitignore` without the user's OK.
- If you add or extend a `.gitignore` for a repo that already has commits, remind the user that a `.gitignore` only affects untracked files — anything already committed (e.g. `node_modules/` that snuck in before) needs to be removed with `git rm -r --cached <path>` separately. Offer to do that too, but don't run it without confirmation.
