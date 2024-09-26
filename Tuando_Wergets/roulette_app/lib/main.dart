import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(RouletteApp());
}

class RouletteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Number Roulette'),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: RouletteScreen(),
      ),
    );
  }
}

class RouletteScreen extends StatefulWidget {
  @override
  _RouletteScreenState createState() => _RouletteScreenState();
}

class _RouletteScreenState extends State<RouletteScreen> {
  int selectedNumber = 0;

  void spinRoulette() {
    setState(() {
      selectedNumber = Random().nextInt(15) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black, width: 4),
            ),
            child: Center(
              child: Text(
                selectedNumber > 0 ? selectedNumber.toString() : 'Spin!',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: spinRoulette,
            child: Text('Spin'),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16), backgroundColor: Colors.lightBlueAccent,
              textStyle: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
