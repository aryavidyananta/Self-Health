class Category {
  String thumbnail;
  String name;
  int noOfCourses;

  Category({
    required this.name,
    required this.noOfCourses,
    required this.thumbnail,
  });
}

List<Category> categoryList = [
  Category(
    name: 'Quality Of Life',
    noOfCourses: 12,
    thumbnail: 'assets/images/baby.png',
  ),
  Category(
    name: 'Self-Potensial',
    noOfCourses: 20,
    thumbnail: 'assets/images/having.png',
  ),
  Category(
    name: 'Personal Skill',
    noOfCourses: 16,
    thumbnail: 'assets/images/baby.png',
  ),
  Category(
    name: 'Confident',
    noOfCourses: 25,
    thumbnail: 'assets/images/litle.png',
  ),
];
