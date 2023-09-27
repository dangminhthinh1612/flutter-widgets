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

  Note getById(String id) => _noteList.firstWhere((note) => note.id == id);

  void add(Note note) {
    _noteList.add(note);

    notifyListeners();
  }

  void update(Note note) {
    int index = _noteList.indexWhere((element) => element.id == note.id);
    if (index != -1) {
      _noteList[index].title = note.title;
      _noteList[index].content = note.content;
    }

    notifyListeners();
  }
}
