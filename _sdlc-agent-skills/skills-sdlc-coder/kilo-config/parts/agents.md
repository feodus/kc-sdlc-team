# Custom Agents — Полное руководство

## Когда использовать

- Создание нового кастомного агента для KiloCode
- Обновление существующей конфигурации агента
- Настройка разрешений и доступа к инструментам
- Миграция со старого формата `.kilocodemodes`

---

## Формат файлов

### Расположение агентов

| Область | Путь |
|---------|------|
| Проект | `.kilo/agent/*.md` |
| Глобально | `~/.config/kilo/agent/*.md` |

### Структура файла

```yaml
---
description: Описание агента
mode: primary
color: "#FF5733"
skills:
  - skill-name
permission:
  edit:
    "*.py": allow
    "*": deny
---

# System Prompt

Ты эксперт в...
```

---

## Поля Frontmatter

### Обязательные поля

| Поле | Тип | Описание |
|------|-----|----------|
| `description` | string | Когда использовать агента |
| `mode` | string | `primary`, `subagent`, или `all` |

### Опциональные поля

| Поле | Тип | Описание |
|------|-----|----------|
| `color` | string | Hex цвет для UI |
| `skills` | array | Список навыков |
| `model` | string | Модель в формате `provider/model` |
| `temperature` | number | Температура (0-1) |
| `top_p` | number | Альтернатива temperature |
| `steps` | number | Макс. итераций агента |
| `hidden` | boolean | Скрыть из UI |
| `disable` | boolean | Отключить агента |

---

## Система разрешений

### Типы инструментов

| Инструмент | Описание |
|------------|----------|
| `bash` | Выполнение команд |
| `edit` | Редактирование файлов |
| `read` | Чтение файлов |
| `glob` | Поиск файлов по паттерну |
| `grep` | Поиск по содержимому |
| `write` | Запись файлов |
| `task` | Вызов подзадач |
| `webfetch` | Получение веб-страниц |
| `websearch` | Веб-поиск |
| `codesearch` | Поиск кода |
| `glob` | Поиск файлов |

### Значения разрешений

- `allow` — Разрешить без подтверждения
- `deny` — Запретить
- `ask` — Запросить подтверждение

### Glob-паттерны для файлов

```yaml
permission:
  edit:
    "src/**": allow        # Разрешить src директорию
    "*.{py,js,ts}": allow # Разрешить конкретные расширения
    "tests/**": allow     # Разрешить тесты
    "*": deny            # Запретить остальное
  bash:
    "git *": allow       # Разрешить git команды
    "npm *": allow       # Разрешить npm команды
    "*": deny            # Запретить остальное
```

### Примеры конфигурации разрешений

#### Полный доступ

```yaml
permission:
  bash: allow
  edit: allow
  read: allow
  glob: allow
  grep: allow
  write: allow
  task: allow
  webfetch: allow
  websearch: allow
  codesearch: allow
```

#### Только чтение

```yaml
permission:
  read: allow
  glob: allow
  grep: allow
  webfetch: allow
  websearch: allow
  codesearch: allow
  edit: deny
  write: deny
  bash: deny
  task: deny
```

#### Ограниченный доступ

```yaml
permission:
  edit:
    "*.py": allow
    "src/**": allow
  read:
    "*": allow
  glob:
    "*": allow
  grep:
    "*": allow
  bash: deny
  task: deny
  webfetch: allow
  websearch: allow
  codesearch: allow
```

---

## Режимы агентов

| Режим | Описание | Где виден |
|-------|----------|----------|
| `primary` | Пользовательский агент | Список выбора агентов |
| `subagent` | Подзадача | Только через task/@ |
| `all` | Оба режима | Везде |

---

## Приоритет конфигурации

От низкого к высокому приоритету:

1. **Встроенные агенты** (native)
2. **Глобальная конфигурация** (`~/.config/kilo/kilo.jsonc`)
3. **Проектная конфигурация** (`kilo.jsonc`)
4. **Файлы агентов** (`.kilo/agent/*.md`)
5. **Переменные окружения** (`KILO_CONFIG_CONTENT`)

