import 'package:flutter/material.dart';

class ListNote extends StatefulWidget {
  const ListNote({super.key});

  @override
  State<ListNote> createState() => _ListNoteState();
}

class _ListNoteState extends State<ListNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Text('List'),
    );
  }
}
