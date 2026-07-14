---
name: data-modeling-erd
description: Designing Entity-Relationship Diagrams (ERD): entities, attributes, relationships, cardinality, and Mermaid erDiagram syntax. Use this skill when visualizing data structure and relationships.
---

# Data Modeling — ERD

> **Meta:** v1.0.0 | 05-07-2026
> **Parent Skill:** data-modeling

## Purpose

This subskill focuses on creating Entity-Relationship Diagrams (ERD) and understanding entity-relationship concepts. Use it when visualizing data structures, defining entities and attributes, and specifying relationship cardinality.

## When to Use

Use this skill:
- When designing the visual structure of a database
- For defining entities, attributes, and primary/foreign keys
- When specifying relationship cardinality (1:1, 1:N, M:N)
- For generating Mermaid `erDiagram` code
- During data model reviews with stakeholders

## Entities and Attributes

| Component | Description | Example |
|-----------|----------|--------|
| Entity | Real-world object | USER, ORDER, PRODUCT |
| Attribute | Entity characteristic | name, email, price |
| Primary Key (PK) | Unique identifier | id |
| Foreign Key (FK) | Reference to another entity | user_id |
| Unique Key (UK) | Unique value | email |

### Attribute Types

- **Simple** — atomic, indivisible values
- **Composite** — combination of simple attributes (address = city + street + house)
- **Single-valued** — one value for entity
- **Multi-valued** — multiple values (product tags)
- **Derived** — calculated values (age = current_date - birth_date)

## Relationship Types

| Relationship Type | Description | Notation |
|-----------|----------|-------------|
| **One-to-One (1:1)** | One record linked to one record | `||--||` |
| **One-to-Many (1:N)** | One record linked to many | `||--o{` |
| **Many-to-Many (M:N)** | Many records linked to many | `}o--o{` |

### Cardinality

- **Mandatory** — relationship must exist (`||`)
- **Optional** — relationship may not exist (`o`)

## Usage Example

```mermaid
erDiagram
    USER ||--o{ ORDER : places
    USER {
        int id PK
        string email UK
        string password_hash
        string first_name
        string last_name
        string phone
        datetime created_at
        datetime updated_at
    }
    
    ORDER ||--|{ ORDER_ITEM : contains
    ORDER ||--|| ADDRESS : ships_to
    ORDER {
        int id PK
        int user_id FK
        int address_id FK
        string order_number UK
        datetime order_date
        string status
        decimal total_amount
        string payment_method
    }
    
    ORDER_ITEM }|--|| PRODUCT : includes
    ORDER_ITEM {
        int id PK
        int order_id FK
        int product_id FK
        int quantity
        decimal unit_price
        decimal discount
        decimal line_total
    }
    
    PRODUCT ||--o{ PRODUCT_CATEGORY : belongs_to
    PRODUCT {
        int id PK
        string sku UK
        string name
        string description
        decimal price
        int stock_quantity
        bool is_active
        datetime created_at
    }
    
    PRODUCT_CATEGORY ||--|{ PRODUCT_CATEGORY : parent
    PRODUCT_CATEGORY {
        int id PK
        string name
        int parent_id FK
    }
    
    ADDRESS {
        int id PK
        int user_id FK
        string street
        string city
        string state
        string postal_code
        string country
    }
```

## Naming Conventions

1. Use singular nouns (User, Order, Product)
2. Table names: snake_case (user_roles)
3. Column names: snake_case (created_at)
4. Always name PK as `id`

## Related Skills

- `data-modeling-normalization` — 1NF-3NF and denormalization
- `data-modeling-indexing` — index types and strategy
- `sql-development` — writing SQL queries
