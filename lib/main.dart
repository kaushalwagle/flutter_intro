import 'package:flutter/material.dart';

import './wigets/user_transactions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
//  String titleInput;
//  String amountInput;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              color: Colors.purpleAccent,
              child: Container(
                child: Text(
                  'CHART',
                  textAlign: TextAlign.center,
                ),
                width: double.infinity,
              ),
              elevation: 5,
            ),
            UserTransactions(),
          ],
        ),
      ),
    );
  }
}
