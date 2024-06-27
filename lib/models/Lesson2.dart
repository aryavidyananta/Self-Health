// ignore_for_file: file_names

class Lesson {
  String name;
  String duration;
  bool isPlaying;
  bool isCompleted;

  Lesson({
    required this.duration,
    required this.isCompleted,
    required this.isPlaying,
    required this.name,
  });
}

List<Lesson> lessonList = [
  Lesson(
    duration: '11 min 20 sec',
    isCompleted: true,
    isPlaying: true,
    name: "Apa Itu hidup sehat",
  ),
  Lesson(
    duration: '10 min 11 sec',
    isCompleted: false,
    isPlaying: false,
    name: "Bagaimana Mengatur hidup Sehat",
  ),
  Lesson(
    duration: '7 min',
    isCompleted: false,
    isPlaying: false,
    name: "Mengapa Sehat Itu Penting",
  ),
  Lesson(
    duration: '5 min',
    isCompleted: false,
    isPlaying: false,
    name: "apakah Kesehatan itu bisa di perbaiki?",
  ),
  Lesson(
    duration: '5 min',
    isCompleted: false,
    isPlaying: false,
    name: "Potensi diri harus dimulai dari mana?",
  ),
  Lesson(
    duration: '5 min',
    isCompleted: false,
    isPlaying: false,
    name: "Bagaimana Mengatur potensi diri?",
  )
];
