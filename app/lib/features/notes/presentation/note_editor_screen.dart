import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/testing/keys.dart';
import 'notes_controller.dart';

class NoteEditorScreen extends StatefulWidget {
  const NoteEditorScreen({super.key, this.noteId});

  final String? noteId;

  @override
  State<NoteEditorScreen> createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends State<NoteEditorScreen> {
  final _titleCtrl = TextEditingController();
  final _bodyCtrl = TextEditingController();

  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _loadIfEdit();
  }

  Future<void> _loadIfEdit() async {
    if (widget.noteId == null) return;

    setState(() => _loading = true);
    final note = await context.read<NotesController>().getById(widget.noteId!);
    if (!mounted) return;

    if (note != null) {
      _titleCtrl.text = note.title;
      _bodyCtrl.text = note.body;
    }

    setState(() => _loading = false);
  }

  @override
  void dispose() {
    _titleCtrl.dispose();
    _bodyCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ctrl = context.read<NotesController>();
    final isEdit = widget.noteId != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Edit note' : 'Create note'),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    key: AppKeys.screenNoteEditorTitle,
                    controller: _titleCtrl,
                    decoration: const InputDecoration(labelText: 'Title'),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    key: AppKeys.screenNoteEditorBody,
                    controller: _bodyCtrl,
                    maxLines: 4,
                    decoration: const InputDecoration(labelText: 'Body'),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    key: AppKeys.screenNoteEditorSave,
                    onPressed: () async {
                      final title = _titleCtrl.text.trim();
                      final body = _bodyCtrl.text.trim();

                      if (title.isEmpty) {
                        _showSnack(context, 'Title is required');
                        return;
                      }

                      if (isEdit) {
                        await ctrl.update(id: widget.noteId!, title: title, body: body);
                      } else {
                        await ctrl.create(title: title, body: body);
                      }

                      if (!context.mounted) return;
                      _showSnack(context, 'Saved');
                      Navigator.of(context).pop();
                    },
                    child: const Text('Save'),
                  ),
                  const SizedBox(height: 8),
                  if (isEdit)
                    OutlinedButton(
                      key: AppKeys.screenNoteEditorDelete,
                      style: OutlinedButton.styleFrom(foregroundColor: Colors.red),
                      onPressed: () async {
                        await ctrl.delete(widget.noteId!);
                        if (!context.mounted) return;
                        _showSnack(context, 'Deleted');
                        Navigator.of(context).pop();
                      },
                      child: const Text('Delete'),
                    ),
                ],
              ),
            ),
    );
  }

  void _showSnack(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        key: AppKeys.commonSnackbar,
        content: Text(message),
      ),
    );
  }
}
