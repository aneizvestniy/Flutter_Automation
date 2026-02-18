import 'note.dart';

/// NotesRepository describes CRUD operations.
abstract class NotesRepository {
  Future<List<Note>> list();
  Future<Note?> getById(String id);
  Future<Note> create({required String title, required String body});
  Future<Note> update({required String id, required String title, required String body});
  Future<void> delete(String id);

  /// Debug-only helpers for deterministic testing.
  Future<void> reset();
  Future<void> seedDemo({int count = 3});
}
