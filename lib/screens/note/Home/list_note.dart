import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/note/note_notifier.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
      body: Consumer<NoteNotifier>(
        builder: (context, noteNotifier, child) {
          return MasonryGridView.count(
            crossAxisCount: 2, // Số cột của lưới
            itemCount: noteNotifier.noteList.length, // Số lượng ô trong lưới
            itemBuilder: (BuildContext context, int index) {
              return Card(
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  // borderRadius: BorderRadius.circular(8.0),
                  onTap: () {},
                  child: QuillEditor(
                    controller: noteNotifier.noteControllerList[index],
                    focusNode: FocusNode(),
                    scrollController: ScrollController(),
                    scrollable: true,
                    padding: const EdgeInsets.all(8),
                    autoFocus: false,
                    readOnly: true,
                    expands: false,
                    showCursor: false,
                    enableInteractiveSelection: false,
                    enableSelectionToolbar: false,
                    maxHeight: 200,
                  ),
                ),
              );
            },
            padding: const EdgeInsets.symmetric(horizontal: 4),
          );
        },
      ),
    );
  }
}
