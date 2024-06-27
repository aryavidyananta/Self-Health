class User {
  final String noTelpn;
  final String email;
  final String foto;
  final String namaPengguna;
  final String password;
  final String roles;
  final String username;

  const User({
    required this.noTelpn,
    required this.email,
    required this.foto,
    required this.namaPengguna,
    required this.password,
    required this.roles,
    required this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      noTelpn: json["No_Telpn"],
      email: json["email"],
      foto: json["foto"],
      namaPengguna: json["nama_pengguna"],
      password: json["password"],
      roles: json["roles"],
      username: json["username"],
    );
  }
}
