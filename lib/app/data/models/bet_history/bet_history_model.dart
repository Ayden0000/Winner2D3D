class BetHistory {
  final int id;
  final String betDate;
  final String number;
  final double amount;
  final String gameType;
  final String session;
  final String pattern;

  BetHistory({
    required this.id,
    required this.betDate,
    required this.number,
    required this.amount,
    required this.gameType,
    required this.session,
    required this.pattern,
  });

  factory BetHistory.fromJson(Map<String, dynamic> json) {
    return BetHistory(
      id: json['id'],
      betDate: json['betDate'],
      number: json['number'],
      amount: json['amount'],
      gameType: json['gameType'],
      session: json['session'],
      pattern: json['pattern'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'betDate': betDate,
      'number': number,
      'amount': amount,
      'gameType': gameType,
      'session': session,
      'pattern': pattern,
    };
  }
}
