import 'package:flutter/material.dart';
// imports necessários para fazer o download do PDF
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdfWidgets;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

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
        actions: [
          IconButton(
            icon: Icon(Icons.picture_as_pdf),
            onPressed: () => _exportPDF(),
          ),
        ],
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

  void _exportPDF() async {
    final pdf = pdfWidgets.Document();

    pdf.addPage(pdfWidgets.Page(
      build: (context) => pdfWidgets.Column(
        crossAxisAlignment: pdfWidgets.CrossAxisAlignment.start,
        children: _notes.map((note) => pdfWidgets.Text(note)).toList(),
      ),
    ));

    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;

    final file = File('$path/notes.pdf');
    await file.writeAsBytes(await pdf.save());

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('PDF exportado com sucesso!')),
    );
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
