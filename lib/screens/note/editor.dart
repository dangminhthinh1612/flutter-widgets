import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/note/note.dart';
import 'package:flutter_application_1/providers/note/note_notifier.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class NoteEditor extends StatefulWidget {
  final String? noteId;

  const NoteEditor({super.key, this.noteId});

  @override
  State<NoteEditor> createState() => _NoteEditorState();
}

class _NoteEditorState extends State<NoteEditor> {
  late TextEditingController _titleController;
  late QuillController _quillController;
  late Note _currentNote;

  @override
  void initState() {
    super.initState();
    if (widget.noteId == null) {
      _titleController = TextEditingController();
      _quillController = QuillController.basic();
    } else {
      _currentNote = Provider.of<NoteNotifier>(context, listen: false)
          .getById(widget.noteId!);
      _titleController = TextEditingController(text: _currentNote.title);
      _quillController = QuillController(
        document: Document.fromJson(jsonDecode(_currentNote.content)),
        selection: const TextSelection.collapsed(offset: 0),
      );
    }
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
                if (widget.noteId == null) {
                  note.add(
                    Note(
                      id: DateFormat('yyMMddHHmmss').format(DateTime.now()),
                      content: content,
                      title: _titleController.text,
                    ),
                  );
                } else {
                  note.update(
                    Note(
                      id: widget.noteId!,
                      content: content,
                      title: _titleController.text,
                    ),
                  );
                }
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
