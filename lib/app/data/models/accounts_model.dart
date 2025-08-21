class AccountsModel {
  final int id;
  final String username;
  final String role;
  final int? parentId;

  AccountsModel({
    required this.id,
    required this.username,
    required this.role,
    required this.parentId,
  });

  factory AccountsModel.fromJson(Map<String, dynamic> json) {
    return AccountsModel(
      id: json['id'],
      username: json['username'],
      role: json['role'],
      parentId: json['parentId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'username': username, 'role': role, 'parentId': parentId};
  }
}

class UserListResponse {
  final bool success;
  final String message;
  final List<AccountsModel> data;

  UserListResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory UserListResponse.fromJson(Map<String, dynamic> json) {
    return UserListResponse(
      success: json['success'],
      message: json['message'],
      data: List<AccountsModel>.from(
        json['data'].map((item) => AccountsModel.fromJson(item)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data.map((user) => user.toJson()).toList(),
    };
  }
}
