// ignore_for_file: file_names

class Note {
  int id;
  String title;
  String content;
  DateTime modifiedTime;

  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.modifiedTime,
  });
}

List<Note> sampleNotes = [
  Note(
    id: 0,
    title: 'Hidup Sehat',
    content:
        'Hidup Sehat adalah sebuah gaya dari manusia untuk menumbuhkan sikap sehat pada diri sendiri',
    modifiedTime: DateTime(2024, 4, 4, 34, 5),
  ),
  Note(
    id: 1,
    title: 'Potensi Diri',
    content:
        '1. Skill\n2. Pikiran chili\n3. Spaghetti carbonara\n4. Chocolate lava cake',
    modifiedTime: DateTime(2024, 4, 4, 34, 5),
  ),
  Note(
    id: 1,
    title: 'Problem Solving',
    content: 'Probrlem solving adalah',
    modifiedTime: DateTime(2024, 4, 4, 34, 5),
  ),
];
