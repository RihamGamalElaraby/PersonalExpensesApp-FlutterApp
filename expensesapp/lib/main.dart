import 'package:expensesapp/views/MyHomeView.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses App',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          fontFamily: 'Quicksand',
          buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary)),
      home: const MyHomeView(),
    );
  }
}
