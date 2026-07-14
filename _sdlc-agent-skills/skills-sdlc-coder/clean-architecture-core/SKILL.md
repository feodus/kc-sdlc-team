---
name: clean-architecture-core
description: Clean Architecture core principles and layer structure: dependency rule, domain/application/infrastructure/presentation layers, and layer boundaries. Use this skill when designing application architecture following Clean Architecture.
---

# Clean Architecture — Core

> **Meta:** v1.0.0 | 05-07-2026
> **Parent Skill:** clean-architecture

## Purpose

This subskill covers the foundational principles of Clean Architecture: the dependency rule, layer organization (domain, application, infrastructure, presentation), and boundary definitions. Use it when establishing the core architecture of a new project or service.

## When to Use

Use this skill:
- When designing the high-level architecture of a new application
- For defining layer boundaries and responsibilities
- When enforcing the dependency rule (inner layers must not depend on outer layers)
- During architecture reviews and onboarding
- When setting up new project scaffolding with Clean Architecture

## Principles

```
src/
├── domain/           # Entities and business rules (innermost layer)
│   ├── entities/     # Business objects
│   ├── value-objects/
│   └── interfaces/  # Abstract repositories
│
├── application/      # Use Cases - apply business rules
│   ├── use-cases/
│   ├── dto/
│   ├── interfaces/  # Service interfaces
│   └── exceptions/
│
├── infrastructure/   # External dependencies
│   ├── database/    # ORM, migrations
│   ├── external/    # API clients
│   ├── services/   # External services implementations
│   └── config/
│
├── presentation/    # UI/API layer
│   ├── controllers/
│   ├── routes/
│   ├── middleware/
│   └── dto/         # Request/Response objects
│
└── shared/         # Shared utilities
    ├── types/
    ├── utils/
    └── constants/
```

## Domain Layer

```typescript
// domain/entities/User.ts
export interface User {
  id: string
  email: Email
  name: string
  createdAt: Date
  updatedAt: Date
}

// domain/value-objects/Email.ts
export class Email {
  private readonly value: string
  
  private constructor(value: string) {
    this.value = value
  }
  
  static create(value: string): Email {
    if (!Email.isValid(value)) {
      throw new Error('Invalid email format')
    }
    return new Email(value.toLowerCase())
  }
  
  static isValid(value: string): boolean {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
    return emailRegex.test(value)
  }
  
  getValue(): string {
    return this.value
  }
}

// domain/interfaces/UserRepository.ts
export interface UserRepository {
  findById(id: string): Promise<User | null>
  findByEmail(email: Email): Promise<User | null>
  save(user: User): Promise<User>
  delete(id: string): Promise<void>
}
```

## Application Layer

```typescript
// application/use-cases/CreateUserUseCase.ts
import { UserRepository } from '../../domain/interfaces/UserRepository'
import { User } from '../../domain/entities/User'
import { Email } from '../../domain/value-objects/Email'

export interface CreateUserInput {
  email: string
  name: string
  password: string
}

export interface CreateUserOutput {
  user: User
}

export class CreateUserUseCase {
  constructor(private readonly userRepository: UserRepository) {}
  
  async execute(input: CreateUserInput): Promise<CreateUserOutput> {
    // 1. Validation
    const email = Email.create(input.email)
    
    // 2. Check existing user
    const existingUser = await this.userRepository.findByEmail(email)
    if (existingUser) {
      throw new Error('User already exists')
    }
    
    // 3. Create entity
    const user: User = {
      id: crypto.randomUUID(),
      email,
      name: input.name,
      createdAt: new Date(),
      updatedAt: new Date(),
    }
    
    // 4. Save
    const savedUser = await this.userRepository.save(user)
    
    return { user: savedUser }
  }
}
```

## Dependency Rule

```
┌─────────────────────────────────────────────┐
│           Presentation Layer               │
│  (Controllers, Routes, Middleware)         │
└─────────────────────┬───────────────────────┘
                       │ depends on
                       ▼
┌─────────────────────────────────────────────┐
│           Application Layer                 │
│     (Use Cases, DTO, Interfaces)            │
└─────────────────────┬───────────────────────┘
                       │ depends on
                       ▼
┌─────────────────────────────────────────────┐
│              Domain Layer                    │
│  (Entities, Value Objects, Interfaces)       │
└─────────────────────────────────────────────┘
                       ▲
                       │ does not depend
┌─────────────────────┴───────────────────────┐
│          Infrastructure Layer               │
│ (DB, External APIs, Implementations)         │
└─────────────────────────────────────────────┘
```

## Related Skills

- `clean-architecture-patterns` — Repository, Service, Factory, DTO, Mapper
- `clean-architecture-testing` — unit tests, mocks, test organization
- `dependency-injection` — (if available) DI container patterns
