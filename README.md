# kc-sdlc-team — KiloCode SDLC Agent Template

> **Last Updated:** 15-07-2026 02:12:00 UTC+3 | Branch: main | Commit: 8d79769 | Version: 1.36.0

> Универсальный шаблон KiloCode-проекта для полного цикла разработки программного обеспечения (SDLC).

---

## Описание

Этот репозиторий содержит комплексную экосистему специализированных AI-агентов для KiloCode, обеспечивающих полный цикл разработки: от анализа требований до тестирования, развёртывания и маркетинга.

### Экосистема включает 10 агентов

| Агент | Назначение | Навыков |
|-------|------------|---------|
| **sdlc-system-analyst** | Системный анализ, требования, API design | 21 |
| **sdlc-project-manager** | Управление проектами, координация | 22 |
| **sdlc-coder** | Разработка, DevOps | 27 |
| **sdlc-tester** | Тестирование, QA | 18 |
| **sdlc-marketer** | Маркетинг, продвижение | 21 |
| **sdlc-business** | Бизнес-аналитика | 20 |
| **sdlc-devops** | CI/CD, инфраструктура | 8 |
| **sdlc-security** | Безопасность, аудит | 7 |
| **sdlc-designer** | UX/UI дизайн | 7 |
| **sdlc-data** | Базы данных, ETL | 5 |

**Всего: 160+ навыков**

---

## Структура проекта

```
kc-sdlc-team/
├── .kilo/                    # KiloCode агенты и конфигурация
│   ├── agent/                 # 10 SDLC агентов
│   │   ├── sdlc-coder.md
│   │   ├── sdlc-project-manager.md
│   │   ├── sdlc-system-analyst.md
│   │   ├── sdlc-tester.md
│   │   ├── sdlc-marketer.md
│   │   ├── sdlc-devops.md
│   │   ├── sdlc-security.md
│   │   ├── sdlc-designer.md
│   │   ├── sdlc-data.md
│   │   └── sdlc-business.md
│   ├── kilo.json             # Конфигурация KiloCode
│   └── plans/                # Планы проектов (gitkeep)
├── .kilocode/                # Правила и workflows
│   ├── rules/                # Правила для агентов
│   │   ├── agents-md-management.md
│   │   ├── file-conflict-resolution-rule.md
│   │   ├── language-communication-rule.md
│   │   ├── rule-memory-bank-to-agents-migration.md
│   │   └── script-location-rule.md
│   └── workflows/            # Автоматизация (commit, deploy, clean)
│       ├── commit-eng.md
│       ├── commit-rus.md
│       ├── docker-update-run.md
│       ├── sync-to-github.md
│       └── clean-project-artifacts.md
├── _sdlc-agent-skills/       # Навыки агентов (SKILL.md)
├── project_artifacts/        # Артефакты проектов (шаблон)
│   ├── pm_artifacts/         # Project Manager
│   ├── sa_artifacts/         # System Analyst
│   ├── dev_artifacts/        # Developer
│   ├── devops_artifacts/     # DevOps
│   ├── security_artifacts/   # Security
│   ├── design_artifacts/     # Designer
│   ├── data_artifacts/       # Data Engineer
│   ├── ba_artifacts/         # Business Analyst
│   ├── tst_artifacts/        # Tester
│   └── mrkt_artifacts/       # Marketer
├── scripts/                 # Исполняемые скрипты (validation, hooks, agents-md, sync)
├── LICENSE
└── README.md
```

---

## Как использовать

### Установка через setup-скрипт (рекомендуемый способ)

Откройте терминал **в пустой папке вашего проекта** и выполните:

```bash
curl -fsSL https://raw.githubusercontent.com/feodus/kc-sdlc-team/main/setup/setup-kilo-env.js | node
```

