import 'package:flutter/material.dart';

@immutable
class Category {
  final int id;
  final String name;
  final Icon iconWidget;
  final bool isOutCome;
  final int? parentId;

  const Category({
    this.parentId,
    required this.id,
    required this.name,
    required this.iconWidget,
    bool? isOutCome,
  }) : isOutCome = isOutCome ?? true;

  @override
  get hashCode => id;

  @override
  bool operator ==(Object other) {
    return other is Category && other.id == id;
  }
}
