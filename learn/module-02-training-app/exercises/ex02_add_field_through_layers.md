# Exercise 02 — Add a field through Clean Architecture layers

## Goal
Practice navigating Flutter app structure by implementing a small feature change end-to-end.

## Task (Notes example)
Add a new field `priority` to Notes.

1) Domain layer:
   - Update entity/model
   - Update use case(s)

2) Data layer:
   - Update DTO/mapping
   - Update repository implementation

3) Presentation layer:
   - Update UI (editor form)
   - Update validation and display

## Acceptance criteria
- Field is visible and editable in UI.
- Unit tests updated/added for mapping + validation.
- Widget test updated/added for editor screen.
