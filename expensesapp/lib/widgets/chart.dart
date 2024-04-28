import 'package:expensesapp/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'chartBar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransation;

  List<Map<String, Object>> get groupedTransactionValue {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalsum = 0.0;
      for (var i = 0; i < recentTransation.length; i++) {
        if (recentTransation[i].date.day == weekDay.day &&
            recentTransation[i].date.month == weekDay.month &&
            recentTransation[i].date.year == weekDay.year) {
          totalsum = totalsum + recentTransation[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 2),
        'amount': totalsum,
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionValue.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  const Chart({super.key, required this.recentTransation});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: recentTransation.isEmpty
            ? Center(
                child: Text(
                  'No transactions added yet',
                  style: TextStyle(fontSize: 16),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: groupedTransactionValue.map((data) {
                  return Flexible(
                    fit: FlexFit.tight,
                    child: ChartBar(
                      label: data['day'] as String,
                      spendingAmount: data['amount'] as double,
                      spendingPctoftotal: totalSpending == 0.0
                          ? 0.0
                          : (data['amount'] as double) / totalSpending,
                      barColor: Theme.of(context).primaryColor,
                    ),
                  );
                }).toList(),
              ),
      ),
    );
  }
}
