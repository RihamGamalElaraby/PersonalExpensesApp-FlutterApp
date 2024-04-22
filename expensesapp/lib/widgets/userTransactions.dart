import 'package:expensesapp/models/transaction.dart';
import 'package:expensesapp/widgets/cardAddTransaction.dart';
import 'package:expensesapp/widgets/transactionList.dart';
import 'package:flutter/material.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({super.key});

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
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
  void _addNewTranSation(String TXtitle, double TXamount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      amount: TXamount,
      date: DateTime.now(),
      title: TXtitle,
    );

    setState(() {
      transations.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddTransation(onpressed: _addNewTranSation),
        TransactionList(transations),
      ],
    );
  }
}
