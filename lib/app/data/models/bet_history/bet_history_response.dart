import 'bet_history_model.dart';

class BetHistoryResponse {
  final bool success;
  final String message;
  final List<BetHistory> data;

  BetHistoryResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory BetHistoryResponse.fromJson(Map<String, dynamic> json) {
    return BetHistoryResponse(
      success: json['success'],
      message: json['message'],
      data: List<BetHistory>.from(
        json['data'].map((item) => BetHistory.fromJson(item)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}
