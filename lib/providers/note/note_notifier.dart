import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/note/note.dart';
import 'package:flutter_quill/flutter_quill.dart';

class NoteNotifier extends ChangeNotifier {
  final List<Note> _noteList = [];

  List<Note> get noteList => _noteList;

  List<QuillController> get noteControllerList => _noteList
      .map(
        (note) => QuillController(
          document: Document.fromJson(jsonDecode(note.content)),
          selection: const TextSelection.collapsed(offset: 0),
        ),
      )
      .toList();

  void add(Note note) {
    _noteList.add(note);

    notifyListeners();
  }
}
