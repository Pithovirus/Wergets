import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0;  // State Management

  void _incrementCounter() {
    setState(() {
      _counter++;  // Updates the counter
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Determine text color based on counter value
    Color textColor;
    if (_counter > 0) {
      textColor = Colors.green;
    } else if (_counter < 0) {
      textColor = Colors.red;
    } else {
      textColor = Colors.black; // Default color for zero
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Current Count:',
              style: Theme.of(context).textTheme.headline5,  // Styling
            ),
            Text(
              '$_counter',  // Display state value
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.headline2!.fontSize,
                color: textColor,  // Set text color based on the value
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _decrementCounter,  // Gesture detection
                  child: Text('Decrement'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _incrementCounter,  // Gesture detection
                  child: Text('Increment'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
