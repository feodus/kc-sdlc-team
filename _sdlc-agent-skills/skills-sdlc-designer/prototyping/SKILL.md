---
name: prototyping
description: Creating interactive prototypes for UX testing. Use to create clickable prototypes and validate with users.
---

# Prototyping

> **Meta:** v1.0.0 | 06-04-2026

## Purpose

Skill for creating interactive prototypes. Includes animated transitions, states, and interactivity for testing.

## When to Use

Use this skill:
- When creating interactive prototypes
- For usability testing
- When demonstrating to stakeholders
- For testing micro-interactions
- When creating design feedback loops
- For presentations

## Prototype Types

### By Fidelity

| Type | Details | Tools |
|-----|---------|-------|
| Paper | Paper, sketch | - |
| Low-fid | Static screens | Figma, Sketch |
| Mid-fid | Basic interactivity | Figma, Principle |
| High-fid | Full animation | Figma, Framer |

### Interactive Prototyping

```
Flow: Login → Dashboard → Settings
```

## Figma Prototyping

### Setup

```markdown
## Prototype Tab

1. Select frames
2. Select Prototype tab
3. Drag from element to frame
4. Configure transition
5. Add trigger
```

### Transitions

| Type | Description |
|------|-------------|
| Instant | No animation |
| Dissolve | Smooth fade |
| Move In | Slide in from direction |
| Push | Screen shift |
| Smart Animate | Automatic matching |

### Interactions

```markdown
## Triggers
- On tap - click
- On hover - hover
- On drag - drag
- Key press - key press
- Delayed - timer

## Actions
- Navigate to - navigate
- Open overlay - modal
- Close overlay - close
- Back - back
- Scroll to - scroll
```

## Micro-interactions

### Button States

```
Default → Hover → Pressed → Disabled
```

### Feedback States

```
Loading → Success → Error
```

### Animation Principles

```
1. Anticipation - preparation for action
2. Staging - focus attention
3. Direct - direct correspondence
4. Continuous - smoothness
5. Timing - correct timing
```

## Animation Spec Example

```markdown
# Button Hover Animation

Property: Scale
From: 1
To: 0.98
Duration: 100ms
Easing: ease-out

# Loading Spinner

Property: Rotation
From: 0deg
To: 360deg
Duration: 1000ms
Easing: linear
Iteration: infinite
```

## Advanced Prototypes

### Variable Interactions

```javascript
// Figma Variables for prototyping
let isLoggedIn = false
let userRole = "admin"

// Conditional logic
if isLoggedIn {
  navigate to("Dashboard")
} else {
  navigate to("Login")
}
```

### Component States

```
Component: Button
States: default, hover, pressed, disabled
Variants: primary, secondary, ghost
```

## Testing with Prototype

### Usability Test

```
1. Show prototype
2. Give task
3. Observe interactions
4. Ask questions
5. Record feedback
```

## Quality Criteria

- [ ] Interactions work smoothly
- [ ] Transitions are natural
- [ ] All states considered
- [ ] Feedback is clear
- [ ] Testing conducted
- [ ] Loops documented