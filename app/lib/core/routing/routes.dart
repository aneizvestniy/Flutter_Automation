/// Centralized route names.
///
/// Why:
/// - test code (including E2E) often needs to know where to navigate.
/// - route names should be stable and easy to search.
abstract final class Routes {
  static const login = '/login';
  static const notes = '/notes';
  static const noteEditor = '/note-editor';
  static const debug = '/debug';
}
