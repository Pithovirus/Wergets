// IMPORTS FOR FUNCTIONALITIES IN DATE AND WIDGETS
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

// CONTROLLERS ARE INITIALIZED FOR USER INPUTS: TITLE AND CONTENT
class _InputScreenState extends State<InputScreen> {
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  // CHAR COUNT IS INITIALIZED FOR RECORDING CHARACTER COUNT IN CONTENT
  int _charCount = 0;

  // REFLECTS UPDATED _charCount
  @override
  void initState() {
    super.initState();

    // Listen to text changes and update the character count for content input
    _contentController.addListener(() {
      setState(() {
        _charCount = _contentController.text.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // RETURNS THE FORMAT OF THE DATE: FOR EXAMPLE, 20/09/2024
    String todayDate = DateFormat('dd/MM/yyyy').format(DateTime.now());

    return Scaffold(
      body: Stack(
        children: [
          Container(color: Colors.white),

          // THE BACK BUTTON
          Positioned(
            left: screenWidth * 0.1,
            top: 23,
            child: GestureDetector(
              onTap: () {
                // RETURNS BACK TO THE main.dart IF CLICKED
                Navigator.pop(context);
              },
              child: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/back_button.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),

          // CONFIRM BUTTON
          Positioned(
            right: screenWidth * 0.1,
            top: 23,
            child: GestureDetector(
              onTap: () {
                // RETURNS BACK TO THE main.dart WITH THE TITLE, CONTENT AND DATE
                Navigator.pop(context, {
                  'title': _titleController.text,
                  'content': _contentController.text,
                  'date': todayDate,
                });
              },
              child: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/confirm_button.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),

          // TITLE INPUT LAYOUT
          Positioned(
            left: 35,
            top: 68,
            child: Container(
              width: 180,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: TextField(
                  controller: _titleController,
                  style: TextStyle(
                    fontFamily: 'Inria Serif',
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    hintText: "Enter title",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),

          // DATE LAYOUT
          Positioned(
            left: 35,
            top: 120,
            child: Container(
              width: 124,
              height: 31,
              color: Color(0xFFD9D9D9),
              alignment: Alignment.center,
              child: Text(
                todayDate,
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ),
          ),

          // CHARACTER COUNT
          Positioned(
            left: 180,
            top: 120,
            child: Container(
              width: 124,
              height: 31,
              color: Color(0xFFD9D9D9),
              alignment: Alignment.center,
              child: Text(
                // UPDATES DYNAMICALLY FOR EVERY CHARACTER IN CONTENT
                '$_charCount characters',
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ),
          ),

          // CONTENT
          Positioned(
            left: (screenWidth - 291) / 2,
            top: 169,
            child: Container(
              width: 291,
              height: 575,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _contentController,
                  maxLines: null,
                  style: TextStyle(
                      fontFamily: 'Inria Serif',
                      fontSize: 16,
                      color: Colors.black),
                  decoration:
                      InputDecoration.collapsed(hintText: "Enter your content"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
