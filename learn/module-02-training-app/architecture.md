# Training App Architecture (Clean Architecture) — EN

## Why Clean Architecture in a training repo
QA engineers new to Flutter often struggle to find:
- where UI lives
- where business logic lives
- where data comes from

Clean Architecture provides a predictable map.

---

## Layers (simple mental model)

### Presentation
- Widgets, screens, UI state
- Input validation feedback
- Navigation

### Domain
- Entities (pure data)
- Use cases (business rules)
- Interfaces (repositories)

### Data
- Repository implementations
- Data sources (in-memory for training, later API/local storage)
- DTO mapping

---

## Suggested folder layout
```text
app/lib/
  core/
    testing/            # keys.dart and other testability helpers
    errors/
    routing/
    widgets/
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

---

## QA-focused best practices we enforce
1) **Keys are a contract**
- use `AppKeys` constants, never ad-hoc strings

2) **Predictable UI states**
Every screen has explicit states:
- loading
- error
- empty
- success

3) **Deterministic test data**
- debug-only seed/reset

---

## Acceptance criteria for this module
- Learner can explain where to add:
  - a new screen
  - a new use case
  - a new repository method
- Learner can identify keys used by automation
