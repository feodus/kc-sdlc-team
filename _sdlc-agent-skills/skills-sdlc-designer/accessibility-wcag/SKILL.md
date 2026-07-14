---
name: accessibility-wcag
description: Ensuring accessibility according to WCAG, testing with assistive technologies. Use to create accessible interfaces.
---

# Accessibility (WCAG)

> **Meta:** v1.0.0 | 06-04-2026

## Purpose

Skill for ensuring interface accessibility according to WCAG. Includes accessibility principles, testing, and implementation.

## When to Use

Use this skill:
- When ensuring accessibility
- For testing with screen readers
- For WCAG 2.1/2.2 compliance
- For creating accessible components
- When training the team
- For accessibility audit

## WCAG Principles

### 4 Principles (POUR)

| Principle | Description |
|-----------|-------------|
| Perceivable | Information is presented |
| Operable | UI components work |
| Understandable | Interface is understandable |
| Robust | Compatible with assistive tech |

### Levels

| Level | Description |
|-------|-------------|
| A | Minimum |
| AA | Most requirements (target) |
| AAA | Highest level |

## Perceivable

### 1.1 Text Alternatives

```html
<!-- Don't do -->
<img src="chart.png">

<!-- Do -->
<img src="chart.png" alt="Sales increased by 20% in Q4">
```

### 1.3 Adaptable

```html
<!-- Use semantic markup -->
<header role="banner">
<nav role="navigation">
<main role="main">
```

### 1.4 Distinguishable

```css
/* Contrast ratios */
:root {
  --contrast-sm: 4.5;  /* Normal text */
  --contrast-lg: 3.0;   /* Large text */
}
```

## Operable

### 2.1 Keyboard Accessible

```html
<!-- Don't do -->
<div onclick="openMenu()">Menu</div>

<!-- Do -->
<button onclick="openMenu()">Menu</button>
```

### 2.4 Navigable

```html
<!-- Skip link -->
<a href="#main" class="skip-link">Skip to content</a>

<!-- Headings in order -->
<h1>Title</h1>
<h2>Section</h2>
```

## Understandable

### 3.1 Readable

```html
<!-- lang attribute -->
<html lang="en">
```

### 3.2 Predictable

```html
<!-- Consistent navigation -->
<nav>
  <a href="/">Home</a>
  <a href="/about">About</a>
</nav>
```

### 3.3 Input Assistance

```html
<!-- Labels -->
<label for="email">Email</label>
<input id="email" type="email">
```

## Robust

### 4.1 Compatible

```html
<!-- Valid HTML -->
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
```

### ARIA

```html
<!-- Button with ARIA -->
<button 
  role="button" 
  aria-expanded="false" 
  aria-controls="menu"
  aria-label="Open menu"
>
```

## Testing

### Automated Testing

```bash
# axe CLI
axe https://example.com

# WAVE
https://wave.webaim.org/
```

### Manual Checklist

```markdown
## Keyboard Navigation
- [ ] All interactive elements reachable
- [ ] Focus visible
- [ ] Tab order logical

## Screen Reader
- [ ] All content announced
- [ ] Labels read correctly

## Visual
- [ ] Color contrast sufficient
- [ ] Text resizable to 200%
```

## Common Issues

| Issue | Fix |
|-------|-----|
| Missing alt text | Add alt to all images |
| Low contrast | Increase contrast ratio |
| No keyboard access | Use semantic HTML |
| Missing labels | Add label elements |

## Quality Criteria

- [ ] WCAG AA compliant
- [ ] Automated tests pass
- [ ] Keyboard testing passed
- [ ] Screen reader testing passed
- [ ] Documentation included