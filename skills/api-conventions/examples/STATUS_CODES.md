# API CONVENTIONS

## HTTP STATUS CODE EXAMPLES

- Return 401 rather 500 for failed authentications
- Return 403 rathern 500 when a user attempts to access a resource that is not permitted due to their permission(e.g. Standard User trying to access an Admin endpoint)
- Return 408 for Request Timeouts rather where possible rather than 404 or 500
- Rate Limiting responses should return 429

## Resources

- <https://en.wikipedia.org/wiki/List_of_HTTP_status_codes>