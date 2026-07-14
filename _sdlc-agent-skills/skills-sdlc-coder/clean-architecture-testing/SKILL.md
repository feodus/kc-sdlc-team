---
name: clean-architecture-testing
description: Testing strategies for Clean Architecture: unit testing domain and use cases, mocking repositories, and test organization. Use this skill when testing Clean Architecture components in isolation.
---

# Clean Architecture — Testing

> **Meta:** v1.0.0 | 05-07-2026
> **Parent Skill:** clean-architecture

## Purpose

This subskill covers testing strategies specific to Clean Architecture: unit testing domain entities and use cases, mocking repositories, and organizing tests to maintain layer isolation. Use it when ensuring correctness of business logic without external dependencies.

## When to Use

Use this skill:
- When writing unit tests for domain entities and value objects
- For testing use cases with mocked repositories
- When organizing tests mirroring the project layer structure
- During CI setup for Clean Architecture projects
- When verifying business rules remain intact during refactoring

## Unit Testing Domain

```typescript
// __tests__/domain/Email.test.ts
import { Email } from '../../domain/value-objects/Email'

describe('Email Value Object', () => {
  it('should create valid email', () => {
    const email = Email.create('test@example.com')
    expect(email.getValue()).toBe('test@example.com')
  })

  it('should throw on invalid email', () => {
    expect(() => Email.create('invalid-email')).toThrow('Invalid email format')
  })
})
```

## Unit Testing Use Cases

```typescript
// __tests__/application/CreateUserUseCase.test.ts
import { CreateUserUseCase } from '../../application/use-cases/CreateUserUseCase'
import { UserRepository } from '../../domain/interfaces/UserRepository'

class MockUserRepository implements UserRepository {
  private users: Map<string, any> = new Map()
  
  async findById(id: string) { return this.users.get(id) || null }
  async findByEmail() { return null }
  async save(user: any) { this.users.set(user.id, user); return user }
  async delete() {}
}

describe('CreateUserUseCase', () => {
  it('should create a user', async () => {
    const repository = new MockUserRepository()
    const useCase = new CreateUserUseCase(repository)
    
    const result = await useCase.execute({
      email: 'test@example.com',
      name: 'Test User',
      password: 'password123',
    })
    
    expect(result.user.email.getValue()).toBe('test@example.com')
  })
})
```

## Test Organization

Mirror the main source structure in tests:

```
src/
  domain/
  application/
  infrastructure/
  presentation/
__tests__/
  domain/
  application/
  infrastructure/
  presentation/
```

## Related Skills

- `clean-architecture-core` — principles and layer structure
- `clean-architecture-patterns` — Repository, Service, Factory, DTO, Mapper
- `python-testing` / `jest` / `pytest` — test framework specifics
