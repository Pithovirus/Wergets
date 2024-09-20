import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:palette_generator/palette_generator.dart'; // this is to get the dominant color of the image
import 'dart:io'; // this is for file handling

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Picker and Analysis',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ImageInputPage(),
    );
  }
}

class ImageInputPage extends StatefulWidget {
  @override
  _ImageInputPageState createState() => _ImageInputPageState();
}

class _ImageInputPageState extends State<ImageInputPage> {
  File? _image; //store image here
  Color? _dominantColor; // store dominant colors here
  String _hexColor = ""; // store hex value of the dominant color here

  // this fuction is to pick the image from the gallery
  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(
        source: ImageSource
            .gallery); // this is where the image is picked from the gallery
    if (image != null) {
      setState(() {
        _image = File(image.path); // to display image by converting file
      });

      // this analyzes the image upon uploading it
      _analyzeImageColors(File(image.path));
    }
  }

  // this analyes what the dominant color of the image is
  Future<void> _analyzeImageColors(File imageFile) async {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(
      FileImage(
          imageFile), // pass the image file to the palette generator to display dominant value
    );

    setState(() {
      _dominantColor = paletteGenerator.dominantColor?.color ??
          Colors.white; // fetch the dominant color
      _hexColor = _dominantColor != null
          ? '#${_dominantColor!.value.toRadixString(16).padLeft(8, '0').substring(2)}'
          : ''; // fetch the hex value of the dominant color
    });
  }

  // logic for the remove button
  void _removeImage() {
    setState(() {
      _image = null; // removes image
      _dominantColor = null; // resets dominant color
      _hexColor = ""; // resets hex color
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Morki'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //REMOVE BUTTON HERE
            if (_image != null)
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
                child: ElevatedButton(
                  onPressed: _removeImage, // calls function to remove button
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Text(
                    'x',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            SizedBox(height: 20),
            // condition if there is no image selected
            _image == null
                ? Text('No image selected.')
                : SizedBox(
                    height: MediaQuery.of(context).size.height *
                        0.5, // limit to half the screen lang yung image para di mag lapaw :<
                    child: Image.file(_image!, fit: BoxFit.cover),
                  ),
            SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width *
                  0.5, // para square half nalang din here
              child: ElevatedButton(
                onPressed: _pickImage, // script to pick image
                child: Text('Pick Image from Gallery'),
              ),
            ),
            SizedBox(height: 20),
            // condition for no dominant color detected
            _dominantColor == null
                ? Text('No dominant color detected.')
                : Column(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        color:
                            _dominantColor, // Show the dominant color as a box
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Dominant Color: $_hexColor', // Display the hex value of the color
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
