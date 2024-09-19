import 'package:flutter/material.dart';
import 'dart:math';


void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: Center(
        child: RandomColorPalette(),
      ),
    ),
  ));
}

class RandomColorPalette extends StatefulWidget {
  const RandomColorPalette({Key? key}) : super(key: key);

  @override
  _RandomColorPaletteState createState() => _RandomColorPaletteState();
}

class _RandomColorPaletteState extends State<RandomColorPalette> {
  List<Color> colors = [];

  @override
  void initState() {
    super.initState();
    generateColors();
  }

  void generateColors() {
    colors = List.generate(5, (index) => Color.fromARGB(
      255,
      Random().nextInt(256),
      Random().nextInt(256),
      Random().nextInt(256),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return
 Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: colors.map((color) {
            return Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  color: color,
                ),
                const SizedBox(width: 8),
                Text(color.toString().substring(10, 16)),
              ],
            );
          }).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            generateColors();
          });
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}