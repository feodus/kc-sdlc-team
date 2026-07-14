---
name: api-design-operations
description: Designing API versioning, pagination, error handling, and deprecation strategies. Use this skill when implementing operational concerns for REST APIs.
---

# API Design — Operations

> **Meta:** v1.0.0 | 05-07-2026
> **Parent Skill:** api-design

## Purpose

This subskill covers operational aspects of API design: versioning, pagination, error handling, filtering, sorting, and deprecation strategies. Use it to ensure APIs remain maintainable and backward-compatible.

## When to Use

Use this skill:
- When implementing API versioning strategies
- For designing pagination, filtering, and sorting mechanisms
- When defining standardized error formats and responses
- For planning API deprecation and migration
- During API lifecycle management

## Versioning

API versioning strategies:

| Strategy | Example | Advantages | Disadvantages |
|----------|---------|------------|---------------|
| **URL Path** | `/v1/users` | Simplicity, explicitness | URL pollution |
| **Query Param** | `/users?version=1` | Clean URLs | Caching |
| **Header** | `Accept: application/vnd.api.v1+json` | Clean URLs | Complexity |
| **Content Negotiation** | `Accept: application/vnd.example.v1+json` | Flexibility | Documentation |

**Recommendation:** Use URL Path versioning (`/v1/`, `/v2/`)

```yaml
# OpenAPI with versioning
servers:
  - url: https://api.example.com/v1
    description: Version 1 (current)
  - url: https://api.example.com/v2
    description: Version 2 (beta)

paths:
  /v1/users:
    get:
      summary: Get users (v1)
      deprecated: true
      description: |
        ## Deprecated
        Use `/v2/users` for new integrations.
        This version will be removed on 31.12.2026.
      responses:
        '200':
          description: Success

  /v2/users:
    get:
      summary: Get users (v2)
      description: |
        ## Changes from v1
        - Added `profile_url` field
        - Changed date format to ISO 8601
      responses:
        '200':
          description: Success
```

## Pagination

### Offset-based Pagination

```yaml
# Parameters
parameters:
  Offset:
    name: offset
    in: query
    description: Offset (record number)
    schema:
      type: integer
      default: 0
      minimum: 0
  
  Limit:
    name: limit
    in: query
    description: Number of records
    schema:
      type: integer
      default: 20
      maximum: 100
      minimum: 1

# Response
responses:
  UserList:
    description: User list
    content:
      application/json:
        schema:
          type: object
          properties:
            data:
              type: array
              items:
                $ref: '#/components/schemas/User'
            meta:
              type: object
              properties:
                total:
                  type: integer
                offset:
                  type: integer
                limit:
                  type: integer
                has_more:
                  type: boolean
```

### Cursor-based Pagination

```yaml
parameters:
  Cursor:
    name: cursor
    in: query
    description: Cursor for next page
    schema:
      type: string

# Response
responses:
  UserListCursor:
    description: User list
    content:
      application/json:
        schema:
          type: object
          properties:
            data:
              type: array
              items:
                $ref: '#/components/schemas/User'
            pagination:
              type: object
              properties:
                cursor:
                  type: string
                  description: Cursor for next page
                has_next:
                  type: boolean
                has_prev:
                  type: boolean
```

| Characteristic | Offset-based | Cursor-based |
|----------------|--------------|--------------|
| Simplicity | ✅ Simple | ⚠️ More complex |
| Page URL | ✅ `/page/2` | ⚠️ None |
| Skips on insert | ❌ Yes | ✅ No |
| Performance | ❌ Slow for large offsets | ✅ Fast |
| Caching | ✅ Good | ❌ Poor |

## Error Handling

### Error Structure

```json
{
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Validation failed",
    "details": [
      {
        "field": "email",
        "message": "Invalid email format",
        "code": "INVALID_FORMAT",
        "value": "invalid-email"
      }
    ],
    "trace_id": "req-abc123-xyz789",
    "timestamp": "2026-02-23T12:00:00Z",
    "documentation_url": "https://api.example.com/docs/errors#validation"
  }
}
```

### Error Codes

```yaml
components:
  schemas:
    ErrorCode:
      type: object
      description: API error codes
      enum:
        # 4xx Client Errors
        - BAD_REQUEST
        - VALIDATION_ERROR
        - UNAUTHORIZED
        - FORBIDDEN
        - NOT_FOUND
        - CONFLICT
        - RATE_LIMIT_EXCEEDED
        - INVALID_ACCEPT_HEADER
        # 5xx Server Errors
        - INTERNAL_ERROR
        - SERVICE_UNAVAILABLE
        - EXTERNAL_SERVICE_ERROR
```

### Retry Strategy

```json
{
  "error": {
    "code": "SERVICE_UNAVAILABLE",
    "message": "Service temporarily unavailable",
    "retry_after": 30,
    "trace_id": "req-abc123"
  }
}
```

## Deprecation

```yaml
# Deprecation via headers
components:
  headers:
    Deprecation:
      description: URL of the substituted by a more recent stable resource that's supported.
      schema:
        type: string
        format: uri
    Sunset:
      description: Indicates when the associated response should no longer be used.
      schema:
        type: string
        format: date-time

# Usage example
paths:
  /users:
    get:
      summary: Get users
      deprecated: true
      responses:
        '200':
          description: Success
          headers:
            Deprecation:
              $ref: '#/components/headers/Deprecation'
            Sunset:
              $ref: '#/components/headers/Sunset'
```

## Related Skills

- `api-design-core` — REST principles and URL structure
- `api-design-openapi` — OpenAPI specification
- `api-design-security` — Authentication and authorization
