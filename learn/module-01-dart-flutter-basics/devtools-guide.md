# Flutter DevTools Guide (for QA)

## Why QA engineers should care
Flutter has no DOM. The closest thing to a DOM inspector is **DevTools → Widget Inspector**.

You will use it to:
- understand the **Widget Tree**
- confirm that `ValueKey`s are present (your future stable locators)
- debug layout/state issues

---

## 1) Open DevTools

### Option A — from IDE
- VS Code: **Dart: Open DevTools**
- Android Studio: **Flutter Inspector / Open DevTools**

### Option B — from terminal
When the app is running:
- press `v` in `flutter run` for verbose logs (optional)
- open DevTools using the URL that Flutter prints

---

## 2) Widget Inspector essentials

### 2.1 Select Widget Mode
Use the **Select Widget Mode** (crosshair) to click an element in the app.

What to look for:
- widget type (e.g., `TextField`, `ElevatedButton`)
- parents (layout widgets like `Row`, `Column`, `Padding`)
- whether the widget has a **Key**

### 2.2 "Why isn't my element findable?"
Common causes:
- no `ValueKey` on the widget (fix: add it via `app/lib/core/testing/keys.dart`)
- the widget is rendered conditionally (state not reached)
- the widget is inside a scrolling container (you need to scroll first)

---

## 3) Performance tab (basic)
For the training repo we care about:
- jank during animations
- slow screen transitions

You do NOT need to become a performance engineer. Just learn to spot obvious bottlenecks.

---

## 4) Quick QA workflow
1) Reproduce a UI state (e.g., login error)
2) Use inspector to locate the widget
3) Confirm `ValueKey` exists (or add it)
4) Decide the best finder strategy:
   - `find.byValueKey(...)` (preferred)
   - `find.text(...)`
   - `find.byType(...)` (last resort)

---

## Exit ticket link
- See `EXIT_TICKET.md`
