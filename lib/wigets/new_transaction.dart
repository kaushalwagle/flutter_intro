import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function _addTxHandler;

  NewTransaction(this._addTxHandler);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              //onChanged: (value){titleInput =value;},
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              //onChanged: (value) => amountInput=value,
            ),
            FlatButton(
              child: Text('Add Transaction'),
              onPressed: () => _addTxHandler(
                title: titleController.text,
                amount: double.parse(amountController.text),
              ),
              textColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
