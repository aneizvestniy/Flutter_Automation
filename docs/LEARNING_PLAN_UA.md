# Flutter Automation Learning Repository — Структурований план (UA)

Цей репозиторій створений для QA-інженерів з **2+ роками досвіду** у тестуванні, які **новачки у Flutter/Dart**.

## Основні результати
- Учасники можуть написати і запустити **перший E2E тест** (Appium + appium-flutter-driver) на ранньому етапі.
- Репозиторій містить робочі приклади та структуру, яка дозволяє досягти **~80% coverage** по **training app + test utilities** (переважно через unit/widget/integration).

---

# 0) Як користуватись цим планом
План організований за **пунктами реалізації** (а не за тижнями). Виконуйте пункти послідовно.

Папки репозиторію:
- `learn/` — навчальні модулі та вправи
- `app/` — навчальна Flutter-апка
- `testing/` — стратегія тестів + E2E фреймворк + CI
- `docs/` — high-level документи/точки входу

---

# 1) E2E vs Coverage (чітко розділяємо)
Часте непорозуміння: **"80% coverage = багато Appium E2E"**.

## 1.1 Правило
- **Coverage (~80%)** робимо через **Flutter unit/widget/integration тести**.
- **Appium E2E** — невеликий набір критичних сценаріїв.

## 1.2 Мапа типів тестів (що покриває що)
- **Unit** → доменна логіка (use cases), валідація, мапінг
- **Widget** → UI-стани і композиція (loading/error/success)
- **Integration** → флоу всередині Flutter runtime
- **Appium E2E** → end-to-end smoke/regression по екранах + девайсні взаємодії

---

# 2) Готовність середовища (Preflight)
Найчастіша причина зриву темпу — environment setup.

## 2.1 Preflight чекліст
- `testing/PREFLIGHT_WEEK0_UA.md`
- `testing/PREFLIGHT_WEEK0_EN.md`

## 2.2 Рекомендовані pinned версії
- Flutter SDK: **3.24.3** (stable) через FVM
- Appium: **2.11.4**
- Node: **22.x**
- Java: **Temurin 17**
- Android SDK: platform **34**, build-tools **34.0.0**

Артефакти:
- preflight файли
- (далі) `.nvmrc`, `fvm_config.json` для фіксації версій

---

# 3) Архітектура апки та контракт тестованості
Апка має бути тестованою «за дизайном».

## 3.1 Clean Architecture
- presentation / domain / data
- фічі рознесені і зрозумілі новачкам

## 3.2 Стратегія Keys (контракт тестованості)
Стабільні локатори = `ValueKey`.

Правила:
- keys централізовані (без випадкових строк)
- схема неймінгу стабільна: `screen.<screenName>.<element>`

Артефакт:
- `app/lib/core/testing/keys.dart`

## 3.3 Мінімальний набір keys (must-have)
- Login: email/password/submit
- CRUD: create/list item/editor/save/delete

---

# 4) Навчальні модулі (контент для QA)
Модулі лежать у `learn/` і містять:
- README з outcomes
- вправи з acceptance criteria
- exit tickets (вимірюване завершення)

Артефакти:
- `learn/module-01-dart-flutter-basics/*`
- `learn/module-02-training-app/*`
- `learn/module-03-test-framework/*`
- `learn/module-04-advanced/*`

---

# 5) Test Data Management (seed/reset)
E2E має стартувати з передбачуваного стану.

## 5.1 Рекомендований підхід
**In-memory репозиторій + reset hook + debug-only дії**.

## 5.2 Варіанти точки входу
- Debug menu (зручно для навчання)
- Deep-link/route команди (зручно для автоматизації)
- Method channel (advanced)

Артефакти:
- `testing/TEST_DATA_SEEDING_UA.md`
- `testing/TEST_DATA_SEEDING_EN.md`

---

# 6) E2E фреймворк (Appium + appium-flutter-driver)
E2E знаходиться у:
- `testing/e2e_appium/`

## 6.1 Що будуємо
- Appium setup docs
- capabilities конфіг
- Page Objects
- fixtures (test users, seeded entities)
- suites: login, CRUD, 20+ steps сценарій

Артефакти:
- `testing/e2e_appium/README.md`
- `testing/e2e_appium/docs/appium-setup.md`

---

# 7) Стабільність E2E (синхронізація)
Флейки найчастіше через таймінги (анімації, async rebuilds, navigation).

Правила:
- без `sleep()` за замовчуванням
- після кожної дії — стабільний асерт
- retries з малим backoff замість довгих фіксованих очікувань

Артефакт:
- `testing/e2e_appium/docs/synchronization.md`

---

# 8) CI стратегія (always vs optional)
CI має бути зеленим «з коробки».

## 8.1 Always pipeline
- format/lint
- unit/widget тести
- coverage + поріг

## 8.2 Optional pipeline
- Appium E2E на self-hosted runner

Артефакти:
- `testing/CI_STRATEGY_UA.md`
- `testing/CI_STRATEGY_EN.md`

---

# 9) Definition of Ready (DoR) для першого E2E
Перед першим Appium E2E тестом перевір:
- мінімальні keys
- test user
- seed/reset
- debug build
- emulator/device

Артефакти:
- `testing/E2E_WEEK2_DEFINITION_OF_READY_UA.md`
- `testing/E2E_WEEK2_DEFINITION_OF_READY_EN.md`

---

# 10) Вимірюване завершення (Exit tickets)
Кожен модуль має exit ticket.

Артефакти:
- `learn/module-01-dart-flutter-basics/EXIT_TICKET.md`
- `learn/module-02-training-app/EXIT_TICKET.md`
- `learn/module-03-test-framework/EXIT_TICKET.md`
- `learn/module-04-advanced/EXIT_TICKET.md`
