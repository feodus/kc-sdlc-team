---
name: google-apps-script-development
description: Google Apps Script Development. Use this skill when creating script solutions for Google Sheets, Google Docs, Gmail and other Google Workspace applications. Includes macro development, automation, custom functions, and web apps.
---

# Google Apps Script Development Guide

## Purpose
This skill provides comprehensive guidance for developing Google Apps Script (GAS) solutions for Google Workspace. It covers architectural principles, coding standards, best practices, and development methodologies for creating robust, performant, and scalable Google Sheets scripts, add-ons, and web applications.

## Core Principles

### Deep Task Analysis
When receiving any request, you must conduct a comprehensive analysis:
- Business context: strategic goals and solution value for the user
- Technical parameters: data scale, expected load, usage frequency, and execution environment
- Human factor: technical skill level of end users
- Lifecycle: scalability, support, and future development requirements

### Quality Standards
All solutions must meet the highest standards:
- **Architecture**: Apply clean architecture principles (modularity, loose coupling, high cohesion)
- **Performance**: Design with optimization in mind (minimize API calls, use batch operations)
- **Reliability**: Create robust solutions with comprehensive error handling
- **Maintainability**: Develop self-documenting, clean code with clear structure

### Google Apps Script Specifics

#### File Structure
- `cod.gs` — основной файл скрипта (Apps Script)
- `.clasp.json` — конфигурация CLASP ( содержит scriptId)
- `appsscript.json` — манифест проекта
- Файлы `.gs` — отдельные модули скрипта

#### Local Development Tools (CLASP)
- **CLASP** — официальный CLI от Google для локальной разработки
- **Node.js 20+** — требуется для CLASP
- **npm** — пакетный менеджер

#### Key Google Apps Script APIs
- **SpreadsheetApp** — работа с таблицами Google Sheets
- **DocumentApp** — работа с Google Docs
- **MailApp** — отправка email через Gmail
- **LockService** — блокировка для критических секций
- **CacheService** — кэширование данных
- **PropertiesService** — хранение пользовательских свойств
- **ScriptApp** — управление триггерами и авторизацией
- **UrlFetchApp** — внешние HTTP запросы
- **CalendarApp** — работа с Google Calendar

## Coding Standards

### General Principles
- **'@OnlyCurrentDoc'**: Используется для ограничения доступа к документу
- **Strict Mode**: Все переменные должны быть объявлены
- **Language**: Русский язык для комментариев и документации
- **Error Handling**: Обязательная обработка ошибок во всех публичных функциях
- **JSDoc**: Документирование функций с @param и @return

### Google Apps Script Specific Patterns

#### 1. Event Handlers (onEdit, onOpen)
```javascript
/**
 * Обработчик редактирования ячеек
 * @param {Object} e Объект события
 * @OnlyCurrentDoc
 */
function onEdit(e) {
  var sheet = e.source.getActiveSheet();
  var range = e.range;
  // Логика обработки
}
```

#### 2. Safe Sheet Access
```javascript
function getSheetData(sheetName) {
  var ss = SpreadsheetApp.getActiveSpreadsheet();
  var sheet = ss.getSheetByName(sheetName);
  if (!sheet) {
    throw new Error('Sheet not found: ' + sheetName);
  }
  return sheet;
}
```

#### 3. Batch Operations
```javascript
// Неправильно: множественные отдельные вызовы
for (var i = 0; i < 100; i++) {
  sheet.getRange(i + 1, 1).setValue(values[i]); // 100 вызовов
}

// Правильно: batch операция
var range = sheet.getRange(1, 1, 100, 1);
range.setValues(values); // 1 вызов
```

#### 4. Transaction-like Patterns
```javascript
function safeUpdate(func) {
  var lock = LockService.getScriptLock();
  lock.tryLock(10000); // 10 секунд ожидания
  try {
    func();
  } finally {
    lock.releaseLock();
  }
}
```

### Module Structure
Each script file should include a header with:
- Module description
- Purpose
- Dependencies

```javascript
/**
 * @OnlyCurrentDoc
 * 
 * Модуль: Основные функции управления задачами
 * Назначение: Автоматизация обработки задач в таблице
 * Зависимости: SpreadsheetApp, LockService
 */

//==============================================================================
// КОНСТАНТЫ
//==============================================================================

// Индексы колонок (0-based)
var COL_INDEX = {
  ID: 1,          // B
  TASK: 2,       // C
  DATE: 3        // D
};
```

