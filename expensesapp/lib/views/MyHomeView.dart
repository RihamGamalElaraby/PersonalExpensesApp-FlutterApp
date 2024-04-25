import 'package:expensesapp/models/transaction.dart';
// import 'package:expensesapp/widgets/add_transaction.dart';
import 'package:expensesapp/widgets/cardAddTransaction.dart';
import 'package:expensesapp/widgets/transactionList.dart';
import 'package:flutter/material.dart';

class MyHomeView extends StatefulWidget {
  const MyHomeView({Key? key}) : super(key: key);

  @override
  _MyHomeViewState createState() => _MyHomeViewState();
}

class _MyHomeViewState extends State<MyHomeView> {
  final List<Transaction> transactions = [
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
    ),
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
        title: Text('My Expenses'),
        actions: [
          IconButton(
            onPressed: () => _startAddNewTransaction(context),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                // color: Colors.blue,
                elevation: 5,
                child: Text('CHART!'),
              ),
            ),
            TransactionList(transactions),
            // Column(
            //   children: transactions
            //       .map((tx) => Card(
            //             child: ListTile(
            //               leading: CircleAvatar(
            //                 child: FittedBox(
            //                   child: Text('\$${tx.amount}'),
            //                 ),
            //               ),
            //               title: Text(tx.title),
            //               subtitle: Text(
            //                 '${tx.date.day}/${tx.date.month}/${tx.date.year}',
            //               ),
            //             ),
            //           ))
            //       .toList(),
            // ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
