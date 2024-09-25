// IMPORTS FOR THE FUNCTIONALITIES: TIME, WIDGETS AND INPUT FILE
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'input_section.dart';

// INITIALIZES THE APPLICATION
void main() {
  runApp(NotesApp());
}

class NotesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes App',
      home: MainScreen(),
    );
  }
}

//
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

// HOLDS THE LOGIC FOR THE CONTENT
class _MainScreenState extends State<MainScreen> {
  // CONTAINS THE TITLE, CONTENT AND DATE OF EACH NOTE
  List<Map<String, String>> notes = [];

  // REFLECTS CHANGES EVERYTIME THERE IS A NEW NOTE
  void _addNote(String title, String content, String date) {
    setState(() {
      notes.add({'title': title, 'content': content, 'date': date});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: Colors.white),
          // THE TITLE
          Positioned(
            left: 16,
            top: 19,
            child: Container(
              width: 149,
              height: 42,
              alignment: Alignment.center,
              child: Text(
                'Notes Pad',
                style: TextStyle(
                  fontFamily: 'Inria Serif',
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          // GENERATES THE LIST OF NOTE TITLE, CONTENT, DATE, AND ITS LAYOUT
          Positioned(
            top: 70,
            left: 16,
            right: 16,
            bottom: 0,
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notes[index]['title'] ?? '',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        notes[index]['content'] ?? '',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 4),
                      Text(
                        notes[index]['date'] ?? '',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // THE ADD BUTTON (+) WHICH DIRECTS TO THE input_section FILE
          Positioned(
            right: 16,
            bottom: 16,
            child: GestureDetector(
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InputScreen()),
                );
                // CHECKS THE USER INPUTS IN input_section TO ADD
                if (result is Map<String, String?>) {
                  _addNote(
                    result['title'] ?? 'Untitled',
                    result['content'] ?? '',
                    result['date'] ??
                        DateFormat('dd/MM/yyyy').format(DateTime.now()),
                  );
                }
              },
              // THE ADD BUTTON IMAGE
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/add_button.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
