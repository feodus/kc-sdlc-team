# Minimal Agent Template

Используй этот шаблон для создания базового агента.

```yaml
---
description: Краткое описание агента
mode: primary
permission:
  bash: allow
  edit:
    "*": allow
  read:
    "*": allow
---

# Agent Name

Твой system prompt здесь.
```

### Параметры

| Поле | Обязательно | Описание |
|------|-------------|----------|
| description | Да | Когда использовать агента |
| mode | Да | primary / subagent / all |
| permission | Нет | Разрешения инструментов |