import 'package:flutter/material.dart';

import './transaction_list.dart';
import './new_transaction.dart';

import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 'T1',
      title: 'Grocery',
      amount: 90.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'T2',
      title: 'Brake Pads',
      amount: 48.65,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction({@required String title, @required double amount}) {
    final newTx = Transaction(
      title: title,
      amount: amount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
