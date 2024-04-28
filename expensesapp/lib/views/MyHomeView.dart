import 'package:expensesapp/models/transaction.dart';
// import 'package:expensesapp/widgets/add_transaction.dart';
import 'package:expensesapp/widgets/cardAddTransaction.dart';
import 'package:expensesapp/widgets/chart.dart';
import 'package:expensesapp/widgets/transactionList.dart';
import 'package:flutter/material.dart';

class MyHomeView extends StatefulWidget {
  const MyHomeView({super.key});

  @override
  _MyHomeViewState createState() => _MyHomeViewState();
}

class _MyHomeViewState extends State<MyHomeView> {
  final List<Transaction> transactions = [
    // Transaction(
    //   id: '1',
    //   amount: 60,
    //   date: DateTime.now(),
    //   title: 'new shirt',
    // ),
    // Transaction(
    //   id: '2',
    //   amount: 80.00,
    //   date: DateTime.now(),
    //   title: 'new shirt',
    // ),
  ];

  void _addNewTransaction(String title, double amount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      amount: amount,
      date: DateTime.now(),
      title: title,
    );

    setState(() {
      transactions.add(newTx);
    });
  }

  List<Transaction> get recentTransaction {
    return transactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList(); // Convert Iterable to List
  }

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (bcontext) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: AddTransation(
            onpressed: _addNewTransaction,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'My Expenses',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () => _startAddNewTransaction(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Chart(recentTransation: recentTransaction),
            TransactionList(transactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
