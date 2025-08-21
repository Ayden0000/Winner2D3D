class LoginResponse {
  final bool success;
  final String message;
  final LoginData? data;

  LoginResponse({required this.success, required this.message, this.data});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      success: json['success'],
      message: json['message'],
      data: json['data'] != null ? LoginData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'success': success,
    'message': message,
    'data': data?.toJson(),
  };
}

class LoginData {
  final String accessToken;
  final String refreshToken;
  final int userId;
  final String role;

  LoginData({
    required this.accessToken,
    required this.refreshToken,
    required this.userId,
    required this.role,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
      userId: json['userId'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() => {
    'accessToken': accessToken,
    'refreshToken': refreshToken,
    'userId': userId,
    'role': role,
  };
}
