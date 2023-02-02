class Profile {
  Profile({
    required this.id,
    required this.nama,
    required this.createdAt,
  });

  /// User ID of the profile
  final int id;

  /// Username of the profile
  final String nama;

  /// Date and time when the profile was created
  final DateTime createdAt;

  Profile.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        nama = map['nama'],
        createdAt = DateTime.parse(map['created_at']);
}
