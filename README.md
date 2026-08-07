# EXAMPLE CLAUDE SKILLS

## Overview

Example skills for Claude to assist Developers, Engineers, Programmers, and more. Some were created by me alone while others were created with the assistance of Claude.

Skills in this repo fall into a few broad groups:

- **Language/code style** — formatting and naming conventions for C#, Python, and TypeScript/JavaScript/CSS.
- **Database conventions** — schema, naming, and migration-safety rules for Postgres and general database design.
- **Workflow & tooling** — Git branching/commit conventions, NPM publishing steps, and scaffolding sensible `.gitignore` files for new projects.
- **API design** — structure, status codes, and request/response conventions for building APIs.
- **UI/UX** — visual design language, color, typography, and accessibility standards for web interfaces.
- **Game & CAD development** — best practices for the Godot game engine and for building Autodesk Fusion 360 Addins/Scripts.

## List of Skills

See [skills/LIST_OF_SKILLS.md](skills/LIST_OF_SKILLS.md) for the full table of available skills.

## Installation

Skills are just a folder containing a `SKILL.md` file (plus any supporting files it needs), so "installing" one means putting that folder somewhere Claude looks for it, or uploading it as a zip.

**Claude Code** reads skills from two locations:

- **Personal** (available in every project on your machine): `~/.claude/skills/<skill-name>/SKILL.md`
- **Project** (committed to git, shared with your team): `.claude/skills/<skill-name>/SKILL.md` in the project root

To use a skill from this repo with Claude Code, copy its folder from `skills/` into one of the locations above.

**Claude Desktop and Claude.ai (web)** don't read from the filesystem — custom skills are uploaded as a zip file through the app itself (see [Usage](#usage) below).

### Windows

`~` expands to `%USERPROFILE%`, so the personal skills path is `%USERPROFILE%\.claude\skills\<skill-name>\SKILL.md`.

## Usage

### Desktop App

1. Enable code execution first: **Settings > Capabilities** and turn on "Code execution and file creation" (Team/Enterprise: **Organization settings > Skills**, enabling both "Code execution and file creation" and "Skills").
2. Go to **Customize > Skills** in the left sidebar.
3. Click the **+** button.
4. Choose **Browse skills** to install a skill from Anthropic's directory, or **Upload a skill** to add one from this repo — zip the skill's folder first (e.g. `zip -r api-conventions.zip api-conventions/`), since skills here are tracked as plain folders, not pre-packaged archives.
5. Newly installed/uploaded skills are enabled by default; toggle them off if you don't want Claude to use them automatically.

### Web App

Same flow as the Desktop app, from [claude.ai](https://claude.ai):

1. Make sure code execution is enabled (**Settings > Capabilities**, or **Settings > Features** on some accounts).
2. Go to **Customize > Skills**, click **+**, then **Upload a skill** and select a zip of the skill's folder (zip it yourself first — see the Desktop App step above).
3. The skill appears in your skills list, enabled by default. Skills you upload this way are private to your account.

### Claude Code

1. Copy a skill's folder from this repo's `skills/` directory into `~/.claude/skills/` (personal, all projects) or `<project>/.claude/skills/` (project-level, shared via git).
2. Claude invokes a skill automatically when its `SKILL.md` `description` frontmatter matches what you're doing, or you can invoke it directly with `/<skill-name>`.
3. Some skills accept arguments passed after the name (e.g. `/deploy staging`), available inside the skill via `$ARGUMENTS` — none of the skills in this repo currently use that.

## Support

If this library saved you some reverse-engineering, consider [buying me a coffee](https://www.paypal.com/ncp/payment/VDTESHTRR7684). ☕

### Resources

- [Skill File Format Documentation](https://docs.claude.com/skills/skill-format)
- [Skill File Format Schema](https://docs.claude.com/skills/skill-format/schema)
- [What Are Skills](https://support.claude.com/en/articles/12512176-what-are-skills)
- [Use Skills in Claude (Desktop/Web)](https://support.claude.com/en/articles/12512180-use-skills-in-claude)
- [How to Create Custom Skills](https://support.claude.com/en/articles/12512198-how-to-create-custom-skills)
- [Extend Claude Code with Skills](https://code.claude.com/docs/en/skills)
- [Using Agent Skills with the Claude API](https://platform.claude.com/docs/en/api/skills-guide)

## License

[Apache-2.0](LICENSE)

## Copyright

(c)2026 Richard McQuiston. All Rights Reserved.
