import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class NoteHome extends StatelessWidget {
  const NoteHome({super.key});

  @override
  Widget build(BuildContext context) {
    QuillController controller = QuillController.basic();

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
          )
        ],
      ),
    );
  }
}
