import 'package:flutter/material.dart';

class AddTransation extends StatefulWidget {
  AddTransation({super.key, required this.onpressed});
  final Function onpressed;

  @override
  State<AddTransation> createState() => _AddTransationState();
}

class _AddTransationState extends State<AddTransation> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void addTransaction() {
    final entertedTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (entertedTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.onpressed(entertedTitle, enteredAmount);
    Navigator.of(context).pop();
  }

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
              onSubmitted: (_) => addTransaction,
              keyboardType: TextInputType.number,
              controller: amountController,
              decoration: InputDecoration(hintText: 'Amount'),
            ),
            TextButton(
              onPressed: addTransaction,
              child: Text('Add Transaction'),
            )
          ],
        ),
      ),
    );
  }
}
