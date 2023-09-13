import "package:flutter/material.dart";

@immutable
class Category {
  final int id;
  final String name;
  final Icon iconWidget;

  const Category({
    required this.id,
    required this.name,
    required this.iconWidget,
  });

  @override
  get hashCode => id;

  @override
  bool operator ==(Object other) {
    return other is Category && other.id == id;
  }
}
