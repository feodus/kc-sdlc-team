---
name: rest-api-design-documentation
description: REST API documentation and response formats: OpenAPI examples, success/error response structures, and HATEOAS. Use this skill when documenting API endpoints and defining response schemas.
---

# REST API Design — Documentation

> **Meta:** v1.0.0 | 05-07-2026
> **Parent Skill:** rest-api-design

## Purpose

This subskill focuses on documenting REST APIs with practical examples and standardized response formats. Use it when writing OpenAPI specs, defining response schemas, or ensuring consistent API documentation.

## When to Use

Use this skill:
- When documenting API endpoints with OpenAPI examples
- For defining success and error response formats
- When implementing HATEOAS links
- During API contract reviews
- When generating client SDKs from API specs

## Response Formats

### Success Responses

```json
// GET /users - List
{
  "data": [
    {
      "id": "550e8400-e29b-41d4-a716-446655440000",
      "email": "user@example.com",
      "name": "John Doe",
      "status": "active"
    }
  ],
  "meta": {
    "total": 100,
    "page": 1,
    "limit": 20,
    "totalPages": 5
  }
}

// GET /users/{id} - Single resource
{
  "data": {
    "id": "550e8400-e29b-41d4-a716-446655440000",
    "email": "user@example.com",
    "name": "John Doe",
    "createdAt": "2024-01-15T10:30:00Z"
  }
}

// POST /users - Creation
{
  "data": {
    "id": "550e8400-e29b-41d4-a716-446655440000",
    "email": "user@example.com",
    "name": "John Doe",
    "createdAt": "2024-01-15T10:30:00Z"
  },
  "message": "User created successfully"
}
```

### Errors

```json
// 400 Bad Request
{
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Invalid request data",
    "details": [
      {
        "field": "email",
        "message": "Invalid email format"
      },
      {
        "field": "password",
        "message": "Password must be at least 8 characters"
      }
    ]
  }
}

// 401 Unauthorized
{
  "error": {
    "code": "UNAUTHORIZED",
    "message": "Authentication required"
  }
}

// 404 Not Found
{
  "error": {
    "code": "NOT_FOUND",
    "message": "User with id 123 not found"
  }
}

// 429 Too Many Requests
{
  "error": {
    "code": "RATE_LIMIT_EXCEEDED",
    "message": "Too many requests",
    "retryAfter": 60
  }
}

// 500 Internal Server Error
{
  "error": {
    "code": "INTERNAL_ERROR",
    "message": "An unexpected error occurred"
  }
}
```

## HATEOAS (optional)

```json
{
  "data": {
    "id": "123",
    "name": "John",
    "links": {
      "self": "/users/123",
      "posts": "/users/123/posts",
      "avatar": "/users/123/avatar"
    }
  }
}
```

## OpenAPI Example

```yaml
openapi: 3.0.3
info:
  title: User Management API
  version: 1.0.0
  description: API for user management

servers:
  - url: https://api.example.com/v1
    description: Production
  - url: https://staging-api.example.com/v1
    description: Staging

paths:
  /users:
    get:
      summary: Get list of users
      description: Returns paginated list of users
      tags:
        - Users
      parameters:
        - name: page
          in: query
          schema:
            type: integer
            default: 1
        - name: limit
          in: query
          schema:
            type: integer
            default: 20
            maximum: 100
        - name: status
          in: query
          schema:
            type: string
            enum: [active, inactive]
      responses:
        '200':
          description: Successful response
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/UsersList'

components:
  schemas:
    UsersList:
      type: object
      properties:
        data:
          type: array
          items:
            $ref: '#/components/schemas/User'
        meta:
          $ref: '#/components/schemas/PaginationMeta'
```

## Related Skills

- `rest-api-design-core` — REST principles and URL structure
- `rest-api-design-security` — Auth, rate limiting, CORS
- `api-design` — full API design orchestration
