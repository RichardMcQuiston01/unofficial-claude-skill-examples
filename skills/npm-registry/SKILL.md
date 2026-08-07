---
name: npm-registry
description: Guidelines for publishing projects to NPM registry
---

## Rules

- Keep README.md file updated with instructions for prerequisites, installation, and usage of a project's feature(s)
- Update CHANGELOG.md prior to creating a PR or MR.
- README.md should have a License section with notes and a link to LICENSE file within the root directory [see examples/LICENSE].

## Instructions

- If a CHANGELOG.md file does not exist, create one and use the Git history to fill it out for starters.
- If a LICENSE file does not exist, create one and ask the User to confirm which License to utilize.
- NPM packages should use the @richardmcquiston01 prefix unless otherwise specified. Fill this info into the package.json for any project that the User intends to pubish to the NPM registry.
- The email address for package.json files and the like should use email.redacted@gmail.com
- Add a Support section to README.md file if it does not already exist, which contains donation link to PayPal or [see examples/README.md]
- During final testing, code should all be merged to 'staging' branch'
- Once code is ready for publishing to NPM, the version number should be incremented and CHANGELOG.md updated before merging to 'release' via a PR.
