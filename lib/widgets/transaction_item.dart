
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  final Transaction _transaction;
  final Function _txDeleteHandler;

  const TransactionItem(
    Key key,
    this._transaction,
    this._txDeleteHandler,
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(
              child: Text(
                '\$${_transaction.amount.toStringAsFixed(2)}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          _transaction.title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        subtitle: Text(
          DateFormat.yMMMMd().format(_transaction.date),
          style: Theme.of(context).textTheme.caption,
        ),
        trailing: GestureDetector(
          onTap: () => _txDeleteHandler(_transaction.id),
          child: Icon(Icons.delete,color: Colors.red.shade500,),

        ),
      ),
    );
  }
}
