---
name: api-design-openapi
description: Designing OpenAPI 3.0 specifications: paths, schemas, parameters, responses, components. Use this skill when creating or documenting API contracts with OpenAPI/Swagger.
---

# API Design — OpenAPI Specification

> **Meta:** v1.0.0 | 05-07-2026
> **Parent Skill:** api-design

## Purpose

This subskill focuses on creating OpenAPI 3.0 specifications: defining paths, operations, request/response schemas, parameters, and reusable components. Use it when you need to produce machine-readable API contracts.

## When to Use

Use this skill:
- When creating OpenAPI 3.0 specifications
- For documenting API paths, operations, and components
- When defining request/response schemas and examples
- For configuring servers, tags, and security schemes
- During API documentation or contract-first design

## OpenAPI Document Structure

```yaml
openapi: 3.0.0
info:
  title: API Name
  version: 1.0.0
  description: API Description
  contact:
    name: API Support
    email: support@example.com
servers:
  - url: https://api.example.com/v1
    description: Production server
  - url: https://staging.example.com/v1
    description: Staging server
paths:
  /resource:
    get:
      summary: Get resources
      operationId: getResources
      tags:
        - Resources
      parameters:
        - $ref: '#/components/parameters/Page'
        - $ref: '#/components/parameters/Limit'
      responses:
        '200':
          $ref: '#/components/responses/ResourceList'
components:
  schemas:
    Resource:
      $ref: '#/components/schemas/Resource'
  parameters:
    Page:
      $ref: '#/components/parameters/Page'
  responses:
    ResourceList:
      $ref: '#/components/responses/ResourceList'
```

## Paths and Operations

```yaml
paths:
  /users:
    get:
      summary: Get user list
      description: Returns list of all users with pagination support
      operationId: getUsers
      tags:
        - Users
      parameters:
        - name: page
          in: query
          description: Page number
          schema:
            type: integer
            default: 1
            minimum: 1
        - name: limit
          in: query
          description: Number of items per page
          schema:
            type: integer
            default: 20
            maximum: 100
        - name: sort
          in: query
          description: Field to sort by
          schema:
            type: string
            enum: [name, created_at, email]
        - name: order
          in: query
          description: Sort direction
          schema:
            type: string
            enum: [asc, desc]
            default: asc
        - name: status
          in: query
          description: Status filter
          schema:
            type: string
            enum: [active, inactive, suspended]
      responses:
        '200':
          description: Successful response
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/UserList'
        '400':
          $ref: '#/components/responses/BadRequest'
        '401':
          $ref: '#/components/responses/Unauthorized'
        '500':
          $ref: '#/components/responses/InternalServerError'
    
    post:
      summary: Create user
      operationId: createUser
      tags:
        - Users
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/UserCreate'
      responses:
        '201':
          description: User created
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/User'
        '400':
          $ref: '#/components/responses/BadRequest'
        '422':
          $ref: '#/components/responses/ValidationError'

  /users/{userId}:
    get:
      summary: Get user by ID
      operationId: getUserById
      tags:
        - Users
      parameters:
        - name: userId
          in: path
          required: true
          description: User ID
          schema:
            type: integer
            format: int64
      responses:
        '200':
          description: Successful response
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/User'
        '404':
          $ref: '#/components/responses/NotFound'
```

## Schemas (Data Models)

```yaml
components:
  schemas:
    User:
      type: object
      description: System user
      required:
        - id
        - email
        - created_at
      properties:
        id:
          type: integer
          format: int64
          description: Unique identifier
        email:
          type: string
          format: email
          description: User email
        name:
          type: string
          description: User name
        status:
          type: string
          enum: [active, inactive, suspended]
          default: active
        created_at:
          type: string
          format: date-time
          description: Creation date
        updated_at:
          type: string
          format: date-time
          description: Update date
```

## Reusable Components

```yaml
components:
  parameters:
    Page:
      name: page
      in: query
      description: Page number
      schema:
        type: integer
        default: 1
        minimum: 1
    
    Limit:
      name: limit
      in: query
      description: Number of items
      schema:
        type: integer
        default: 20
        maximum: 100

  responses:
    BadRequest:
      description: Invalid request
      content:
        application/json:
          schema:
            $ref: '#/components/schemas/Error'
          example:
            code: "BAD_REQUEST"
            message: "Invalid request parameters"
            trace_id: "req-abc123"
    
    Unauthorized:
      description: Authentication required
      content:
        application/json:
          schema:
            $ref: '#/components/schemas/Error'
          example:
            code: "UNAUTHORIZED"
            message: "Authentication required"
    
    NotFound:
      description: Resource not found
      content:
        application/json:
          schema:
            $ref: '#/components/schemas/Error'
          example:
            code: "NOT_FOUND"
            message: "User with id 123 not found"
```

## Related Skills

- `api-design-core` — REST principles and URL structure
- `api-design-security` — Security schemes
- `api-design-operations` — Pagination and versioning
