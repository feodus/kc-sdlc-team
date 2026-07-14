---
name: rest-api-design-security
description: REST API security: Bearer tokens, API keys, refresh tokens, rate limiting, CORS, and HTTPS enforcement. Use this skill when securing REST API endpoints and implementing access control.
---

# REST API Design — Security

> **Meta:** v1.0.0 | 05-07-2026
> **Parent Skill:** rest-api-design

## Purpose

This subskill covers practical REST API security: Bearer tokens, API keys, refresh tokens, rate limiting, CORS, and HTTPS enforcement. Use it when implementing access control and protection mechanisms for REST endpoints.

## When to Use

Use this skill:
- When configuring authentication for REST APIs
- For implementing Bearer token and API key auth
- When setting up rate limiting headers
- For configuring CORS policies
- During security reviews of REST API designs

## Authentication and Authorization

### Bearer Token

```http
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
```

### API Key

```http
X-API-Key: your-api-key-here
```

### Refresh Token

```typescript
// POST /auth/refresh
// Request
{
  "refreshToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
}

// Response
{
  "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "expiresIn": 3600
}
```

## Rate Limiting

```http
X-RateLimit-Limit: 100
X-RateLimit-Remaining: 95
X-RateLimit-Reset: 1640995200
```

## CORS

```typescript
// Example CORS configuration
app.use(cors({
  origin: ['https://example.com', 'https://admin.example.com'],
  methods: ['GET', 'POST', 'PUT', 'PATCH', 'DELETE'],
  allowedHeaders: ['Content-Type', 'Authorization'],
  credentials: true,
}))
```

## Best Practices

1. **Authentication:**
   - Use OAuth 2.0 or JWT
   - Always apply HTTPS
   - Implement rate limiting

2. **Authorization:**
   - Use scopes/permissions
   - Apply principle of least privilege
   - Validate permissions on each endpoint

3. **Data:**
   - Don't pass sensitive data in URLs
   - Validate all input data
   - Use prepared statements

## Related Skills

- `rest-api-design-core` — REST principles and URL structure
- `rest-api-design-documentation` — OpenAPI examples and response formats
- `api-design` — full API design orchestration
