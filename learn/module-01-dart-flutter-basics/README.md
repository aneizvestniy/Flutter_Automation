# Module 01 — Dart & Flutter Basics (Week 1)

## Target audience
QA engineers (2+ years) who are new to Flutter.

## Outcomes (measurable)
- Explain **Widget Tree** and how Flutter renders UI.
- Explain **Stateless vs Stateful** widgets.
- Use **Keys** (`ValueKey`) to create stable selectors for automation.
- Navigate **Flutter DevTools** (Widget Inspector) to locate elements.

## Deliverables in this module
- `exercises/` — hands-on tasks with acceptance criteria
- `examples/` — small runnable demos (optional at the scaffold stage)

## Why this matters for automation
Flutter UI does not have a DOM. The most stable locator strategy is:
1) put `ValueKey` on test-critical widgets
2) use Flutter finders: `find.byValueKey`, `find.text`, `find.byType`

## Checklist
- [ ] Read the DevTools guide
- [ ] Complete `exercises/ex01_keys.md`
- [ ] Complete `exercises/ex02_widget_tree.md`
- [ ] Complete `exercises/ex03_state.md`
