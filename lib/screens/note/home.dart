import 'package:flutter/material.dart';

class NoteHome extends StatefulWidget {
  const NoteHome({super.key});

  @override
  State<NoteHome> createState() => _NoteHomeState();
}

class _NoteHomeState extends State<NoteHome> {
  TextEditingController _textEditingController;
  TextStyle _baseStyle;
  List<TextSpan> _textSpans;
  TextSpan _currentSpan;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _baseStyle = TextStyle();
    _textSpans = [];
    _currentSpan = TextSpan(style: _baseStyle, children: []);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _applyStyleToSelection(TextStyle style) {
    TextSelection selection = _textEditingController.selection;
    int start = selection.start;
    int end = selection.end;

    _currentSpan.children.add(
      TextSpan(
        text: _textEditingController.text.substring(start, end),
        style: style,
      ),
    );

    _textEditingController.text =
        _textEditingController.text.replaceRange(start, end, '');
    _textEditingController.text = _textEditingController.text
        .replaceRange(start, start, style.toString());

    _textEditingController.selection =
        TextSelection.collapsed(offset: start + style.toString().length);
  }

  void _toggleBold() {
    setState(() {
      TextStyle boldStyle = TextStyle(fontWeight: FontWeight.bold);
      _applyStyleToSelection(boldStyle);
    });
  }

  void _toggleItalic() {
    setState(() {
      TextStyle italicStyle = TextStyle(fontStyle: FontStyle.italic);
      _applyStyleToSelection(italicStyle);
    });
  }

  void _toggleUnderline() {
    setState(() {
      TextStyle underlineStyle =
          TextStyle(decoration: TextDecoration.underline);
      _applyStyleToSelection(underlineStyle);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Editor'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: TextField(
          controller: _textEditingController,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          style: _baseStyle,
          onChanged: (text) {
            setState(() {
              _textSpans = [];
              _textSpans.add(_currentSpan);
              _textSpans.add(TextSpan(text: text));
            });
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
          selectionControls: CustomTextSelectionControls(
            toggleBold: _toggleBold,
            toggleItalic: _toggleItalic,
            toggleUnderline: _toggleUnderline,
          ),
        ),
      ),
    );
  }
}

class CustomTextSelectionControls extends TextSelectionControls {
  final VoidCallback toggleBold;
  final VoidCallback toggleItalic;
  final VoidCallback toggleUnderline;

  CustomTextSelectionControls({
    required this.toggleBold,
    required this.toggleItalic,
    required this.toggleUnderline,
  });

  @override
  Widget buildToolbar(BuildContext context, TextSelectionDelegate delegate,
      Rect? globalEditableRegion, Offset? position) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: toggleBold,
            icon: Icon(Icons.format_bold),
          ),
          IconButton(
            onPressed: toggleItalic,
            icon: Icon(Icons.format_italic),
          ),
          IconButton(
            onPressed: toggleUnderline,
            icon: Icon(Icons.format_underline),
          ),
        ],
      ),
    );
  }

  @override
  TextSpan buildTextSpan(
      BuildContext context, TextStyle? baseStyle, List<TextSpan> children) {
    return TextSpan(style: baseStyle, children: children);
  }
}
