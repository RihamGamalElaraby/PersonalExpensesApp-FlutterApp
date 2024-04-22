import 'package:expensesapp/widgets/userTransactions.dart';
import 'package:flutter/material.dart';

class MyHomeView extends StatelessWidget {
  MyHomeView({super.key, this.amountInput, this.titleInput});

  String? titleInput;
  String? amountInput;
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
            UserTransactions(),
          ]),
    );
  }
}
