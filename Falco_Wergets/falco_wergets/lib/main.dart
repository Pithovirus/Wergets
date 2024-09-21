import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Main app entry
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Falco Widgets',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SchoolHomeWidget(),
    );
  }
}

// Basic Scaffold for the App Widget
class SchoolHomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar widget with a title and burger menu (Drawer icon)
      appBar: AppBar(
        title: Text('Falco School Widget'),
        // No need for a leading icon anymore; the Drawer provides it
      ),

      // Drawer for the side panel (burger menu)
      drawer: Drawer(
        // Drawer content with a list of options
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Falco Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.schedule),
              title: Text('Class Schedule'),
              onTap: () {
                // Action when tapped
              },
            ),
            ListTile(
              leading: Icon(Icons.school),
              title: Text('Courses'),
              onTap: () {
                // Action when tapped
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Action when tapped
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                // Action for logout
              },
            ),
          ],
        ),
      ),

      // SafeArea widget to handle devices with notches
      body: SafeArea(
        child: Center(
          // This Container holds the content
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Displaying a school-related message using Text widget
              Text(
                'Welcome to Falco School Widget!',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              // Button in the widget
              ElevatedButton(
                onPressed: () {
                  // Action when the button is pressed
                },
                child: Text('Check Schedule'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
