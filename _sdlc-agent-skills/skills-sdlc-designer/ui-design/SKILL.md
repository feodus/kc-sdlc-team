---
name: ui-design
description: Visual user interface design, working with color, typography, spacing. Use to create visually appealing UI.
---

# UI Design

> **Meta:** v1.0.0 | 06-04-2026

## Purpose

Skill for creating visual interface design. Includes working with color, typography, spacing, visual hierarchy, and visual consistency.

## When to Use

Use this skill:
- When creating visual design
- For working with typography
- When setting up color system
- For creating component library
- When prototyping
- For ensuring visual consistency

## Color System

### Color Palette

```css
:root {
  /* Primary */
  --primary-50: #EEF2FF;
  --primary-100: #E0E7FF;
  --primary-500: #6366F1;
  --primary-600: #4F46E5;
  --primary-700: #4338CA;
  
  /* Neutral */
  --neutral-50: #FAFAFA;
  --neutral-100: #F4F4F5;
  --neutral-200: #E4E4E7;
  --neutral-500: #71717A;
  --neutral-900: #18181B;
  
  /* Semantic */
  --success: #22C55E;
  --warning: #F59E0B;
  --error: #EF4444;
  --info: #3B82F6;
  
  /* Background */
  --bg-primary: #FFFFFF;
  --bg-secondary: #F9FAFB;
  --bg-dark: #18181B;
}
```

### Usage

| Token | Usage |
|-------|--------|
| primary-500 | Primary actions, links |
| neutral-900 | Primary text |
| neutral-500 | Secondary text |
| neutral-100 | Backgrounds, borders |
| error | Error states |
| success | Success states |

## Typography

### Type Scale

```css
:root {
  /* Font family */
  --font-sans: 'Inter', system-ui, sans-serif;
  --font-mono: 'JetBrains Mono', monospace;
  
  /* Scale */
  --text-xs: 0.75rem;    /* 12px */
  --text-sm: 0.875rem;   /* 14px */
  --text-base: 1rem;      /* 16px */
  --text-lg: 1.125rem;   /* 18px */
  --text-xl: 1.25rem;    /* 20px */
  --text-2xl: 1.5rem;    /* 24px */
  --text-3xl: 1.875rem;  /* 30px */
  --text-4xl: 2.25rem;   /* 36px */
  
  /* Line heights */
  --leading-tight: 1.25;
  --leading-normal: 1.5;
  --leading-relaxed: 1.625;
  
  /* Font weights */
  --font-normal: 400;
  --font-medium: 500;
  --font-semibold: 600;
  --font-bold: 700;
}
```

### Typography Patterns

```markdown
# Heading 1
- Size: 2.25rem (36px)
- Weight: 700
- Line height: 1.2

# Heading 2
- Size: 1.5rem (24px)
- Weight: 600
- Line height: 1.3

# Body
- Size: 1rem (16px)
- Weight: 400
- Line height: 1.5

# Caption
- Size: 0.875rem (14px)
- Weight: 400
- Line height: 1.5
```

## Spacing System

### Spacing Scale

```css
:root {
  --space-1: 0.25rem;   /* 4px */
  --space-2: 0.5rem;    /* 8px */
  --space-3: 0.75rem;    /* 12px */
  --space-4: 1rem;      /* 16px */
  --space-5: 1.25rem;   /* 20px */
  --space-6: 1.5rem;      /* 24px */
  --space-8: 2rem;       /* 32px */
  --space-10: 2.5rem;    /* 40px */
  --space-12: 3rem;      /* 48px */
  --space-16: 4rem;     /* 64px */
}
```

### Spacing Usage

```css
/* Padding */
.p-4 { padding: var(--space-4); }
.px-4 { padding-left: var(--space-4); padding-right: var(--space-4); }
.py-4 { padding-top: var(--space-4); padding-bottom: var(--space-4); }

/* Gap */
.gap-2 { gap: var(--space-2); }
.gap-4 { gap: var(--space-4); }

/* Margins */
.mt-4 { margin-top: var(--space-4); }
.mb-4 { margin-bottom: var(--space-4); }
```

## Components

### Buttons

```css
.btn {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  padding: var(--space-2) var(--space-4);
  border-radius: var(--radius-md);
  font-weight: var(--font-medium);
  transition: all 150ms ease;
}

.btn-primary {
  background: var(--primary-600);
  color: white;
}

.btn-primary:hover {
  background: var(--primary-700);
}

.btn-secondary {
  background: var(--neutral-100);
  color: var(--neutral-900);
}

.btn-ghost {
  background: transparent;
  color: var(--neutral-500);
}
```

### Input Fields

```css
.input {
  width: 100%;
  padding: var(--space-2) var(--space-3);
  border: 1px solid var(--neutral-200);
  border-radius: var(--radius-md);
  font-size: var(--text-base);
  transition: border-color 150ms ease;
}

.input:focus {
  outline: none;
  border-color: var(--primary-500);
  box-shadow: 0 0 0 3px var(--primary-100);
}
```

### Cards

```css
.card {
  background: var(--bg-primary);
  border-radius: var(--radius-lg);
  box-shadow: var(--shadow-sm);
  padding: var(--space-6);
}

.card-interactive:hover {
  box-shadow: var(--shadow-md);
  transform: translateY(-1px);
}
```

## Visual Hierarchy

```
1. Size - biggest draws attention
2. Color - contrast stands out
3. Position - top-left is dominant
4. Spacing - isolated elements draw attention
5. Typography - weight and size create hierarchy
```

## Responsive Design

### Breakpoints

```css
/* Mobile first */
--breakpoint-sm: 640px;
--breakpoint-md: 768px;
--breakpoint-lg: 1024px;
--breakpoint-xl: 1280px;
```

## Quality Criteria

- [ ] Color system consistent
- [ ] Typography scalable
- [ ] Spacing follows system
- [ ] Components reusable
- [ ] Responsive works
- [ ] Accessibility considered