# Exercise 01 — Keys as test selectors

## Goal
Learn to use `ValueKey` to create stable selectors for automation.

## Task
1) Add `ValueKey` to **at least 10** test-critical widgets in the training app (later in Module 2):
   - email field
   - password field
   - login button
   - logout button
   - CRUD create button
   - list item tile
   - edit field
   - save button
   - delete button
   - snackbar/toast container (if used)

2) Define a naming convention.

## Suggested convention
- `screen.<screenName>.<element>`
- Examples:
  - `screen.login.email`
  - `screen.login.password`
  - `screen.notes.create`

## Acceptance criteria
- Keys are present in code.
- Keys are **unique** within a screen.
- Naming is consistent and documented in the app README.
