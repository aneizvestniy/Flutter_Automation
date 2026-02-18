# Flutter Automation Learning Repository — План (UA)

Цей репозиторій — навчальний проєкт для QA-інженерів з **2+ роками досвіду** у тестуванні, які **новачки у Flutter/Dart**. Ціль — провести вас від нуля в екосистемі Flutter до **першого робочого E2E тесту до кінця 2-го тижня**, а за 4 тижні — мати повний набір прикладів, CI та **~80% coverage** по прикладному коду (в навчальному застосунку + тестових утилітах).

---

## 0) Критерії успіху (Definition of Done)

### До кінця тижня 2
- [ ] Учасник самостійно запускає тестовий Flutter-додаток локально.
- [ ] Учасник налаштовує Appium 2 + `appium-flutter-driver`.
- [ ] Учасник пише та запускає **перший E2E тест** (login flow, 5–7 кроків).

### До кінця тижня 4
- [ ] Усі 4 модулі завершені, всі приклади коду **запускаються**.
- [ ] Є мінімум 1 великий E2E сценарій на **20+ кроків**.
- [ ] Є CI (GitHub Actions) з запуском lint + unit/widget/integration тестів і (опційно) e2e.
- [ ] Coverage навчальних прикладів ~**80%** (на модулі `app` + `test_utils`).

---

## 1) Загальна стратегія: як досягти 80% coverage

> Важливо: 80% coverage у Flutter-автоматизації майже завжди досягається **unit/widget/integration** тестами на коді застосунку, а не тільки Appium E2E.

### Ми робимо так:
- **App code coverage**: unit + widget + integration тести (Flutter test runner) — основа coverage.
- **E2E (Appium)**: менше тестів, але найцінніші end-to-end сценарії.
- **Test utilities** (`packages/test_utils`) — окремий пакет з утилітами/фікстурами, який теж має тести.

### Coverage правила:
- Кожен use case / repository / validator має unit-тести.
- Кожен екран має widget-тест на ключові стани (loading, error, success).
- Кожна важлива інтеграція (наприклад local storage / mock API) — integration tests.

---

## 2) Версії інструментів (зафіксувати у репозиторії)

> Ці значення треба зафіксувати у файлах репозиторію, щоб уникнути «у мене не запускається».

- **Flutter SDK:** 3.24.3 (stable) *(або інша стабільна — зафіксувати у `fvm`)*
- **Dart:** 3.5.x (йде разом з Flutter SDK)
- **Appium:** 2.11.4
- **Node.js:** 22.x (LTS-like у вашому середовищі)
- **Java (Android):** Temurin 17
- **Android SDK:** platform 34, build-tools 34.0.0
- **Xcode (iOS, опційно):** 15.x

> Файли для фіксації: `.tool-versions` (asdf), або `.nvmrc`, + `fvm_config.json` (FVM).

---

## 3) Структура репозиторію (цільова)

```text
Flutter_Automation/
  docs/
    LEARNING_PLAN_UA.md
    LEARNING_PLAN_EN.md
    module-01-dart-flutter-basics/
      README.md
      devtools-guide.md
      exercises/
        ex01_keys.md
        ex02_widget_tree.md
        ex03_state.md
      examples/
        keys_demo/
        widget_tree_demo/
        state_demo/
    module-02-training-app/
      README.md
      architecture.md
      troubleshooting.md
      exercises/
        ex01_run_app.md
        ex02_add_feature_flag.md
      app/                      # Flutter app workspace
    module-03-test-framework/
      README.md
      appium-setup.md
      page-objects.md
      selectors-and-finders.md
      test-data-management.md
      troubleshooting.md
    module-04-advanced/
      README.md
      animations-and-sync.md
      parallel-execution.md
      ci-github-actions.md
      hybrid-apps.md
      performance.md
  app/                          # основний Flutter додаток (навчальний)
    pubspec.yaml
    lib/
      main.dart
      core/
      features/
    test/                       # unit + widget tests
    integration_test/           # integration tests
  packages/
    test_utils/
      pubspec.yaml
      lib/
      test/
  e2e/
    README.md
    appium/
      package.json
      playwright.config.(optional)
      src/
        config/
        drivers/
        pages/
        fixtures/
        tests/
    scripts/
      run_android_emulator.sh
      run_appium.sh
  .github/workflows/
    ci.yml
  .nvmrc
  fvm_config.json
  Makefile
  README.md
```

> Примітка: у модулі 2 можна зробити `docs/module-02-training-app/app/` як підказки, але сам код апки має бути у корені `app/` — так зручніше для CI.

---

## 4) Послідовність реалізації (4 тижні)

# МОДУЛЬ 1 — Основи Dart та Flutter (Тиждень 1)

## Цілі навчання (вимірювані)
- [ ] Пояснити різницю між **Stateless** та **Stateful** widgets.
- [ ] Пояснити, що таке **Widget Tree** і як Flutter рендерить UI.
- [ ] Використовувати **Keys** (ValueKey) для стабільних локаторів у тестах.
- [ ] Вміти відкривати Flutter DevTools і знаходити елементи у widget hierarchy.

## Файли/папки
- `docs/module-01-dart-flutter-basics/README.md` — короткий roadmap на тиждень.
- `docs/module-01-dart-flutter-basics/devtools-guide.md` — гайд по DevTools (Widget Inspector, Performance, Logs).
- `docs/module-01-dart-flutter-basics/examples/*` — міні-проєкти.
- `docs/module-01-dart-flutter-basics/exercises/*` — вправи.

