---
name: api-design-core
description: Designing RESTful API core principles and URL structure: resources, HTTP methods, status codes, HATEOAS, Richardson Maturity Model. Use this skill when designing the foundational structure of a REST API.
---

# API Design Core

> **Meta:** v1.0.0 | 05-07-2026
> **Parent Skill:** api-design

## Purpose

This subskill covers the core principles of RESTful API design: resource naming, HTTP methods, status codes, and maturity model. It provides the foundation for designing consistent and predictable APIs.

## When to Use

Use this skill:
- When designing the foundational structure of a new REST API
- For defining resources and their naming conventions
- When selecting appropriate HTTP methods and status codes
- For applying Richardson Maturity Model to assess API design quality
- During initial API architecture design

## REST Principles

### Resources

| Concept | Description | Example |
|---------|-------------|---------|
| Resource | Entity accessible via API | `/users`, `/orders`, `/products` |
| Collection | Set of resources | `/users`, `/orders` |
| Instance | Specific resource | `/users/123`, `/orders/456` |
| Sub-resource | Nested resource | `/users/123/orders` |

### Resource Naming

- Use plural nouns: `/users` not `/user`
- Use snake_case for URLs: `/user-profiles` not `/userProfiles`
- Avoid verbs in URLs: use HTTP methods
- Use hierarchy for relationships: `/users/123/orders`

### HTTP Methods

| Method | Semantics | Example |
|--------|-----------|---------|
| **GET** | Retrieve resource | `GET /users` — list, `GET /users/123` — single |
| **POST** | Create resource | `POST /users` — create user |
| **PUT** | Full resource replacement | `PUT /users/123` — replace data |
| **PATCH** | Partial update | `PATCH /users/123` — update part |
| **DELETE** | Remove resource | `DELETE /users/123` — delete user |

## HTTP Status Codes

| Code | Category | Description |
|------|----------|-------------|
| **2xx Success** | Successful operations | |
| 200 | OK | Successful GET/PUT/PATCH |
| 201 | Created | Resource created (POST) |
| 204 | No Content | Successful deletion (DELETE) |
| **3xx Redirection** | Redirection | |
| 304 | Not Modified | Cached data |
| **4xx Client Error** | Client errors | |
| 400 | Bad Request | Invalid syntax |
| 401 | Unauthorized | Authentication required |
| 403 | Forbidden | No access |
| 404 | Not Found | Resource not found |
| 409 | Conflict | Data conflict |
| 422 | Unprocessable Entity | Validation error |
| 429 | Too Many Requests | Rate limit exceeded |
| **5xx Server Error** | Server errors | |
| 500 | Internal Server Error | Internal error |
| 503 | Service Unavailable | Service unavailable |

## HATEOAS

Principle of including links in API responses for navigation:

```json
{
  "id": 123,
  "name": "John Doe",
  "_links": {
    "self": "/users/123",
    "orders": "/users/123/orders",
    "profile": "/profiles/123"
  }
}
```

## Richardson Maturity Model

| Level | Name | Description |
|-------|------|-------------|
| 0 | Swamp of POX | One endpoint, everything in POST |
| 1 | Resources | Division into resources |
| 2 | HTTP Verbs | Use of HTTP methods |
| 3 | Hypermedia Controls | HATEOAS |

## Related Skills

- `api-design-openapi` — OpenAPI 3.0 specifications
- `api-design-security` — Authentication, authorization, rate limiting
- `api-design-operations` — Versioning, pagination, error handling
