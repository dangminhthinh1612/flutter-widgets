import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/models/transaction.dart';

class TransactionProvider extends ChangeNotifier {
  // TODO: Init list without empty array.
  final List<Transaction> _transactionList = [];

  List<Transaction> get transactionList => _transactionList;

  void add(Transaction transaction) {
    _transactionList.add(transaction);

    notifyListeners();
  }
}
