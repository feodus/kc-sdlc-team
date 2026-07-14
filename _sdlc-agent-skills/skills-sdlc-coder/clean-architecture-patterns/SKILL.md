---
name: clean-architecture-patterns
description: Clean Architecture design patterns: Repository, Service Layer, Factory, DTO, Mapper, Dependency Injection container. Use this skill when implementing common patterns in Clean Architecture.
---

# Clean Architecture — Patterns

> **Meta:** v1.0.0 | 05-07-2026
> **Parent Skill:** clean-architecture

## Purpose

This subskill documents common design patterns used in Clean Architecture: Repository, Service Layer, Factory, DTO, Mapper, and Dependency Injection container. Use it when implementing infrastructure and application layer components.

## When to Use

Use this skill:
- When implementing Repository pattern for data access
- For coordinating business logic with Service Layer
- When creating complex objects with Factory pattern
- For transforming data between layers with DTO and Mapper
- When setting up a Dependency Injection container

## Repository Pattern

```typescript
// Data access abstraction
interface Repository<T> {
  findById(id: string): Promise<T | null>
  findAll(): Promise<T[]>
  save(entity: T): Promise<T>
  delete(id: string): Promise<void>
}
```

## Service Layer

```typescript
// Business logic coordinating multiple repositories
class OrderService {
  constructor(
    private orderRepo: OrderRepository,
    private productRepo: ProductRepository,
    private emailService: EmailService
  ) {}
  
  async createOrder(userId: string, items: OrderItem[]): Promise<Order> {
    // Validation
    // Calculate total
    // Create order
    // Send email
  }
}
```

## Factory Pattern

```typescript
// Creating complex objects
class UserFactory {
  static create(data: CreateUserDTO): User {
    const email = Email.create(data.email)
    const passwordHash = Password.createHash(data.password)
    
    return {
      id: crypto.randomUUID(),
      email,
      passwordHash,
      ...data
    }
  }
}
```

## DTO (Data Transfer Object)

```typescript
// For transferring data between layers
interface CreateUserDTO {
  email: string
  name: string
  password: string
}

interface UserResponseDTO {
  id: string
  email: string
  name: string
  createdAt: string
}
```

## Mapper

```typescript
// Transformation between layers
class UserMapper {
  static toDTO(user: User): UserResponseDTO {
    return {
      id: user.id,
      email: user.email.getValue(),
      name: user.name,
      createdAt: user.createdAt.toISOString(),
    }
  }
}
```

## Dependency Injection Container

```typescript
// infrastructure/config/container.ts
import { PrismaClient } from '@prisma/client'
import { UserRepository } from '../../domain/interfaces/UserRepository'
import { PrismaUserRepository } from '../database/PrismaUserRepository'
import { CreateUserUseCase } from '../../application/use-cases/CreateUserUseCase'
import { GetUserUseCase } from '../../application/use-cases/GetUserUseCase'

class Container {
  private static instance: Container
  
  private _prisma?: PrismaClient
  private _userRepository?: UserRepository
  
  private constructor() {}
  
  static getInstance(): Container {
    if (!Container.instance) {
      Container.instance = new Container()
    }
    return Container.instance
  }
  
  get prisma(): PrismaClient {
    if (!this._prisma) {
      this._prisma = new PrismaClient()
    }
    return this._prisma
  }
  
  get userRepository(): UserRepository {
    if (!this._userRepository) {
      this._userRepository = new PrismaUserRepository(this.prisma)
    }
    return this._userRepository
  }
  
  get createUserUseCase(): CreateUserUseCase {
    return new CreateUserUseCase(this.userRepository)
  }
  
  getUserUseCase(): GetUserUseCase {
    return new GetUserUseCase(this.userRepository)
  }
}

export const container = Container.getInstance()
```

## Related Skills

- `clean-architecture-core` — principles and layer structure
- `clean-architecture-testing` — testing strategies
- `dependency-injection` — DI frameworks and patterns
