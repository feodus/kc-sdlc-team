---
name: rest-api-design-core
description: REST API core design principles: HTTP methods, URL structure, resources, filtering, sorting, and standard response codes. Use this skill when designing the foundational structure of REST endpoints.
---

# REST API Design — Core

> **Meta:** v1.0.0 | 05-07-2026
> **Parent Skill:** rest-api-design

## Purpose

This subskill covers the core principles of REST API design: HTTP methods, URL structure, resources, filtering, sorting, and standard response codes. Use it when designing endpoint contracts and ensuring REST compliance.

## When to Use

Use this skill:
- When designing new REST API endpoints
- For defining URL structure and resource naming
- When selecting appropriate HTTP methods
- For implementing filtering, sorting, and search
- During API design reviews

## HTTP Methods

| Method | Usage | Idempotent |
|-------|---------------|-----------------|
| GET | Retrieve resources | Yes |
| POST | Create resources | No |
| PUT | Full resource replacement | Yes |
| PATCH | Partial update | No |
| DELETE | Delete resource | Yes |

## Standard Response Codes

```
2xx - Success
200 - OK
201 - Created
204 - No Content (successful deletion)

4xx - Client Error
400 - Bad Request
401 - Unauthorized
403 - Forbidden
404 - Not Found
409 - Conflict
422 - Unprocessable Entity
429 - Too Many Requests

5xx - Server Error
500 - Internal Server Error
502 - Bad Gateway
503 - Service Unavailable
```

## URL Structure

### Resources

```yaml
# Collections
GET    /users              # User list
POST   /users              # Create user

# Single resource
GET    /users/{id}         # Get user
PUT    /users/{id}         # Update user (full)
PATCH  /users/{id}         # Partial update
DELETE /users/{id}         # Delete user

# Nested resources
GET    /users/{id}/posts           # User posts
POST   /users/{id}/posts           # Create user post
GET    /users/{id}/posts/{postId}  # Specific post
```

### Filtering, Sorting, Pagination

```yaml
# Pagination
GET /users?page=2&limit=20

# Filtering
GET /users?status=active&role=admin

# Sorting
GET /users?sort=createdAt,desc

# Search
GET /users?q=john&fields=name,email
```

## Best Practices

1. **Naming** - plural nouns
2. **Verbs only for actions** - /actions, /search
3. **Status codes** - correct HTTP codes
4. **Versioning** - v1, v2 in URL
5. **Pagination** - always for collections
6. **Filtering** - query parameters
7. **Documentation** - OpenAPI/Swagger
8. **Authentication** - Bearer tokens
9. **Rate limiting** - abuse protection
10. **Error responses** - consistent format
11. **CORS** - configure for frontend
12. **SSL/TLS** - HTTPS only in production
13. **Caching** - ETag, Last-Modified headers
14. **Idempotency** - PUT/DELETE are idempotent

## Related Skills

- `rest-api-design-documentation` — OpenAPI examples and response formats
- `rest-api-design-security` — Auth, rate limiting, CORS
- `api-design` — full API design orchestration
