import 'package:flutter/material.dart';

@immutable
class Note {
  final String title;
  final String content;

  const Note({String? title, required this.content}) : title = title ?? '';
}
