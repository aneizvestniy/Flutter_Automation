import 'package:flutter/foundation.dart';

import '../domain/note.dart';
import '../domain/notes_repository.dart';

/// NotesController holds list state for Notes screens.
///
/// This is intentionally simple state management for training.
class NotesController extends ChangeNotifier {
  NotesController(this._repo);

  final NotesRepository _repo;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  List<Note> _notes = const [];
  List<Note> get notes => _notes;

  Future<void> load() async {
    _error = null;
    _isLoading = true;
    notifyListeners();

    try {
      _notes = await _repo.list();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> create({required String title, required String body}) async {
    await _repo.create(title: title, body: body);
    await load();
  }

  Future<void> update({required String id, required String title, required String body}) async {
    await _repo.update(id: id, title: title, body: body);
    await load();
  }

  Future<void> delete(String id) async {
    await _repo.delete(id);
    await load();
  }

  Future<void> resetAndSeed({int count = 3}) async {
    await _repo.seedDemo(count: count);
    await load();
  }

  Future<Note?> getById(String id) => _repo.getById(id);
}