import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/routing/routes.dart';
import '../../../core/testing/keys.dart';
import '../../auth/presentation/auth_controller.dart';
import 'notes_controller.dart';

class NotesListScreen extends StatefulWidget {
  const NotesListScreen({super.key});

  @override
  State<NotesListScreen> createState() => _NotesListScreenState();
}

class _NotesListScreenState extends State<NotesListScreen> {
  @override
  void initState() {
    super.initState();
    // Load notes as soon as screen opens.
    // In tests, we assert that loading ends and list/empty state appears.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      context.read<NotesController>().load();
    });
  }

  @override
  Widget build(BuildContext context) {
    final notesCtrl = context.watch<NotesController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        actions: [
          IconButton(
            tooltip: 'Logout',
            onPressed: () async {
              await context.read<AuthController>().logout();
              if (!context.mounted) return;
              Navigator.of(context).pushReplacementNamed(Routes.login);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        key: AppKeys.screenNotesCreate,
        onPressed: () => Navigator.of(context).pushNamed(Routes.noteEditor),
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: _buildBody(notesCtrl),
      ),
    );
  }

  Widget _buildBody(NotesController ctrl) {
    if (ctrl.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (ctrl.error != null) {
      return Center(
        child: Text(
          'Error: ${ctrl.error}',
          style: const TextStyle(color: Colors.red),
        ),
      );
    }

    if (ctrl.notes.isEmpty) {
      return const Center(child: Text('No notes yet. Tap + to create.'));
    }

    return ListView.builder(
      key: AppKeys.screenNotesList,
      itemCount: ctrl.notes.length,
      itemBuilder: (ctx, i) {
        final note = ctrl.notes[i];
        return Card(
          child: ListTile(
            key: AppKeys.notesListItem(note.id),
            title: Text(note.title),
            subtitle: Text(note.body, maxLines: 1, overflow: TextOverflow.ellipsis),
            onTap: () => Navigator.of(ctx).pushNamed(
              Routes.noteEditor,
              arguments: note.id,
            ),
          ),
        );
      },
    );
  }
}
