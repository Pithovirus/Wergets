// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For formatting the date

void main() => runApp(const NotepadApp());

class NotepadApp extends StatelessWidget {
  const NotepadApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notepad',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NotepadHomePage(),
    );
  }
}

class NotepadHomePage extends StatefulWidget {
  const NotepadHomePage({super.key});

  @override
  _NotepadHomePageState createState() => _NotepadHomePageState();
}

class _NotepadHomePageState extends State<NotepadHomePage> {
  final List<Map<String, dynamic>> _notes =
      []; // Modified to store more than just text
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _tagController = TextEditingController();
  final String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modern Notepad'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: NoteSearchDelegate(_notes),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // TextField for input
            TextField(
              controller: _noteController,
              decoration: const InputDecoration(
                labelText: 'Write your note here',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 10),
            // Tag input field
            TextField(
              controller: _tagController,
              decoration: const InputDecoration(
                labelText: 'Add tags (comma separated)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            // Button to add a note
            ElevatedButton(
              onPressed: () {
                if (_noteController.text.isNotEmpty) {
                  setState(() {
                    final timestamp =
                        DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());
                    _notes.add({
                      'note': _noteController.text,
                      'tags': _tagController.text
                          .split(',')
                          .map((tag) => tag.trim())
                          .toList(),
                      'timestamp': timestamp,
                    });
                    _noteController.clear();
                    _tagController.clear(); // Clear after saving
                  });
                }
              },
              child: const Text('Save Note'),
            ),
            const SizedBox(height: 20),
            // Display list of notes with tags and timestamp
            Expanded(
              child: _notes.isEmpty
                  ? const Center(child: Text('No notes yet, add one!'))
                  : ListView.builder(
                      itemCount: _notes.length,
                      itemBuilder: (context, index) {
                        final note = _notes[index];
                        return Dismissible(
                          key: Key(note['note']),
                          onDismissed: (direction) {
                            setState(() {
                              _notes.removeAt(index);
                            });
                          },
                          background: Container(color: Colors.red),
                          child: Card(
                            child: ListTile(
                              title: Text(note['note']),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Tags: ${note['tags'].join(', ')}'),
                                  Text('Created: ${note['timestamp']}'),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom Search Delegate
class NoteSearchDelegate extends SearchDelegate {
  final List<Map<String, dynamic>> notes;

  NoteSearchDelegate(this.notes);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results =
        notes.where((note) => note['note'].contains(query)).toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index]['note']),
          subtitle: Text('Tags: ${results[index]['tags'].join(', ')}'),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions =
        notes.where((note) => note['note'].contains(query)).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index]['note']),
          subtitle: Text('Tags: ${suggestions[index]['tags'].join(', ')}'),
        );
      },
    );
  }
}
