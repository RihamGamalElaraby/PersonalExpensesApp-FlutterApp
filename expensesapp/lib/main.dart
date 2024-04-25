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
        primarySwatch: Colors.deepPurple,

        // colorScheme: Colors.white,
        // useMaterial3: true,
      ),
      home: MyHomeView(),
    );
  }
}
