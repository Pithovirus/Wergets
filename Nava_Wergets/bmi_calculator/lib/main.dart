import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BMI Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _weight = 60.0;
  final TextEditingController _heightController = TextEditingController();
  double _bmi = 0;

  String _bmiCategory = '';

  void _calculateBMI() {
    double heightInCm = double.tryParse(_heightController.text) ?? 0;
    double heightInMeters = heightInCm / 100;

    if (heightInMeters > 0) {
      setState(() {
        _bmi = _weight / (heightInMeters * heightInMeters);
        _bmiCategory = _getBMICategory(_bmi);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid height!')),
      );
    }
  }

  String _getBMICategory(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'Normal weight';
    } else if (bmi >= 25 && bmi < 29.9) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Weight: ${_weight.toStringAsFixed(1)} kg',
              style: const TextStyle(fontSize: 20),
            ),
            Slider(
              value: _weight,
              min: 30.0,
              max: 150.0,
              divisions: 240,
              label: _weight.toStringAsFixed(1),
              onChanged: (value) {
                setState(() {
                  _weight = value;
                });
              },
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text('Height (cm)'),
                labelStyle: TextStyle(fontFamily: 'Poppins'),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateBMI,
              child: const Text('Calculate BMI',
                  style: TextStyle(fontFamily: 'Poppins')),
            ),
            const SizedBox(height: 20),
            Text(
              _bmi == 0
                  ? 'Enter your height and weight'
                  : 'Your BMI is: ${_bmi.toStringAsFixed(2)}\nCategory: $_bmiCategory',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