> **Требования:** [Node.js](https://nodejs.org/) 18+ и [Git](https://git-scm.com/downloads) в PATH.
> Скрипт загрузит все агенты, навыки, правила и создаст структуру артефактов автоматически.

**Параметры:**
- `-s, --silent` — тихий режим, без интерактивных вопросов
- `-f, --force` — принудительная перезапись (если файлы уже существуют)

**Windows (PowerShell):**
```powershell
(Invoke-WebRequest -UseBasicParsing https://raw.githubusercontent.com/feodus/kc-sdlc-team/main/setup/setup-kilo-env.js).Content | node
```

**Подробнее:** см. [setup/readme_setup.md](setup/readme_setup.md)

### Альтернативные способы

#### Вариант 2: Через degit

```bash
mkdir my-new-project && cd my-new-project
npx degit feodus/kc-sdlc-team#main .
```

#### Вариант 3: GitHub Template

1. Откройте https://github.com/feodus/kc-sdlc-team
2. Нажмите **"Use this template"**
3. Заполните данные и создайте репозиторий
4. Склонируйте новый репозиторий

---

## Артефакты проектов

Все артефакты хранятся в `project_artifacts/[role]_artifacts/`:

| Папка | Назначение |
|-------|------------|
| `pm_artifacts/` | Планы, оценки, отчёты Project Manager |
| `sa_artifacts/` | Требования, SRS, API спецификации System Analyst |
| `dev_artifacts/` | Код, метрики, деплой Developer |
| `devops_artifacts/` | CI/CD, инфраструктура DevOps |
| `security_artifacts/` | Аудиты, уязвимости Security |
| `design_artifacts/` | Макеты, прототипы Designer |
| `data_artifacts/` | Миграции, ETL Data Engineer |
| `ba_artifacts/` | Бизнес-аналитика Business Analyst |
| `tst_artifacts/` | Тесты, результаты, дефекты Tester |
| `mrkt_artifacts/` | Маркетинговые стратегии, кампании Marketer |

---

## Частые вопросы

### Нужно ли устанавливать что-то глобально?

**Нет.** NPX сам скачает нужный пакет и запустит его. После использования пакет удаляется.

### Почему NPX может не работать?

- Не установлен Node.js
- Старая версия Node.js — обнови до 18+
- Проблемы с интернетом

### Как проверить, что KiloCode работает?

В терминале VS Code введи:

```bash
kilo --version
```

Если команда не найдена, установи KiloCode глобально:

```bash
npm install -g kilocode
```

---

## Синхронизация

Репозиторий синхронизируется с GitHub (публичный шаблон):

- **GitLab** (основной): `gitlab.com/wm-dev-tools/kc-sdlc-team`
- **GitHub** (публичный): `github.com/feodus/kc-sdlc-team`

Синхронизация выполняется скриптом `scripts/sync/sync-to-github-universal.sh` (только в GitLab).

---

## Версия

- **Version:** 1.36.0
- **Last Updated:** 15-07-2026
- **Branch:** main
- **Commit:** 8d79769

---

## Changelog

### v1.36.0 (15-07-2026)

- **Регруппировка скриптов:** скрипты перенесены по поддиректориям `scripts/` (validation, hooks, agents-md, sync); обновлены ссылки в документации.

### v1.35.0 (14-07-2026)

- **Удалена MCP-конфигурация:** удалён `.kilocode/mcp.json` (серверы `context7`, `sequentialthinking`); добавлен отчёт по анализу GitHub-репозитория.

### v1.34.0 (06-07-2026)

- **Профили агентов:** добавлен `agent-profiles.yaml`, внедрён `defaultProfile` во всех агентах.
- **Декомпозиция навыков:** разделены `api-design`, `postgresql-development`, `clean-architecture`, `rest-api-design`, `data-modeling` (ADR-01..05).
- **Аудит структуры (P-01..P-05):** устранены дубликаты регистраций, добавлена Skills Ownership Matrix.

### v1.32.0 (05-07-2026)

- **Исправлена синхронизация с GitHub (SSH аутентификация):** корректная работа с SSH-ключами, таймауты и права доступа для стабильной синхронизации
- **Улучшен процесс синхронизации с GitHub:** добавлено логирование операций и верификация хэша коммита для контроля целостности
- **Рефакторинг правил синхронизации:** `sync-to-github-universal.md` перенесён из `workflows/` в `rules/` для соответствия архитектуре проекта
- **Добавлена установка навыков через setup-скрипт:** автоматическая загрузка `_sdlc-agent-skills` при инициализации проекта, удалены устаревшие PowerShell/Bash скрипты установки
- **Исправления workflow:** устранена опечатка в `commit-rus.md`, обновлены скрипты настройки окружения KiloCode
- **Актуализация документации:** обновление README.md и связанных документов

### v1.31.0 (03-07-2026)

- **Добавлен worktree peach-hydrant в конфигурацию agent-manager:** расширена поддержка мульти-агентных сессий в KiloCode
- **Разрешён конфликт при слиянии main в holy-margin:** интеграция изменений из основной ветки с ручным разрешением конфликтов
- **Удалён устаревший subagent sdlc-coder:** функционал перенесён в основной агент
- **Удалены устаревшие планы и отчёты проекта:** очистка `project_artifacts/pm_artifacts/`
- **Добавлен workflow `clean-project-artifacts`:** процесс очистки артефактов с сохранением структуры папок
- **Актуализация документации:** обновление README.md с отражением всех изменений

### v1.30.0 (02-07-2026)

- **Корректировка логики работы агентов SDLC:** обновлена модель взаимодействия 10 специализированных агентов
- **Удаление устаревних режимов:** из PM-протокола удалены встроенные `architect` и `code` режимы, заменены на `sdlc-devops` и `sdlc-coder`
- **Обновление путей артефактов:** `arch_artifacts/` заменён на `devops_artifacts/`, структура `project_artifacts/` расширена до 10 наборов
- **Добавление протоколов координации:** в файлы `sdlc-coder`, `sdlc-system-analyst`, `sdlc-tester` добавлены секции cross-team coordination
- **Расширение секции "Основные компоненты":** добавлены описания для `sdlc-devops`, `sdlc-security`, `sdlc-designer`, `sdlc-data`, `sdlc-business`
- **Обновление таблицы фаз SDLC:** добавлены фазы Проектирование, Безопасность, Деплой, Обслуживание с соответствующими primary/secondary агентами
- **Актуализация Changelog и метаданных**

### v1.29.0 (07-05-2026)

- Добавлено глобальное правило языковой коммуникации для агентов и подагентов
- Создан файл .kilocode/rules/language-communication-rule.md с правилами общения на русском языке
- Обновлены секции Guidelines в AGENTS.md и .kilocode/rules/agents-md-management.md
- Добавлена ссылка на правило языковой коммуникации в документацию

### v1.28.0 (19-04-2026)

- Интегрировано руководство QUICKSTART.md в README.md
- Удалён файл QUICKSTART.md (информация перенесена в README.md)
- Добавлена секция "Как использовать" с тремя вариантами в README.md
- Добавлена секция "Частые вопросы" (FAQ) в README.md
- Обновлена версия в метаданных

---

## Полезные ссылки

- **KiloCode документация:** https://kilo.ai/docs/
- **Шаблон на GitHub:** https://github.com/feodus/kc-sdlc-team
- **Скачать Node.js:** https://nodejs.org

---

## Лицензия

MIT License — свободное использование для создания новых KiloCode-проектов.