## Приклади коду (мінімум)
1) **keys_demo**
   - Екран з кнопкою/полем, кожен елемент має `ValueKey`.
   - Очікування: QA бачить, як key стає стабільним локатором.

2) **widget_tree_demo**
   - Простий екран з вкладеними widgets (Column/Row/Container/Text).
   - Очікування: в DevTools можна знайти текст і зрозуміти дерево.

3) **state_demo**
   - Лічильник з StatefulWidget + setState.
   - Очікування: QA розуміє, чому стани впливають на тестову синхронізацію.

## Практика (для досвідчених QA)
- Вправа: додати `ValueKey` до 10 елементів і описати правила неймінгу key.
- Вправа: знайти в DevTools 3 елементи і виписати їх шлях в widget tree.

## Типові складнощі + як їх пройти
- **Widget tree ≠ DOM**: пояснюємо «все — widget», немає HTML-дерева.
- **Немає XPath**: у Flutter тестах ставка на **Keys** + `find.text/byType`.

---

# МОДУЛЬ 2 — Тестова аплікація (best practices) (Тиждень 1–2)

## Цілі навчання
- [ ] Запустити додаток локально (Android emulator / iOS simulator / desktop).
- [ ] Розуміти структуру **Clean Architecture** у Flutter.
- [ ] Знати де шукати UI, domain, data шари.
- [ ] Розуміти navigation і базові CRUD сценарії.

## Вимоги до додатку
- Екран логіну.
- CRUD (наприклад «Notes» або «Tasks»): create/list/edit/delete.
- Навігація: login → list → details/edit → back.
- Стандартні стани: loading/error/empty/success.
- **ValueKey** на всіх тест-критичних елементах.

## Структура коду (приклад)
```text
app/lib/
  core/
    widgets/
    theme/
    routing/
    errors/
  features/
    auth/
      presentation/
      domain/
      data/
    notes/
      presentation/
      domain/
      data/
```

## Документація
- `docs/module-02-training-app/README.md` — як запустити, залежності.
- `docs/module-02-training-app/architecture.md` — пояснення Clean Architecture.
- `docs/module-02-training-app/troubleshooting.md` — часті проблеми (Android licenses, Gradle, etc.).

## Практика
- Вправа: додати новий field у Notes (наприклад `priority`) і провести через всі шари.
- Вправа: додати feature flag (env/const) і перевірити в UI.

---

# МОДУЛЬ 3 — Фреймворк для тестування та перші тести (Тиждень 2–3)

> Головна віха: **перший E2E тест до кінця тижня 2**.

## Цілі навчання
- [ ] Налаштувати Appium 2.
- [ ] Налаштувати `appium-flutter-driver`.
- [ ] Розуміти Flutter selectors: `find.byValueKey`, `find.text`, `find.byType`.
- [ ] Реалізувати Page Object Pattern.
- [ ] Написати перші E2E тести: login + CRUD.

## Файли/папки
- `e2e/README.md` — як запускати e2e.
- `docs/module-03-test-framework/appium-setup.md` — інструкція встановлення (Android).
- `docs/module-03-test-framework/page-objects.md` — правила POM.
- `docs/module-03-test-framework/test-data-management.md` — тестові дані.

## Структура e2e тестів (приклад)
```text
e2e/appium/src/
  config/
    env.ts
    capabilities.android.ts
  drivers/
    appium.ts
  pages/
    login.page.ts
    notes.list.page.ts
    notes.editor.page.ts
  fixtures/
    users.ts
    notes.ts
  tests/
    01_login.spec.ts
    02_notes_crud.spec.ts
    99_full_e2e_20_steps.spec.ts
```

## Базові тести
1) **Login flow (5–7 кроків)**
- open app → fill email → fill password → tap login → verify landing screen.

2) **CRUD**
- create note → verify in list → open → edit → verify → delete → verify отсутствует.

3) **E2E 20+ steps**
- повний сценарій з коментарями: логін → створити 3 записи → фільтр → редагування → logout → login → verify persisted state.

## Типові складнощі
- Синхронізація: чекати **стабільності** UI, не робити `sleep` без необхідності.
- Анімації: чекати `driver.execute('flutter:waitFor', ...)` або retry на локаторах.

---

# МОДУЛЬ 4 — Розширені можливості (Тиждень 3–4)

## Цілі навчання
- [ ] Стабільна синхронізація (анімації, delayed renders, network).
- [ ] Паралельний запуск тестів.
- [ ] CI/CD: GitHub Actions.
- [ ] Базові performance перевірки.
- [ ] Розуміння гібридних додатків (WebView) і стратегії тестування.

## Документація
- `docs/module-04-advanced/animations-and-sync.md`
- `docs/module-04-advanced/parallel-execution.md`
- `docs/module-04-advanced/ci-github-actions.md`
- `docs/module-04-advanced/performance.md`

## Приклади
- Retry wrappers для flaky локаторів.
- Конфіг паралельного запуску (розбиття test suite).
- GitHub Actions workflow:
  - lint
  - unit/widget/integration tests + coverage
  - (опційно) e2e на self-hosted runner / emulator

---

## 5) README на корені репозиторію (що має містити)
- Швидкий старт (Flutter/FVM, Node, Appium).
- Як запустити app.
- Як запустити unit/widget/integration tests.
- Як запустити e2e.
- Troubleshooting (поширені помилки).

---

## 6) Поради по педагогіці для QA 2+ років
- Пояснення через аналогії з Web (DOM ↔ widget tree, locators ↔ keys).
- Максимум практичних «готових рецептів» (POM, фікстури, чеклісти).
- Мінімум «що таке змінна/цикл» — одразу прикладний код.

