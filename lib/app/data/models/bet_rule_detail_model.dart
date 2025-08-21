class BetRuleDetailResponse {
  final bool success;
  final String message;
  final List<BetRuleDetail> data;

  BetRuleDetailResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory BetRuleDetailResponse.fromJson(Map<String, dynamic> json) {
    return BetRuleDetailResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data:
          (json['data'] as List<dynamic>?)
              ?.map((item) => BetRuleDetail.fromJson(item))
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

class BetRuleDetail {
  final int id;
  final String number;
  final double maxAmount;
  final int betRuleId;

  BetRuleDetail({
    required this.id,
    required this.number,
    required this.maxAmount,
    required this.betRuleId,
  });

  factory BetRuleDetail.fromJson(Map<String, dynamic> json) {
    return BetRuleDetail(
      id: json['id'] ?? 0,
      number: json['number'] ?? '',
      maxAmount: json['maxAmount'] ?? 0,
      betRuleId: json['betRuleId'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'number': number,
    'maxAmount': maxAmount,
    'betRuleId': betRuleId,
  };
}
