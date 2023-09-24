import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/transaction_provider.dart';
import 'package:provider/provider.dart';

class TransactionListScreen extends StatelessWidget {
  const TransactionListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var transactionProvider = context.watch<TransactionProvider>();

    return Center(
      child: ListView(
        children: transactionProvider.transactionList
            .map(
              (trans) => ListTile(
                title: Text(
                  trans.amount.toString(),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
