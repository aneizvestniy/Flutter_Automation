import 'package:flutter_test/flutter_test.dart';
import 'package:training_app/features/notes/data/in_memory_notes_repository.dart';

void main() {
  test('create/list returns notes in stable order (newest first)', () async {
    final repo = InMemoryNotesRepository();

    await repo.create(title: 'A', body: '1');
    await Future<void>.delayed(const Duration(milliseconds: 1));
    await repo.create(title: 'B', body: '2');

    final list = await repo.list();

    expect(list, hasLength(2));
    expect(list.first.title, 'B');
    expect(list.last.title, 'A');
  });

  test('update changes title/body and keeps same id', () async {
    final repo = InMemoryNotesRepository();
    final created = await repo.create(title: 'A', body: '1');

    final updated = await repo.update(id: created.id, title: 'A2', body: '2');

    expect(updated.id, created.id);
    expect(updated.title, 'A2');
    expect(updated.body, '2');
  });

  test('delete removes note', () async {
    final repo = InMemoryNotesRepository();
    final created = await repo.create(title: 'A', body: '1');

    await repo.delete(created.id);

    final list = await repo.list();
    expect(list, isEmpty);
  });

  test('seedDemo resets then creates N demo notes', () async {
    final repo = InMemoryNotesRepository();

    await repo.create(title: 'Old', body: 'Old');
    await repo.seedDemo(count: 3);

    final list = await repo.list();
    expect(list, hasLength(3));
    expect(list.map((n) => n.title), containsAll(['Note 1', 'Note 2', 'Note 3']));
  });
}
