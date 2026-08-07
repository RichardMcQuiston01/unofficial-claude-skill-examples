---
name: csharp-style
description: My C# code style and testing conventions. Use whenever writing, editing, or reviewing C# code, or writing C# tests.
---

# C# Style

- 4-space indent
- `PascalCase` for classes/methods
- `_camelCase` for private fields
- `camelCase` for local variables, parameters
- Prefer primary constructors where possible
- Use auto-properties, and `field` if necessary
- Write XML comments on all classes, methods, properties, and fields
- Prefer writing clear code and use inline comments sparingly

## Tests

- `<ClassName>Tests` for the test class name
- `<MethodName>_<Conditions>_<AssertedOutcome>` for test method names (never an `Async` suffix)
- Arrange, Act, Assert pattern — comment each section in the method
