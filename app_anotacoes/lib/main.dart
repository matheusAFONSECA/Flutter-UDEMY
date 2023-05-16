import 'package:flutter/material.dart';
import 'dart:ui' show lerpDouble;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes App',
      home: NotesList(),
    );
  }
}

class NotesList extends StatefulWidget {
  @override
  _NotesListState createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  List<String> _notes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: ListView.builder(
        itemCount: _notes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_notes[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addNote(),
        tooltip: 'Add Note',
        child: Icon(Icons.add),
      ),
    );
  }

  void _addNote() async {
    String note = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NoteEditor()),
    );

    if (note != null) {
      setState(() {
        _notes.add(note);
      });
    }
  }
}

class NoteEditor extends StatefulWidget {
  @override
  _NoteEditorState createState() => _NoteEditorState();
}

class _NoteEditorState extends State<NoteEditor> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Note'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: TextField(
          controller: _controller,
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'Type your note here...',
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _saveNote(),
        tooltip: 'Save Note',
        child: Icon(Icons.save),
      ),
    );
  }

  void _saveNote() {
    String note = _controller.text;
    Navigator.pop(context, note);
  }
}
