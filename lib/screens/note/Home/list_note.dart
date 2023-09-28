import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/note/note_notifier.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ListNote extends StatefulWidget {
  const ListNote({super.key});

  @override
  State<ListNote> createState() => _ListNoteState();
}

class _ListNoteState extends State<ListNote> {
  ElevatedButton buttonDemo = ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
      minimumSize: Size.zero,
      padding: const EdgeInsets.only(right: 8, top: 8, bottom: 8, left: 8),
    ),
    child: const Text('Category 1'),
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: const BoxDecoration(
      //   image: DecorationImage(
      //     image: AssetImage('assets/images/night.jpeg'),
      //     fit: BoxFit.cover,
      //   ),
      // ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('All'),
                      ),
                      buttonDemo,
                      buttonDemo,
                      buttonDemo,
                      buttonDemo,
                      buttonDemo,
                    ]
                        .expand((item) => [item, const SizedBox(width: 8)])
                        .toList(),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.create_new_folder_rounded),
              ),
            ],
          ),
          Expanded(
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
                          context.go(
                            '/note/edit/${noteNotifier.noteList[index].id}',
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                noteNotifier.noteList[index].title,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                DateFormat.yMd().format(DateTime.now()),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      fontStyle: FontStyle.italic,
                                      color: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .color!
                                          .withOpacity(0.5),
                                    ),
                              ),
                              QuillEditor(
                                controller:
                                    noteNotifier.noteControllerList[index],
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
                                maxHeight: 100,
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
          ),
        ],
      ),
    );
  }
}
