import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;
  final Function _txDeleteHandeler;

  TransactionList(this._transactions, this._txDeleteHandeler);

  @override
  Widget build(BuildContext context) {
    return _transactions.isEmpty
        ? LayoutBuilder(
            builder: (cntx, constraints) {
              return Column(
                children: <Widget>[
                  Text(
                    'No Transactions added yet',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: constraints.maxHeight*0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            },
          )
        : ListView.builder(
            itemCount: _transactions.length,
            itemBuilder: (context, index) {
              return Slidable(
                key: Key(_transactions[index].id),
                actionPane: SlidableDrawerActionPane(),
                secondaryActions: <Widget>[
                  IconSlideAction(
                    caption: 'Delete',
                    color: Colors.red.shade300,
                    icon: Icons.delete,
                    closeOnTap: true,
                    onTap: () => _txDeleteHandeler(_transactions[index].id),
                  ),
                ],
                dismissal: SlidableDismissal(
                  onDismissed: (_) =>
                      _txDeleteHandeler(_transactions[index].id),
                  child: SlidableDrawerDismissal(),
                ),
                child: Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text(
                            '\$${_transactions[index].amount.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      _transactions[index].title,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMMd().format(_transactions[index].date),
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ),
                ),
              );
            },
          );
  }
}
