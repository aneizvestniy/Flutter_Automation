/// Centralized `ValueKey` registry for the training app.
///
/// Why this exists:
/// - Flutter UI does not have a DOM, so stable automation locators come from Keys.
/// - Putting keys inline everywhere leads to typos, duplicates, and unstable tests.
/// - A single registry becomes a *testability contract* between app code and tests.
///
/// Convention:
/// - `screen.<screenName>.<element>`
/// - Keep names stable. If you rename a key, you must update:
///   - widget code
///   - integration/widget tests
///   - Appium E2E page objects
///
/// Example:
/// `AppKeys.screenLoginEmail` -> ValueKey('screen.login.email')
///
/// Note:
/// We use `ValueKey<String>` because it is the most common pattern for flutter finders.
///
/// Usage in widgets:
/// ```dart
/// TextField(
///   key: AppKeys.screenLoginEmail,
/// )
/// ```
library app_keys;

import 'package:flutter/widgets.dart';

abstract final class AppKeys {
  // ---- Login ----
  static const screenLoginEmail = ValueKey<String>('screen.login.email');
  static const screenLoginPassword = ValueKey<String>('screen.login.password');
  static const screenLoginSubmit = ValueKey<String>('screen.login.submit');

  // ---- Notes (CRUD) ----
  static const screenNotesCreate = ValueKey<String>('screen.notes.create');
  static const screenNotesList = ValueKey<String>('screen.notes.list');
  static ValueKey<String> notesListItem(String id) => ValueKey<String>('screen.notes.item.$id');

  static const screenNoteEditorTitle = ValueKey<String>('screen.noteEditor.title');
  static const screenNoteEditorBody = ValueKey<String>('screen.noteEditor.body');
  static const screenNoteEditorSave = ValueKey<String>('screen.noteEditor.save');
  static const screenNoteEditorDelete = ValueKey<String>('screen.noteEditor.delete');

  // ---- Common ----
  static const commonSnackbar = ValueKey<String>('common.snackbar');
}
