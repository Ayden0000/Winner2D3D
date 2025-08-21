class BetRuleResponse {
  final bool success;
  final String message;
  final List<BetRule> data;

  BetRuleResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory BetRuleResponse.fromJson(Map<String, dynamic> json) {
    return BetRuleResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data:
          (json['data'] as List<dynamic>?)
              ?.map((item) => BetRule.fromJson(item))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() => {
    'success': success,
    'message': message,
    'data': data.map((e) => e.toJson()).toList(),
  };
}

class BetRule {
  final int id;
  final String gameType;
  final String pattern;
  final String ruleDate;
  final String? session;
  final int userId;

  BetRule({
    required this.id,
    required this.gameType,
    required this.pattern,
    required this.ruleDate,
    this.session,
    required this.userId,
  });

  factory BetRule.fromJson(Map<String, dynamic> json) {
    return BetRule(
      id: json['id'],
      gameType: json['gameType'],
      pattern: json['pattern'],
      ruleDate: json['ruleDate'],
      session: json['session'], // nullable
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'gameType': gameType,
    'pattern': pattern,
    'ruleDate': ruleDate,
    'session': session,
    'userId': userId,
  };
}
