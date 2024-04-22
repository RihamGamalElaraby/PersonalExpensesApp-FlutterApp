import 'package:flutter/material.dart';

class AddTransation extends StatelessWidget {
  AddTransation({super.key, required this.onpressed});
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function onpressed;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(hintText: 'Title'),
            ),
            TextField(
              controller: amountController,
              decoration: InputDecoration(hintText: 'Amount'),
            ),
            TextButton(
              onPressed: () {
                onpressed(
                    titleController.text, double.parse(amountController.text));
              },
              child: Text('Add Transaction'),
            )
          ],
        ),
      ),
    );
  }
}