## Iterative Development Methodology

### Step 1: Plan First
- Never provide code without prior agreement on a detailed plan
- When receiving information about a task or problem, the first response must be a plan containing:
  - **Analysis**: Clear statement of what the provided data indicates
  - **Diagnosis**: Main hypothesis about the root cause of the problem
  - **Solution/Debugging Plan**: Step-by-step action strategy without a single line of code
- End the plan provision with a clear question requesting user consent to execute the plan

### Step 2: Implementation after Approval
- Provide code only after receiving explicit consent from the user
- **Accuracy and Conciseness**: By default, provide code only for the changed function or procedure
- **Versioning and Commenting**:
  - Each corrected function must have a version number and change description in the comment
  - Key lines of fixes must be accompanied by an explanatory comment

### Step 3: Verification and Self-Correction
- After the user has applied the code and provided the result, thoroughly analyze the new data
- In case of failure, the priority task is to conduct a re-analysis, formulate a new hypothesis, and propose a new plan
- The cycle [Plan → Approval → Code → Result → Analysis → New Plan] is unbreakable

## Common Patterns

### 1. Auto-ID Generation
```javascript
function generateTaskId(taskName) {
  var input = (taskName || "") + new Date().getTime().toString();
  var digest = Utilities.computeDigest(Utilities.DigestAlgorithm.MD5, input);
  
  var hex = "";
  for (var i = 0; i < digest.length; i++) {
    var byte = digest[i];
    if (byte < 0) byte += 256;
    hex += ("0" + byte.toString(16)).slice(-2);
  }
  
  var shortHash = hex.substring(0, 4).toUpperCase();
  return "TASK-" + shortHash;
}
```

### 2. Table Sorting with Empty Date Handling
```javascript
function sortByDate(columnIndex) {
  var sheet = SpreadsheetApp.getActiveSpreadsheet().getActiveSheet();
  var lastRow = sheet.getLastRow();
  
  var dataRange = sheet.getRange(2, 1, lastRow - 1, sheet.getLastColumn());
  var values = dataRange.getValues();
  
  var withDates = [];
  var withoutDates = [];
  
  for (var i = 0; i < values.length; i++) {
    var dateValue = values[i][columnIndex];
    var dateObj = null;
    
    if (dateValue instanceof Date && !isNaN(dateValue.getTime())) {
      dateObj = dateValue;
    }
    
    if (dateObj) {
      withDates.push({ row: values[i], date: dateObj });
    } else {
      withoutDates.push(values[i]);
    }
  }
  
  withDates.sort(function(a, b) { return a.date - b.date; });
  var sortedValues = withDates.map(function(item) { return item.row; }).concat(withoutDates);
  
  dataRange.setValues(sortedValues);
}
```

### 3. Custom Menu Creation
```javascript
function onOpen() {
  var ui = SpreadsheetApp.getUi();
  ui.createMenu('🔧 Управление')
    .addItem('Сортировать задачи', 'sortTasksByDate')
    .addItem('Заполнить ID', 'fillMissingIds')
    .addToUi();
}
```

### 4. Multi-sheet Handling
```javascript
function processAllSheets() {
  var ss = SpreadsheetApp.getActiveSpreadsheet();
  var sheets = ss.getSheets();
  
  for (var i = 0; i < sheets.length; i++) {
    var sheetName = sheets[i].getName();
    Logger.log('Processing: ' + sheetName);
    // Логика обработки каждого листа
  }
}
```

## Testing and Debugging

### Logger Usage
```javascript
function debugFunction() {
  Logger.log('Начало выполнения');
  
  try {
    // Код
    Logger.log('Успешно завершено');
  } catch (error) {
    Logger.log('Ошибка: ' + error.message);
    throw error;
  }
}
```

### Execution Log Viewing
- View → Executions transcript в Apps Script editor
- File → Project properties → Script executions

### Common Issues
1. **Authorization required**: Скрипт запрашивает разрешения при первом запуске
2. **Slow execution**: Использовать batch операции вместо циклов
3. **Quota limits**: Учитывать ограничения Google (100k ячеек, время выполнения)
4. **@OnlyCurrentDoc**: Ограничивает доступ только к текущему документу

## Best Practices Summary

