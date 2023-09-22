import 'package:flutter/material.dart';

@immutable
class Transaction {
  final double amount;
  final int categoryId;
  final DateTime date;
  final String note;

  const Transaction({
    required this.amount,
    required this.categoryId,
    required this.date,
    String? note,
  }) : note = note ?? '';
}
