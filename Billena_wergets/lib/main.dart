import 'package:flutter/material.dart';
import 'package:wergets/images/image_class.dart'; // Custom class I made to make it easy to modify the images

void main() {
  runApp(const WergetsApp());
}

class WergetsApp extends StatelessWidget{
  const WergetsApp({super.key});

  // Building the main widget as the root
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Wergets App",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true
      ),
      home: const WergetsHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

/// A stateless widget that represents the home page of the Wergets application.
/// 
/// This widget serves as a simple wrapper around the `MyWergetsHomePage`
/// stateful widget, passing a title to it.
class WergetsHomePage extends StatelessWidget {
  const WergetsHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyWergetsHomePage(title: 'Wergets');
  }
}

/// A stateful widget that represents the main home page of the Wergets application.
/// 
/// This widget takes a `title` parameter which is displayed as the title of the page.
class MyWergetsHomePage extends StatefulWidget {
  const MyWergetsHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyWergetsHomePage> createState() => _MyWergetsHomePageState();
}

// Extends the homepage to be able to modify the state
class _MyWergetsHomePageState extends State<MyWergetsHomePage>{
  int _counter = 0;
  final List _imageList = [ImageClass.business, ImageClass.delivery, ImageClass.happy, ImageClass.sad, ImageClass.logo];

  void _changeImage(){ 
    setState(() {
      _counter = (_counter + 1) % _imageList.length; // Cycles through the image logic by using the length as the stopper to avoid overflow.
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: Image.asset(ImageClass.logo),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget> [
            Image(
              image: AssetImage(_imageList[_counter]), // Using an array, I can cycle through the images stored in the image_class which I predefined.
              fit: BoxFit.contain,
              )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeImage,
        child: const Icon(Icons.rotate_90_degrees_ccw_rounded), // the icon looks cool, why not? 
        ),
    );
  }
}