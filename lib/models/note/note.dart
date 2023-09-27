class Note {
  final String id;
  String title;
  String content;

  Note({required this.id, String? title, required this.content})
      : title = title ?? '';
}
