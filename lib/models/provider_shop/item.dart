import 'package:flutter/material.dart';

@immutable
class Item {
  final int id;
  final String name;
  final int price = 42;

  const Item(this.id, this.name);

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}
