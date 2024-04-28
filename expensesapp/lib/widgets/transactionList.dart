import 'package:expensesapp/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No transactions added yet!',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 9, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 50,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FittedBox(
                          child: Text(
                              '\$${transactions[index].amount.toStringAsFixed(2)}'),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: const Color.fromARGB(255, 35, 35, 35),
                      ),
                    ),
                    subtitle: Text(
                      DateFormat('yyyy-MM-dd')
                          .format(transactions[index].date), // Corrected line
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                );
                // Card(
                //   child: Row(
                //     children: [
                //       Container(
                //         padding: EdgeInsets.all(10),
                //         decoration: BoxDecoration(
                //           border: Border.all(
                //             color: Theme.of(context).primaryColor,
                //             width: 2,
                //             style: BorderStyle.solid,
                //           ),
                //         ),
                //         margin:
                //             EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                //         child: Text(
                //           '\$${transactions[index].amount.toStringAsFixed(2)}',
                //           style: TextStyle(
                //             fontWeight: FontWeight.bold,
                //             fontSize: 20,
                //             color: Colors.deepPurple,
                //           ),
                //         ),
                //       ),
                //       Column(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Text(
                //             transactions[index].title,
                // style: TextStyle(
                //   fontWeight: FontWeight.bold,
                //   fontSize: 16,
                //   color: const Color.fromARGB(255, 35, 35, 35),
                // ),
                //           ),
                // Text(
                //   DateFormat('yyyy-MM-dd').format(
                //       transactions[index].date), // Corrected line
                //   style: TextStyle(
                //     fontWeight: FontWeight.bold,
                //     fontSize: 16,
                //     color: Colors.grey,
                //   ),
                // ),
                //         ],
                //       )
                //     ],
                //   ),
                // );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
