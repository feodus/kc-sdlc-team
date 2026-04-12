---
name: design-systems
description: Creating and managing design systems, component library, tokens. Use to create scalable design systems.
---

# Design Systems

> **Meta:** v1.0.0 | 06-04-2026

## Purpose

Skill for creating and managing design systems. Includes design tokens, component library, documentation, and governance.

## When to Use

Use this skill:
- When creating design system from scratch
- For scaling design
- When creating component library
- For design documentation
- When onboarding new designers
- For ensuring consistency

## Design System Structure

```
design-system/
├── foundations/
│   ├── colors/
│   ├── typography/
│   ├── spacing/
│   └── icons/
├── components/
│   ├── button/
│   ├── input/
│   └── card/
├── patterns/
│   ├── forms/
│   ├── navigation/
│   └── layout/
└── documentation/
```

## Design Tokens

### Colors

```json
{
  "color": {
    "primary": {
      "50": { "value": "#EEF2FF" },
      "100": { "value": "#E0E7FF" },
      "500": { "value": "#6366F1" },
      "600": { "value": "#4F46E5" },
      "700": { "value": "#4338CA" }
    },
    "neutral": {
      "50": { "value": "#FAFAFA" },
      "500": { "value": "#71717A" },
      "900": { "value": "#18181B" }
    }
  }
}
```

### Typography

```json
{
  "font": {
    "family": { "value": "Inter" },
    "weight": {
      "normal": { "value": "400" },
      "medium": { "value": "500" },
      "bold": { "value": "700" }
    }
  },
  "fontSize": {
    "xs": { "value": "0.75rem" },
    "sm": { "value": "0.875rem" },
    "base": { "value": "1rem" },
    "lg": { "value": "1.125rem" },
    "xl": { "value": "1.25rem" }
  }
}
```

### Spacing

```json
{
  "spacing": {
    "0": { "value": "0" },
    "1": { "value": "0.25rem" },
    "2": { "value": "0.5rem" },
    "4": { "value": "1rem" },
    "6": { "value": "1.5rem" },
    "8": { "value": "2rem" }
  }
}
```

## Component Library

### Button Component

```yaml
# Button Component Spec

## Variants
- primary: filled brand color
- secondary: outlined
- ghost: text only
- danger: error color

## Sizes
- sm: height 32px
- md: height 40px
- lg: height 48px

## States
- default
- hover
- focus
- active
- disabled
- loading

## Properties
- leftIcon: optional
- rightIcon: optional
- isLoading: boolean
```

### Input Component

```yaml
# Input Component Spec

## Variants
- default
- error
- success
- disabled

## Types
- text
- password
- email
- number

## Properties
- label: required
- placeholder: optional
- errorMessage: optional
- helperText: optional
```

## Component Checklist

```markdown
## For each component

- [ ] States defined
- [ ] Variants defined
- [ ] Sizes defined
- [ ] Accessibility included
- [ ] Responsive behavior
- [ ] Documentation written
- [ ] Examples provided
- [ ] Do's and Don'ts
```

## Documentation

### Component Page

```markdown
# Button

## Usage
Use for primary actions in forms, dialogs, etc.

## Variations
- Primary: Main actions
- Secondary: Alternative actions
- Ghost: Tertiary actions

## Code
\`\`\`jsx
<Button variant="primary">
  Click me
</Button>
\`\`\`

## Do's
- Use for actions that lead to completion
- Keep text short

## Don'ts
- Don't use for navigation
- Don't use more than one primary button per section
```

## Governance

### Design Review

```
1. New components go through review
2. Documentation required
3. Accessibility checks complete
4. Version control enabled
5. Breaking changes tracked
```

## Tools

| Purpose | Tools |
|---------|-------|
| Tokens | Style Dictionary, Figma Tokens |
| Components | Figma, Storybook |
| Documentation | Storybook, Docusaurus |
| Distribution | npm, Figma Community |

## Quality Criteria

- [ ] Tokens documented
- [ ] Components created
- [ ] Documentation complete
- [ ] Versioning configured
- [ ] Breaking changes tracked
- [ ] Accessibility included
- [ ] Components maintenance
- [ ] Usage analytics