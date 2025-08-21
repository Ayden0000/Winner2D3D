class WinningResultResponse {
  final bool success;
  final String message;
  final WinningResult data;

  WinningResultResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory WinningResultResponse.fromJson(Map<String, dynamic> json) {
    return WinningResultResponse(
      success: json['success'],
      message: json['message'],
      data: WinningResult.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'success': success, 'message': message, 'data': data.toJson()};
  }
}

class WinningResult {
  final int id;
  final String resultDate;
  final String? winning2DAM;
  final String? winning2DPM;
  final String? winning3D;

  WinningResult({
    required this.id,
    required this.resultDate,
    this.winning2DAM,
    this.winning2DPM,
    this.winning3D,
  });

  factory WinningResult.fromJson(Map<String, dynamic> json) {
    return WinningResult(
      id: json['id'],
      resultDate: json['resultDate'],
      winning2DAM: json['winning2DAM'],
      winning2DPM: json['winning2DPM'],
      winning3D: json['winning3D'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'resultDate': resultDate,
      'winning2DAM': winning2DAM,
      'winning2DPM': winning2DPM,
      'winning3D': winning3D,
    };
  }
}
