class BetResultResponse {
  final bool success;
  final String message;
  final BetResultSummary data;

  BetResultResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory BetResultResponse.fromJson(Map<String, dynamic> json) {
    return BetResultResponse(
      success: json['success'],
      message: json['message'],
      data: BetResultSummary.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() => {
    'success': success,
    'message': message,
    'data': data.toJson(),
  };
}

class BetResultSummary {
  final String betDate;
  final int totalBets;
  final int winCount;
  final int lossCount;
  final double totalWonAmount;
  final double totalLostAmount;
  final double netAmount;
  final List<BetResult> betResults;

  BetResultSummary({
    required this.betDate,
    required this.totalBets,
    required this.winCount,
    required this.lossCount,
    required this.totalWonAmount,
    required this.totalLostAmount,
    required this.netAmount,
    required this.betResults,
  });

  factory BetResultSummary.fromJson(Map<String, dynamic> json) {
    return BetResultSummary(
      betDate: json['betDate'],
      totalBets: json['totalBets'],
      winCount: json['winCount'],
      lossCount: json['lossCount'],
      totalWonAmount: json['totalWonAmount'],
      totalLostAmount: json['totalLostAmount'],
      netAmount: json['netAmount'],
      betResults:
          (json['betResults'] as List<dynamic>)
              .map((e) => BetResult.fromJson(e))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'betDate': betDate,
    'totalBets': totalBets,
    'winCount': winCount,
    'lossCount': lossCount,
    'totalWonAmount': totalWonAmount,
    'totalLostAmount': totalLostAmount,
    'netAmount': netAmount,
    'betResults': betResults.map((e) => e.toJson()).toList(),
  };
}

class BetResult {
  final int id;
  final String gameType;
  final String number;
  final String session;
  final double amount;
  final bool win;

  BetResult({
    required this.id,
    required this.gameType,
    required this.number,
    required this.session,
    required this.amount,
    required this.win,
  });

  factory BetResult.fromJson(Map<String, dynamic> json) {
    return BetResult(
      id: json['id'],
      gameType: json['gameType'],
      number: json['number'],
      session: json['session'],
      amount: json['amount'],
      win: json['win'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'gameType': gameType,
    'number': number,
    'session': session,
    'amount': amount,
    'win': win,
  };
}
