import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/note/note.dart';
import 'package:flutter_application_1/providers/note/note_notifier.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:provider/provider.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  bool condit(Note item, String query) =>
      item.title.toLowerCase().contains(query.toLowerCase()) ||
      Document.fromJson(jsonDecode(item.content))
          .toPlainText()
          .toLowerCase()
          .contains(query.toLowerCase());

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Note> data = Provider.of<NoteNotifier>(context).noteList;

    List<Note> results = data.where((item) => condit(item, query)).toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(results[index].title),
            subtitle: Text(DateTime.now().toString()),
            onTap: () => close(context, results[index].id),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Note> data = Provider.of<NoteNotifier>(context).noteList;

    List<Note> suggestions = data.where((item) => condit(item, query)).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(suggestions[index].title),
            subtitle: Text(DateTime.now().toString()),
            onTap: () => close(context, suggestions[index].id),
          ),
        );
      },
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.white),
      ),
    );
  }
}
