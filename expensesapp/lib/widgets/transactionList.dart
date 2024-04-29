import 'package:expensesapp/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deletxTx;
  const TransactionList(this.transactions, this.deletxTx);
  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constrains) {
            return Column(
              children: [
                const Text(
                  'No transactions added yet!',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: constrains.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(vertical: 9, horizontal: 5),
                child: ListTile(
                  leading: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        shape: BoxShape.circle),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: FittedBox(
                        child: Text(
                          '\$${transactions[index].amount.toStringAsFixed(2)}',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    transactions[index].title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromARGB(255, 35, 35, 35),
                    ),
                  ),
                  subtitle: Text(
                    DateFormat('yyyy-MM-dd')
                        .format(transactions[index].date), // Corrected line
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  trailing: MediaQuery.of(context).size.width > 460
                      ? ElevatedButton.icon(
                          onPressed: () {
                            deletxTx(transactions[index].id);
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Theme.of(context).errorColor,
                          ),
                          label: Text(
                            'Delete',
                            style: TextStyle(color: Colors.red),
                          ))
                      : IconButton(
                          icon: Icon(Icons.delete),
                          color: Theme.of(context).errorColor,
                          onPressed: () {
                            deletxTx(transactions[index].id);
                          },
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
          );
  }
}
