import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/counter_screen.dart';

void main() {
  runApp(CounterApp());
}

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CounterApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: {
        '/counter': (context) => CounterScreen(),
      },
    );
  }
}
