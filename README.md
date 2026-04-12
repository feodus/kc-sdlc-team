# kc-sdlc-team — KiloCode SDLC Agent Template

> Универсальный шаблон KiloCode-проекта для полного цикла разработки программного обеспечения (SDLC).

---

## Описание

Этот репозиторий содержит комплексную экосистему специализированных AI-агентов для KiloCode, обеспечивающих полный цикл разработки: от анализа требований до тестирования, развёртывания и маркетинга.

### Экосистема включает 11 агентов

| Агент | Назначение | Навыков |
|-------|------------|---------|
| **sdlc-system-analyst** | Системный анализ, требования, API design | 16 |
| **sdlc-project-manager** | Управление проектами, координация | 22 |
| **sdlc-coder** | Разработка, DevOps | 19 |
| **sdlc-tester** | Тестирование, QA | 19 |
| **sdlc-marketer** | Маркетинг, продвижение | 21 |
| **sdlc-business** | Бизнес-аналитика | 21 |
| **sdlc-devops** | CI/CD, инфраструктура | 6 |
| **sdlc-security** | Безопасность, аудит | 7 |
| **sdlc-designer** | UX/UI дизайн | 7 |
| **sdlc-data** | Базы данных, ETL | 5 |

**Всего: 159+ навыков**

---

## Структура проекта

```
kc-sdlc-team/
├── .kilo/                    # KiloCode агенты и конфигурация
│   ├── agent/                 # 10 SDLC агентов
│   ├── kilo.json             # Конфигурация KiloCode
│   └── plans/                # Планы проектов (gitkeep)
├── .kilocode/                # Правила и workflows
│   ├── rules/                # Правила для агентов
│   └── workflows/            # Автоматизация (commit, deploy)
├── _sdlc-agent-skills/       # Навыки агентов (SKILL.md)
├── project_artifacts/        # Артефакты проектов (шаблон)
│   ├── pm_artifacts/         # Project Manager
│   ├── sa_artifacts/         # System Analyst
│   ├── dev_artifacts/        # Developer
│   ├── tst_artifacts/        # Tester
│   └── ...                  # Остальные агенты
├── LICENSE
└── README.md
```

---

## Использование

### 1. Клонирование шаблона

```bash
git clone https://github.com/feodus/kc-sdlc-team.git my-project
cd my-project
```

### 2. Настройка KiloCode

Убедитесь, что установлен KiloCode CLI и настроены агенты в `.kilo/agent/`.

### 3. Артефакты проектов

Все артефакты хранятся в `project_artifacts/[role]_artifacts/`:
- `pm_artifacts/` — планы, оценки, отчёты PM
- `sa_artifacts/` — требования, SRS, API спецификации
- `dev_artifacts/` — код, метрики, деплой
- `tst_artifacts/` — тесты, результаты, дефекты

---

## Синхронизация

Репозиторий синхронизируется с GitHub (публичный шаблон):

- **GitLab** (основной): `gitlab.com/wm-dev-tools/kc-sdlc-team`
- **GitHub** (публичный): `github.com/feodus/kc-sdlc-team`

Синхронизация выполняется скриптом `sync-to-github-universal.sh` (только в GitLab).

---

## Версия

- **Version:** 1.26.0
- **Last Updated:** 12-04-2026

---

## Лицензия

MIT License — свободное использование для создания новых KiloCode-проектов.