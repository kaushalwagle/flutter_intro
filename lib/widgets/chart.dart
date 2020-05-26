import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  double get getTotalSpending {
    return groupedTransactionValues.fold(
        0.0, (sum, itm) => sum + itm['amount']);
  }

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (DateFormat.yMMMd().format(recentTransactions[i].date) ==
            DateFormat.yMMMd().format(weekDay)) {
          totalSum += recentTransactions[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    }).reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues
              .map((gTx) => Flexible(
                    fit: FlexFit.tight,
                    child: ChartBar(
                      label: gTx['day'],
                      spendingAmount: gTx['amount'],
                      spendingPctOfTotal: getTotalSpending <= 0.0
                          ? 0.0
                          : (gTx['amount'] as double) / getTotalSpending,
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
