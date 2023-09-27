import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/note/note_notifier.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:go_router/go_router.dart';
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
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/night.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Consumer<NoteNotifier>(
        builder: (context, noteNotifier, child) {
          return MasonryGridView.count(
            crossAxisCount: 2,
            itemCount: noteNotifier.noteList.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  onTap: () {
                    context.go('/note/edit/${noteNotifier.noteList[index].id}');
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          noteNotifier.noteList[index].title,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        QuillEditor(
                          controller: noteNotifier.noteControllerList[index],
                          focusNode: FocusNode(),
                          scrollController: ScrollController(),
                          scrollable: false,
                          padding: const EdgeInsets.all(0),
                          autoFocus: false,
                          readOnly: true,
                          expands: false,
                          showCursor: false,
                          enableInteractiveSelection: false,
                          enableSelectionToolbar: false,
                          minHeight: 100,
                          maxHeight: 300,
                        ),
                      ],
                    ),
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
