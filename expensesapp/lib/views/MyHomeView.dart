import 'package:expensesapp/models/transaction.dart';
import 'package:flutter/material.dart';

class MyHomeView extends StatelessWidget {
  MyHomeView({super.key});
  final List<Transaction> transations = [
    Transaction(
      id: '1',
      amount: 60,
      date: DateTime.now(),
      title: 'new shirt',
    ),
    Transaction(
      id: '2',
      amount: 80.00,
      date: DateTime.now(),
      title: 'new shirt',
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('My Expenses'),
          ),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                child: Card(
                  color: Colors.blue,
                  elevation: 5,
                  child: Text('CHART!'),
                ),
              ),
              Column(
                children: transations
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
                                margin: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                child: Text(
                                  tx.amount.toString(),
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
                                        color: const Color.fromARGB(
                                            255, 35, 35, 35)),
                                  ),
                                  Text(
                                    tx.date.toString(),
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
              )
            ]));
  }
}
