// class Spending {
//   String message;
//   List<Data> datas;

//   Spending({
//     required this.message,
//     required this.datas,
//   });
// }

// ignore_for_file: file_names

class Spendings {
  int idSpending;
  int spending;
  String nim;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  Spendings({
    required this.idSpending,
    required this.spending,
    required this.nim,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory Spendings.fromJson(Map<String, dynamic> json) => Spendings(
        idSpending: json["id_spending"],
        nim: json["nim"],
        spending: json["spending"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );
}