1. **Always use batch operations** — setValues/getValues вместо множественных вызовов
2. **Implement error handling** — try/catch с логированием
3. **Use LockService** — для критических секций с параллельным доступом
4. **Document with JSDoc** — @param, @return, @description
5. **Version comments** — указывать версию и дату изменений
6. **Use const/let** — избегать глобальных переменных где возможно
7. **Separate concerns** — разделять логику и представление

## Deployment

### Types of Deployment
1. **Library** — для повторного использования
2. **Web App** — для HTTP приложений
3. **Add-on** — для Marketplace

### Publishing Steps
1. Publish → Deploy as web app / Publish add-on
2. Select version
3. Execute as: Me / User accessing the web app
4. Who has access: Anyone / Only me / Anyone within domain

## Integration with Other Services

### Email Notifications
```javascript
function sendNotification(subject, body) {
  MailApp.sendEmail({
    to: Session.getActiveUser().getEmail(),
    subject: subject,
    body: body
  });
}
```

### External APIs
```javascript
function fetchExternalData(url) {
  var response = UrlFetchApp.fetch(url, {
    method: 'GET',
    muteHttpExceptions: true
  });
  return JSON.parse(response.getContentText());
}
```

## CLASP — Local Development

### Installation
```bash
# Требования: Node.js 20.0.0+
npm install -g @google/clasp

# Проверка версии
clasp -v
```

### Prerequisites
1. Включить Apps Script API: https://script.google.com/home/usersettings
2. Авторизоваться: `clasp login`

### Configuration (.clasp.json)
```json
{
  "scriptId": "1ABCd...",
  "rootDir": ".",
  "fileExtension": "gs",
  "filePushOrder": ["cod.gs"]
}
```

### Essential Commands
```bash
# Создать новый проект
clasp create "My Project" --type standalone

# Клонировать существующий проект
clasp clone "SCRIPT_ID"

# Загрузить изменения с Google (pull)
clasp pull

# Выгрузить изменения в Google (push)
clasp push

# Следить за изменениями
clasp push --watch

# Открыть редактор в браузере
clasp open-script

# Создать деплой
clasp deploy

# Список деплойментов
clasp list-deployments

# Запустить функцию удаленно
clasp run functionName
```

### Development Workflow
```bash
# 1. Авторизация (один раз)
clasp login

# 2. Клонирование проекта
clasp clone "YOUR_SCRIPT_ID"

# 3. Локальная разработка
#    Редактируйте cod.gs в IDE (VS Code, etc.)

# 4. Загрузка в Google
clasp push

# 5. Открыть и проверить
clasp open-script

# 6. Деплой (когда готово)
clasp deploy
```

### MCP Integration (Model Context Protocol)
CLASP поддерживает режим MCP для интеграции с AI агентами:
```bash
clasp mcp
```

### Notes
- `.clasp.json` и `appsscript.json` не должны коммититься в git (добавить в .gitignore)
- При push все локальные `.gs` файлы загружаются в Google
- fileExtension по умолчанию: `gs` (можно изменить на `js`)

### Practical Scenarios

#### Scenario 1: Bug Fix
```bash
# 1. Получить актуальный код
clasp pull

# 2. Исправить в IDE (VS Code)
#    Сохранить файл

# 3. Загрузить исправление
clasp push

# 4. Открыть и проверить
clasp open-script
```

#### Scenario 2: New Feature
```bash
# 1. Получить текущий код
clasp pull

# 2. Добавить функцию в cod.gs
#    (см. SKILL.md с примерами)

# 3. Загрузить
clasp push

# 4. Создать деплой (если нужно)
clasp deploy
```

#### Important Commands Reference

| Команда | Назначение |
|---------|----------|
| `clasp pull` | Скачать код с Google |
| `clasp push` | Загрузить код в Google |
| `clasp open-script` | Открыть редактор в браузере |
| `clasp deploy` | Создать новый деплой |
| `clasp list-deployments` | Список деплоев |
| `clasp versions` | Список версий |
| `clasp status` | Проверить статус |

#### Troubleshooting

```bash
# Не загружается → проверить статус
clasp status

# Ошибка авторизации → перелогиниться
clasp logout
clasp login

# Открыть настройки проекта
clasp open-script
```

### Project Configuration Example

Для проекта relocation-203:
```json
{
  "scriptId": "1PC5LGjd5J0DM5OfPBJbJU5188Ab2tdhKMufi4i6BaWvDhZG8UJM4lp66",
  "rootDir": ".",
  "fileExtension": "gs",
  "filePushOrder": ["cod.gs"]
}
```