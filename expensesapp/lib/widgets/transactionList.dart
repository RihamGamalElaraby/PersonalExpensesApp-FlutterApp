import 'package:expensesapp/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  // final List<Transaction> transations = [
  //   Transaction(
  //     id: '1',
  //     amount: 60,
  //     date: DateTime.now(),
  //     title: 'new shirt',
  //   ),
  //   Transaction(
  //     id: '2',
  //     amount: 80.00,
  //     date: DateTime.now(),
  //     title: 'new shirt',
  //   )
  // ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions
          .map((tx) => Card(
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black,
                            width: 2,
                            style: BorderStyle.solid),
                        // color: Colors.yellow,
                      ),
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: Text(
                        '\$${tx.amount.toString()}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tx.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: const Color.fromARGB(255, 35, 35, 35)),
                        ),
                        Text(
                          DateFormat('yyyy-MM-dd').format(tx.date),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.grey),
                        ),
                      ],
                    )
                  ],
                ),
              ))
          .toList(),
    );
  }
}
