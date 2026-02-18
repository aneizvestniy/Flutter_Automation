import '../domain/note.dart';
import '../domain/notes_repository.dart';

/// In-memory NotesRepository.
///
/// Why:
/// - deterministic for training
/// - supports reset/seed for E2E stability
class InMemoryNotesRepository implements NotesRepository {
  final Map<String, Note> _store = {};

  int _idCounter = 0;

  String _nextId() {
    _idCounter++;
    return _idCounter.toString();
  }

  @override
  Future<List<Note>> list() async {
    // Keep ordering stable and predictable.
    final notes = _store.values.toList()..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    return notes;
  }

  @override
  Future<Note?> getById(String id) async {
    return _store[id];
  }

  @override
  Future<Note> create({required String title, required String body}) async {
    final now = DateTime.now();
    final note = Note(id: _nextId(), title: title.trim(), body: body.trim(), updatedAt: now);
    _store[note.id] = note;
    return note;
  }

  @override
  Future<Note> update({required String id, required String title, required String body}) async {
    final existing = _store[id];
    if (existing == null) {
      throw StateError('Note not found: $id');
    }
    final updated = existing.copyWith(title: title.trim(), body: body.trim(), updatedAt: DateTime.now());
    _store[id] = updated;
    return updated;
  }

  @override
  Future<void> delete(String id) async {
    _store.remove(id);
  }

  @override
  Future<void> reset() async {
    _store.clear();
    _idCounter = 0;
  }

  @override
  Future<void> seedDemo({int count = 3}) async {
    await reset();
    for (var i = 1; i <= count; i++) {
      await create(title: 'Note $i', body: 'Seeded note body #$i');
    }
  }
}
