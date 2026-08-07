# CHANGELOG

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## [Unreleased]

### Added

- `skills/` directory with 13 example skills: `api-conventions`, `csharp-style`, `database-conventions`, `default-gitignore-files`, `fusion-360-addin`, `git-workflow`, `godot-game-engine`, `logging-conventions`, `npm-registry`, `postgres-style`, `python-style`, `typescript-style`, `ui-design`.
- `skills/LIST_OF_SKILLS.md` — table of all skills (title, description, folder, categories), split out of `README.md` so it can grow independently.
- `.gitignore` covering editor/IDE files, OS cruft, `.env`/secrets, logs, and build artifacts for Node/TypeScript, Python, C#/.NET, and Godot — the languages and tooling these skills document.
- `README.md` sections: expanded **Overview** describing the skill categories, **Installation** (personal vs. project skill directories for Claude Code, zip upload for Desktop/Claude.ai), **Usage** (step-by-step for Desktop App, Web App, and Claude Code), and additional **Resources** links to official Claude Skills documentation.
- Link from `README.md`'s License section to the `LICENSE` file, and from its List of Skills section to `skills/LIST_OF_SKILLS.md`.

### Changed

- `skills/database-conventions/SKILL.md` — corrected the frontmatter `description`, which had been copy-pasted from `csharp-style` and referenced C# instead of database conventions.
- `skills/default-gitignore-files/` — unpacked from a zipped `default-gitignore-files.skill` archive back into a plain folder (`SKILL.md` + `templates/*.gitignore`), so every skill in the repo is folder-based and consistent.
- `README.md` — removed the "Skill Formats" section (folder-vs-single-file distinction and `.skill` packaging instructions) now that no packaged `.skill` archives ship in this repo; Desktop/Web upload steps now note that zipping a folder is a one-off step the user does themselves if needed.

## [Initial] - 2026-08-07

### Added

- `LICENSE` (Apache-2.0).
- `README.md` stub.
