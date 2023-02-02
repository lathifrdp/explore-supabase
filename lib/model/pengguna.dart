class Pengguna {
  Pengguna({
    this.id,
    this.username,
    this.password,
    this.email,
    this.createdAt,
  });

  int? id;
  String? username;
  String? password;
  String? email;
  DateTime? createdAt;

  Pengguna.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    username = map['username'];
    password = map['password'];
    email = map['email'];
    createdAt = DateTime.parse(map['created_at']);
  }

  Pengguna.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        username = map['username'],
        password = map['password'],
        email = map['email'],
        createdAt = DateTime.parse(map['created_at']);
}
