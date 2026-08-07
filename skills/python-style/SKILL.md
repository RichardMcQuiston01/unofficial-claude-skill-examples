---
name: python-style
description: My Python code style conventions. Use whenever writing, editing, or reviewing Python code.
---

# Python Style

- MUST use meaningful, descriptive variable and function names
- MUST follow PEP 8 style guidelines
- MUST use 4 spaces for indentation (never tabs)
- NEVER use emoji, or unicode that emulates emoji (e.g. ✓, ✗) — the only exception is when writing tests that specifically test multibyte-character handling
- `snake_case` for functions/variables, `PascalCase` for classes, `UPPER_CASE` for constants
- Limit line length to 88 characters (ruff formatter standard)
- Prefer writing clear code and use inline comments sparingly
