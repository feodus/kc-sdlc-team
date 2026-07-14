# Skill with Resources Template

Шаблон навыка с дополнительными ресурсами.

```yaml
---
name: my-advanced-skill
description: Продвинутый навык с использованием скриптов, референсов и ассетов
license: MIT
metadata:
  author: "Your Name"
  version: "1.0.0"
allowed-tools: read write execute
---

# My Advanced Skill

## Структура навыка

```
my-advanced-skill/
├── SKILL.md           # Обязательно
├── scripts/          # Опционально
│   └── process.sh   # Исполняемые скрипты
├── references/      # Опционально
│   └── guide.md    # Документация
└── assets/         # Опционально
    └── template.md # Шаблоны
```

## Когда использовать

- [Конкретный триггер 1]
- [Конкретный триггер 2]

## Инструкции

### Основные шаги

1. Проверь необходимые ресурсы
2. Выполни скрипты из `scripts/`
3. Загрузи референсы из `references/`
4. Используй шаблоны из `assets/`

### Использование скриптов

```bash
# Выполнение скрипта
./scripts/process.sh input output
```

### Использование references

```
Для деталей читай: references/guide.md
```

### Использование assets

```
Скопируй шаблон: assets/template.md -> output/
```

## Принципы

1. **Детерминированные задачи в скрипты**
2. **Документация в references**
3. **Шаблоны в assets**

## Progressive Disclosure

- **Метаданные** → Всегда в контексте
- **SKILL.md** → При активации
- **references/** → По требованию
- **scripts/** → Может исполниться без контекста