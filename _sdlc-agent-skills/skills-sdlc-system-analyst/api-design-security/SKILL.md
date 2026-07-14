---
name: api-design-security
description: Designing API authentication and authorization: OAuth 2.0, JWT, API Keys, scopes, rate limiting. Use this skill when securing API endpoints and configuring access control.
---

# API Design — Security

> **Meta:** v1.0.0 | 05-07-2026
> **Parent Skill:** api-design

## Purpose

This subskill focuses on API security configuration: authentication, authorization, rate limiting, and security scheme definitions in OpenAPI. Use it when securing API endpoints and protecting resources.

## When to Use

Use this skill:
- When defining API authentication mechanisms
- For configuring OAuth 2.0, JWT, and API Key security schemes
- When setting up scopes and permissions
- For designing rate limiting and abuse protection
- During security-focused API design reviews

## Security Schemes (OpenAPI)

```yaml
components:
  securitySchemes:
    # OAuth 2.0 with Password Flow
    OAuth2Password:
      type: oauth2
      flows:
        password:
          tokenUrl: /auth/login
          scopes:
            read: Read access
            write: Write access
            admin: Admin access
    
    # OAuth 2.0 with Authorization Code Flow
    OAuth2AuthorizationCode:
      type: oauth2
      flows:
        authorizationCode:
          authorizationUrl: /auth/authorize
          tokenUrl: /auth/token
          scopes:
            read: Read access
            write: Write access
    
    # API Key in header
    ApiKeyHeader:
      type: apiKey
      in: header
      name: X-API-Key
      description: API key for authentication
    
    # API Key in query parameter
    ApiKeyQuery:
      type: apiKey
      in: query
      name: api_key
      description: API key in request parameter
    
    # Bearer Token (JWT)
    BearerAuth:
      type: http
      scheme: bearer
      bearerFormat: JWT
      description: JWT access token

# Security application
security:
  - BearerAuth: []
  - OAuth2Password:
      - read
      - write
  - ApiKeyHeader: []
```

## OAuth 2.0 Flows

| Flow | Usage | Application |
|------|-------|-------------|
| **Authorization Code** | Server-side apps | Web applications with backend |
| **Password** | Trusted apps | Mobile apps (not recommended) |
| **Client Credentials** | Machine-to-machine | Services and daemons |
| **Implicit** | Legacy | Not recommended (use PKCE) |

## JWT Token Example

```json
{
  "header": {
    "alg": "RS256",
    "typ": "JWT"
  },
  "payload": {
    "sub": "1234567890",
    "name": "John Doe",
    "email": "john@example.com",
    "roles": ["user", "admin"],
    "scope": "read write",
    "iat": 1516239022,
    "exp": 1516242622
  }
}
```

## Scopes and Permissions

```yaml
# Scopes definition
components:
  securitySchemes:
    OAuth2Scopes:
      type: oauth2
      flows:
        authorizationCode:
          authorizationUrl: /auth/authorize
          tokenUrl: /auth/token
          scopes:
            # Users
            users:read: Read users
            users:write: Create/update users
            users:delete: Delete users
            # Orders
            orders:read: Read orders
            orders:write: Create orders
            # Admin
            admin:full: Full administrative access
```

## Rate Limiting

```yaml
paths:
  /users:
    get:
      summary: Get user list
      # Rate limiting via headers
      x-rate-limit:
        limit: 1000
        period: 3600  # 1000 requests per hour
      x-rate-limit-tier: premium  # Rate plan tier
      responses:
        '200':
          description: Success
        '429':
          description: Too Many Requests
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/Error'
              example:
                code: "RATE_LIMIT_EXCEEDED"
                message: "Rate limit exceeded. Try again later."
                details:
                  retry_after: 3600
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

- `api-design-core` — REST principles and URL structure
- `api-design-openapi` — OpenAPI specification
- `api-design-operations` — Versioning and pagination
