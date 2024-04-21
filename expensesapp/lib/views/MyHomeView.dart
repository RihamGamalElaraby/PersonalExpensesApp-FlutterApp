import 'package:flutter/material.dart';

class MyHomeView extends StatelessWidget {
  const MyHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('My Expenses'),
          ),
        ),
        body: Column(children: [
          Container(
            child: Card(
              color: Colors.blue,
              elevation: 5,
              child: Text('CHART!'),
            ),
          ),
          Card(
            child: Text('List of TX!'),
          )
        ]));
  }
}
