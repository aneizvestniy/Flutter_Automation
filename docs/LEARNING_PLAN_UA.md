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

## 1) E2E vs Coverage — чітко розділяємо (критично)

Часте непорозуміння: **"80% coverage = багато Appium E2E"**.
У Flutter-проєктах це зазвичай повільно, флейково і дорого.

### Наше правило
- **Coverage (~80%)** робимо через **Flutter unit/widget/integration тести** (швидко, стабільно).
- **E2E (Appium)** — для *невеликої кількості* критичних end-to-end сценаріїв.

### Мапа типів тестів
- **Unit** → доменна логіка (use cases), валідація, мапінг
- **Widget** → UI-стани й композиція (loading/error/success)
- **Integration** → флоу всередині Flutter runtime
- **Appium E2E** → true end-to-end по екранах + девайсні взаємодії

### Правила для ~80%
- Кожен use case / repository / validator має unit-тести.
- Кожен екран має widget-тест на ключові стани.
- Важливі інтеграції (storage/network mock) — integration tests.

---

## 2) Версії інструментів (зафіксувати у репозиторії)

> Ці значення треба зафіксувати у файлах репозиторію, щоб уникнути «у мене не запускається».

- **Flutter SDK:** 3.24.3 (stable) *(або інша стабільна — зафіксувати у `fvm`)*
- **Dart:** 3.5.x (йде разом з Flutter SDK)
- **Appium:** 2.11.4
- **Node.js:** 22.x
- **Java (Android):** Temurin 17
- **Android SDK:** platform 34, build-tools 34.0.0
- **Xcode (iOS, опційно):** 15.x

> Файли для фіксації: `.tool-versions` (asdf), або `.nvmrc`, + `fvm_config.json` (FVM).

### Week 0 / Day 1 preflight
Перед Module 1 всі мають пройти preflight чекліст:
- [`testing/PREFLIGHT_WEEK0_UA.md`](../testing/PREFLIGHT_WEEK0_UA.md)
- [`testing/PREFLIGHT_WEEK0_EN.md`](../testing/PREFLIGHT_WEEK0_EN.md)

---

## 3) Структура репозиторію (цільова)

```text
Flutter_Automation/
  docs/                         # high-level docs (точки входу)
    README.md
    LEARNING_PLAN_UA.md
    LEARNING_PLAN_EN.md

  learn/                        # навчальні модулі (потижнево)
    README.md
    module-01-dart-flutter-basics/
      README.md
      exercises/
      examples/
    module-02-training-app/
      README.md
      exercises/
    module-03-test-framework/
      README.md
    module-04-advanced/
      README.md

  app/                          # навчальний Flutter-додаток (Clean Architecture)
    README.md
    (тут буде згенерований Flutter-проєкт)

  testing/                      # налаштування тестів і фреймворки
    README.md
    unit_widget_integration/
    e2e_appium/
      README.md
      package.json
      docs/
      src/
    ci/

  .github/workflows/
    ci.yml
  .nvmrc
  fvm_config.json
  Makefile
  README.md
```

> Примітка: код апки тримаємо в `app/`, тести/фреймворки — в `testing/`, а навчальні матеріали — в `learn/`.

---

## 4) Послідовність реалізації (4 тижні)

### Додаткові repo-документи (під критерії успіху)
- Week 0 preflight:
  - `testing/PREFLIGHT_WEEK0_UA.md`
  - `testing/PREFLIGHT_WEEK0_EN.md`
- Seed/reset (test data management):
  - `testing/TEST_DATA_SEEDING_UA.md`
  - `testing/TEST_DATA_SEEDING_EN.md`
- Стандарти синхронізації E2E:
  - `testing/e2e_appium/docs/synchronization.md`
- CI стратегія (always vs optional):
  - `testing/CI_STRATEGY_UA.md`
  - `testing/CI_STRATEGY_EN.md`
- Week 2 E2E Definition of Ready:
  - `testing/E2E_WEEK2_DEFINITION_OF_READY_UA.md`
  - `testing/E2E_WEEK2_DEFINITION_OF_READY_EN.md`
- Exit tickets по модулях:
  - `learn/module-01-dart-flutter-basics/EXIT_TICKET.md`
  - `learn/module-02-training-app/EXIT_TICKET.md`
  - `learn/module-03-test-framework/EXIT_TICKET.md`
  - `learn/module-04-advanced/EXIT_TICKET.md`

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

## Стратегія Keys (контракт тестованості)
Щоб локатори були стабільними і тести не флейкали, у навчальній апці буде централізований реєстр ключів:
- `app/lib/core/testing/keys.dart`

Правила:
- keys як константи (без ad-hoc строк у віджетах)
- єдина схема неймінгу: `screen.<screenName>.<element>`
- зміна key = оновлення Page Objects і тестів

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

## Week 2 Definition of Ready
Перед стартом E2E пройди:
- `testing/E2E_WEEK2_DEFINITION_OF_READY_UA.md`

## Стандарти синхронізації
Дотримуйся:
- `testing/e2e_appium/docs/synchronization.md`

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

## CI: always vs optional
Реалізуй стратегію з:
- `testing/CI_STRATEGY_UA.md`

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

