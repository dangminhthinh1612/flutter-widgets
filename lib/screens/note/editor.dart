import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class NoteEditor extends StatelessWidget {
  const NoteEditor({super.key});

  @override
  Widget build(BuildContext context) {
    final QuillController controller = QuillController.basic();

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          QuillToolbar.basic(controller: controller),
          Expanded(
            child: QuillEditor.basic(
              controller: controller,
              readOnly: false, // true for view only mode
            ),
          ),
        ],
      ),
    );
  }
}
