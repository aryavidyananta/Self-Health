// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:my_self/Screen/NoteView.dart';
import 'package:my_self/models/note_model.dart';

class NoteCard extends StatelessWidget {
  const NoteCard(
      {super.key,
      required this.note,
      required this.onNoteDeleted,
      required this.index});

  final Note note;
  final int index;
  final Function(int) onNoteDeleted;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => NoteView(
                  note: note,
                  index: index,
                  onNoteDeleted: onNoteDeleted,
                )));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note.title,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                note.body,
                style: const TextStyle(
                  fontSize: 16,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
