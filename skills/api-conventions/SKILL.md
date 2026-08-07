---
name: api-conventions
description: API Conventions for structure, comments, requests, and responses.
---

# API Conventions

## General

- Prefer specific HTTP Response Codes(e.g. 400) over generic Codes wherever available(e.g 500)
  - See [STATUS CODES](examples/STATUS_CODES.md) for more examples.
- Error Responses should include specific errors for troubleshooting purposes rather than generic messages.  
  - If Security is a concern, develop a table for Developers that have anonymized Error Codes(i.e. 1001) along with how to locate and/or diagnose the issue.  In such case, return the anonymized code(e.g. 1001) in the HTTP Response.
- Requests and Responses should follow a standard format across the entire API.
- Development and use of specific DTO or Interfaces(where available) for each Endpoint is preferred.
  - If a language supports shared libraries, these DTO and/or Interfaces should be in a shared library that is easily accessible by projects accessing the API(e.g. frontend, mobile app, etc.)
- Follow standard REST style URLs unless otherwise specified(i.e. POST for INSERT, PUT for UPDATE, DELETE for delete, etc.)
- Prefer JSON encoding for Request bodies for POST, PUT, PATCH, etc.
- Prefer JSON for Response bodies where supported

## TypeScript

- Use OpenAPI(aka Swagger) for documenting API endpoints and related resources(e.g. DTO)