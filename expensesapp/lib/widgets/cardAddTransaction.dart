import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTransation extends StatefulWidget {
  const AddTransation({super.key, required this.onpressed});
  final Function onpressed;

  @override
  State<AddTransation> createState() => _AddTransationState();
}

class _AddTransationState extends State<AddTransation> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  DateTime? selectedData;
  void addTransaction() {
    if (amountController.text.isEmpty) {
      return;
    }
    final entertedTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (entertedTitle.isEmpty || enteredAmount <= 0 || selectedData == null) {
      return;
    }
    widget.onpressed(entertedTitle, enteredAmount, selectedData);
    Navigator.of(context).pop();
  }

  void presentDatePicker() {
    showDatePicker(
      context: context,
      firstDate: DateTime(2010),
      lastDate: DateTime(2050),
      initialDate: DateTime.now(),
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        selectedData = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 3, // Add elevation for a shadow effect
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), // Rounded corners
          side: BorderSide(color: Colors.grey[300]!), // Add border
        ),
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: 'Title',
                  border: OutlineInputBorder(), // Add border to text field
                  contentPadding: EdgeInsets.all(10),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                onSubmitted: (_) => addTransaction,
                keyboardType: TextInputType.number,
                controller: amountController,
                decoration: InputDecoration(
                  hintText: 'Amount',
                  border: OutlineInputBorder(), // Add border
                  contentPadding: EdgeInsets.all(10),
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      selectedData == null
                          ? 'No Date Chosen'
                          : DateFormat.yMd().format(selectedData!),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: presentDatePicker,
                    child: Text(
                      'Choose Date',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: addTransaction,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Theme.of(context).primaryColor, // Use theme color
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                ),
                child: Text(
                  'Add Transaction',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Text color
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
