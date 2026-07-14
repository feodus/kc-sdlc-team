# Workflow Example — Submit PR

Пример workflow для отправки pull request.

## Расположение

```
.kilo/commands/submit-pr.md
```

## Вызов

```
/submit-pr
```

## Содержание

```yaml
---
description: Submit a pull request with full checks
agent: code
model: anthropic/claude-sonnet-4-20250514
subtask: true
---

# Submit PR Workflow

Ты помогаешь отправить pull request. Следуй этим шагам:

## Шаг 1: Проверка кода

1. Используй `grep` для поиска TODO комментариев
2. Используй `grep` для поиска console.log/st debug statements
3. Если найдены — сообщи пользователю

## Шаг 2: Линтинг и форматирование

1. Запусти линтер: `npm run lint` или `flake8`
2. Запусти форматирование: `npm run format` или `black`
3. Если есть ошибки — исправь

## Шаг 3: Тесты

1. Запусти тесты: `npm test` или `pytest`
2. Если тесты падают — сообщи и НЕ продолжай

## Шаг 4: Коммит

1. Проверь `git status`
2. Выбери файлы для коммита
3. Создай коммит с сообщением по Conventional Commits
   - Формат: `type: description`
   - Примеры: `feat: add login`, `fix: resolve bug`

## Шаг 5: Пуш и PR

1. Запушь ветку: `git push -u origin branch-name`
2. Создай PR: `gh pr create`
3. Укажи title и description

## Шаг 6: Финальная проверка

1. Установи label если нужно
2. Назначь reviewers
3. Сообщи пользователю URL PR

## Триггеры

- `/submit-pr` — основной триггер
- Запросы типа "закоммить и отправить PR"

## Параметры (спросить если не предоставлены)

- Branch name (если не текущая ветка)
- Reviewers
- Labels
```