При совпадении имён — свойства мерджатся, а не заменяются.

---

## Миграция со старого формата

### Старый формат (deprecated)

```yaml
customModes:
  - slug: my-agent
    name: My Agent
    roleDefinition: "Ты эксперт..."
    groups:
      - read
      - edit
```

### Новый формат

```yaml
---
description: Мой агент для Python разработки
mode: primary
permission:
  read: allow
  edit:
    "*.py": allow
  write: allow
---

Ты эксперт Python разработки.
```

---

## Переопределение встроенных агентов

Можно переопределить встроенные агенты (`code`, `plan`, `debug`, `ask`, `orchestrator`, `explore`, `general`):

```yaml
---
# Переопределение built-in агента "code"
model: openai/gpt-4o
temperature: 0.2
permission:
  edit:
    "*.py": allow
    "*": deny
---

Ты Python специалист. Редактируй только Python файлы.
```

---

## Примеры агентов

### Python Developer

```yaml
---
description: Python разработчик с экспертизой в FastAPI, Django и PostgreSQL
mode: primary
color: "#3776AB"
skills:
  - python-project-setup
  - fastapi-development
  - postgresql-development
permission:
  bash: allow
  edit:
    "*.py": allow
    "src/**": allow
  read:
    "*": allow
  glob:
    "*": allow
  grep:
    "*": allow
  task: allow
  webfetch: allow
  websearch: allow
  codesearch: allow
---

Ты эксперт Python разработки, специализирующийся на FastAPI, Django и PostgreSQL.
```

### Code Reviewer

```yaml
---
description: Агент для code review - проверяет код на качество, безопасность и производительность
mode: primary
color: "#10B981"
permission:
  read: allow
  glob: allow
  grep: allow
  webfetch: allow
  edit: deny
  write: deny
  bash: deny
---

Ты code reviewer. Анализируй код на:
- Качество и лучшие практики
- Потенциальные баги
- Проблемы производительности
- Безопасность
```

### Docs Writer

```yaml
---
description: Создание и редактирование технической документации
mode: primary
color: "#F59E0B"
permission:
  edit:
    "*.md": allow
    "docs/**": allow
  read:
    "*": allow
  glob:
    "*": allow
  bash: deny
---

Ты технический писатель. Создавай чёткую документацию.
```

### Security Auditor

```yaml
---
description: Аудит безопасности - поиск уязвимостей и проблем безопасности
mode: subagent
color: "#EF4444"
permission:
  read: allow
  glob: allow
  grep: allow
  edit: deny
  bash:
    "git log*": allow
    "grep *": allow
---

Ты эксперт безопасности. Ищи:
- Уязвимости ввода
- Проблемы аутентификации
- Риски утечки данных
- Уязвимости зависимостей
```

---

## CLI команды

### Создание агента через CLI

```bash
kilo agent create
```

Интерактивно создаёт агента:
1. Выбор места сохранения (global/project)
2. Описание агента
3. Генерация промпта AI
4. Выбор инструментов
5. Выбор режима

###Non-interactive

```bash
kilo agent create \
  --path .kilo \
  --description "Reviews code for security" \
  --mode subagent \
  --tools "read,grep,glob"
```

### Список агентов

```bash
kilo agent list
```

---

## Troubleshooting

| Проблема | Причина | Решение |
|----------|---------|--------|
| Агент не появляется | Не перезагружена сессия | Перезагрузи VS Code |
| Разрешение отклонено | Неверный glob паттерн | Проверь синтаксис |
| Skills не работают | Неверный путь | Проверь kilo.jsonc |
| Агент игнорирует промпт | Неправильный формат | Проверь frontmatter |

---

## Ресурсы

- [Официальная документация](https://kilo.ai/docs/customize/custom-modes)
- [Custom Subagents](https://kilo.ai/docs/customize/custom-subagents)