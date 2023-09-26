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
      body: Container(
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('assets/images/night.jpeg'),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'Title',
                hintStyle: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(color: Colors.grey),
              ),
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            QuillToolbar.basic(
              controller: _quillController,
              showFontFamily: false,
              showSubscript: false,
              showSuperscript: false,
              showInlineCode: false,
              showCodeBlock: false,
              showSearchButton: false,
            ),
            Expanded(
              child: QuillEditor(
                controller: _quillController,
                focusNode: FocusNode(),
                scrollController: ScrollController(),
                scrollable: true,
                padding: EdgeInsets.zero,
                autoFocus: false,
                readOnly: false,
                expands: false,
              ),
            ),
          ].expand((e) => [e, const SizedBox(height: 8)]).toList(),
        ),
      ),
    );
  }
}
