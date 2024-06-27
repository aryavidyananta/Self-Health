// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:my_self/Screen/MindHaven/ReadNotes.dart';
import 'package:my_self/Screen/MindHaven/tambahNotes.dart';
import 'package:my_self/dto/notes.dart';
import 'package:my_self/service/data_service.dart';

// ignore: use_key_in_widget_constructors
class NotesScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  late Future<List<Notes>> _notesFuture;

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
          _notesFuture = DataService.fetchNotes();
        });
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Catatan berhasil dihapus')),
        );
      } else {
        throw Exception('Gagal menghapus catatan');
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Gagal menghapus catatan')),
      );
      // ignore: avoid_print
      print('Error deleting note: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
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
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final note = snapshot.data![index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  elevation: 3,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailNoteScreen(note),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                note.title,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  _deleteNote(note.idNotes);
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Baca Selengkapnya',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
        child: const Icon(Icons.add),
      ),
    );
  }
}
