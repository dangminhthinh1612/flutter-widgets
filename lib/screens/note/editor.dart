import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/note/note.dart';
import 'package:flutter_application_1/providers/note/note_notifier.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:provider/provider.dart';

class NoteEditor extends StatefulWidget {
  const NoteEditor({super.key});

  @override
  State<NoteEditor> createState() => _NoteEditorState();
}

class _NoteEditorState extends State<NoteEditor> {
  late TextEditingController _titleController;
  late QuillController _quillController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _quillController = QuillController.basic();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _quillController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              var note = context.read<NoteNotifier>();
              final String content =
                  jsonEncode(_quillController.document.toDelta().toJson());

              if (content != '[{"insert":"\\n"}]') {
                note.add(Note(content: content, title: _titleController.text));
              }
              Navigator.pop(context);
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Column(
        children: [
          TextField(controller: _titleController),
          const SizedBox(height: 4),
          QuillToolbar.basic(controller: _quillController),
          Expanded(
            child: QuillEditor.basic(
              controller: _quillController,
              readOnly: false, // true for view only mode
            ),
          ),
        ],
      ),
    );
  }
}
