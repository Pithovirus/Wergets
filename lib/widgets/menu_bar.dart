import 'package:flutter/material.dart';

class NewMenuBar extends StatelessWidget {
  final VoidCallback onThemeToggle; // Callback to toggle theme

  const NewMenuBar({required this.onThemeToggle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('My App'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.brightness_6),
          onPressed: onThemeToggle, // Calls the theme toggle function
        ),
        PopupMenuButton<String>(
          onSelected: (String result) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Selected: $result'),
            ));
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            const PopupMenuItem<String>(
              value: 'Option 1',
              child: Text('Option 1'),
            ),
            const PopupMenuItem<String>(
              value: 'Option 2',
              child: Text('Option 2'),
            ),
          ],
        ),
      ],
    );
  }
}
