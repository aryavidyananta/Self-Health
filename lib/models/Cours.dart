// ignore_for_file: file_names

class Course {
  String name;
  double completedPercentage;
  String author;
  String thumbnail;

  Course({
    required this.author,
    required this.completedPercentage,
    required this.name,
    required this.thumbnail,
  });
}

List<Course> courses = [
  Course(
    author: "Budi",
    completedPercentage: .75,
    name: "Hidup Sehat",
    thumbnail: "assets/images/boy.png",
  ),
  Course(
    author: "Budi",
    completedPercentage: .60,
    name: "Potensi dir",
    thumbnail: "assets/images/boy.png",
  ),
  Course(
    author: "Budi",
    completedPercentage: .75,
    name: "Minat Bakat",
    thumbnail: "assets/images/boy.png",
  ),
  Course(
    author: "Budi",
    completedPercentage: .75,
    name: "Percaya Diri",
    thumbnail: "assets/images/boy.png",
  ),
  Course(
    author: "Budi",
    completedPercentage: .60,
    name: "Kesehatan Mental",
    thumbnail: "assets/images/boy.png",
  ),
  Course(
    author: "Budi",
    completedPercentage: .75,
    name: "Problem Solving",
    thumbnail: "assets/images/boy.png",
  ),
];
