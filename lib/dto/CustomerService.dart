// ignore_for_file: file_names

class CustomerService {
  int idCustomerService;
  String nim;
  String titleIssues;
  String descriptionIssues;
  int rating;
  String? imageUrl;
  dynamic divisionDepartementName; // Ubah menjadi divisionDepartementTarget
  dynamic priorityName;
  dynamic idDivisonTarget;
  dynamic idpriority;
  // Ubah menjadi priorityName
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  CustomerService({
    required this.idCustomerService,
    required this.nim,
    required this.titleIssues,
    required this.descriptionIssues,
    required this.rating,
    this.imageUrl,
    required this.divisionDepartementName, // Ubah sesuai perubahan di atas
    required this.priorityName,
    required this.idDivisonTarget,
    required this.idpriority, // Ubah sesuai perubahan di atas
    this.createdAt,
    this.updatedAt,
    required this.deletedAt,
  });

  factory CustomerService.fromJson(Map<String, dynamic> json) =>
      CustomerService(
        idCustomerService: json["id_customer_service"],
        nim: json["nim"],
        titleIssues: json["title_issues"],
        descriptionIssues: json["description_issues"],
        rating: json["rating"],
        imageUrl: json["image_url"],
        divisionDepartementName:
            json["division_departement_name"], // Ubah sesuai perubahan di atas
        priorityName: json["priority_name"],
        idDivisonTarget: json["id_division_target"],
        idpriority: json["id_priority"], // Ubah sesuai perubahan di atas
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );
}
