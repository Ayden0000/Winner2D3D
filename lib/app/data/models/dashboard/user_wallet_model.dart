class UserWalletModel {
  final bool success;
  final String message;
  final List<UserWallet>? data;

  UserWalletModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory UserWalletModel.fromJson(Map<String, dynamic> json) {
    return UserWalletModel(
      success: json['success'],
      message: json['message'],
      data:
          (json['data'] as List?)
              ?.map((x) => UserWallet.fromJson(x))
              .toList() ??
          [],
    );
  }
}

class UserWallet {
  final String username;
  final String role;
  final double balance;
  final int userId;
  final double commission;
  final double share;
  final int? limitAmount;

  UserWallet({
    required this.username,
    required this.role,
    required this.balance,
    required this.userId,
    required this.commission,
    required this.share,
    this.limitAmount,
  });

  factory UserWallet.fromJson(Map<String, dynamic> json) {
    return UserWallet(
      username: json['username'],
      role: json['role'],
      balance: json['balance'],
      userId: json['userId'],
      commission: (json['commission'] as num).toDouble(),
      share: (json['share'] as num).toDouble(),
      limitAmount: json['limitAmount'],
    );
  }
}
