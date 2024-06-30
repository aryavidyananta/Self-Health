import 'package:flutter/material.dart';
import 'package:my_self/Screen/MindHaven/ReadNotes.dart';
import 'package:my_self/Screen/MindHaven/tambahNotes.dart';
import 'package:my_self/dto/notes.dart';
import 'package:my_self/service/data_service.dart';

class NotesScreen extends StatefulWidget {
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  late Future<List<Notes>> _notesFuture;
  List<Notes> _notes = [];

  @override
  void initState() {
    super.initState();
    _notesFuture = DataService.fetchNotes();
  }

  Future<void> _deleteNote(int idNotes) async {
    try {
      bool success = await DataService.deleteNoteById(idNotes);
      if (success) {
        setState(() {
          // Remove the note from the list
          _notes.removeWhere((note) => note.idNotes == idNotes);
        });
      } else {
        throw Exception('Gagal menghapus catatan');
      }
    } catch (e) {
      final snackBar = SnackBar(
        content: Text('Gagal menghapus catatan'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print('Error deleting note: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        backgroundColor: Colors.teal,
      ),
      body: FutureBuilder<List<Notes>>(
        future: _notesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No notes available'));
          } else {
            _notes = snapshot.data!;
            return ListView.builder(
              itemCount: _notes.length,
              itemBuilder: (context, index) {
                final note = _notes[index];
                return AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            note.title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              _deleteNote(note.idNotes);
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailNoteScreen(note),
                              ),
                            );
                          },
                          child: const Text(
                            'Baca Selengkapnya',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNoteScreen()),
          ).then((_) {
            setState(() {
              _notesFuture = DataService.fetchNotes();
            });
          });
        },
        tooltip: 'Tambah Catatan',
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add),
      ),
    );
  }
}
