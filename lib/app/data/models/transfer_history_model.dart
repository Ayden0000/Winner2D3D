class TransferHistoryResponse {
  final bool success;
  final String message;
  final List<TransferHistory> data;

  TransferHistoryResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory TransferHistoryResponse.fromJson(Map<String, dynamic> json) {
    return TransferHistoryResponse(
      success: json['success'],
      message: json['message'],
      data:
          (json['data'] as List)
              .map((item) => TransferHistory.fromJson(item))
              .toList(),
    );
  }
}

class TransferHistory {
  final int id;
  final int senderId;
  final int receiverId;
  final int unitAmount;
  final DateTime transferredAt;

  TransferHistory({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.unitAmount,
    required this.transferredAt,
  });

  factory TransferHistory.fromJson(Map<String, dynamic> json) {
    return TransferHistory(
      id: json['id'],
      senderId: json['senderId'],
      receiverId: json['receiverId'],
      unitAmount: json['unitAmount'],
      transferredAt: DateTime.parse(json['transferredAt']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'senderId': senderId,
      'receiverId': receiverId,
      'unitAmount': unitAmount,
      'transferredAt': transferredAt.toIso8601String(),
    };
  }
}
