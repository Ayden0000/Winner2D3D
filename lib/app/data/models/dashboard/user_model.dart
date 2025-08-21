class UserModel {
  final int id;
  final String username;
  final String role;
  final int? parentId;

  UserModel({
    required this.id,
    required this.username,
    required this.role,
    this.parentId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      role: json['role'],
      parentId: json['parentId'],
    );
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'username': username, 'role': role, 'parentId': parentId};
  }
}
