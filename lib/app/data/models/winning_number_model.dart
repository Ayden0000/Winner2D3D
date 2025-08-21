class WinningNumbersModel {
  final bool success;
  final String message;
  final WinningData? data; // made nullable

  WinningNumbersModel({
    required this.success,
    required this.message,
    this.data,
  });

  factory WinningNumbersModel.fromJson(Map<String, dynamic> json) {
    return WinningNumbersModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null ? WinningData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'success': success,
    'message': message,
    'data': data?.toJson(), // only call toJson if not null
  };
}

class WinningData {
  final int id;
  final String resultDate;
  final String? winning2DAM;
  final String? winning2DPM;
  final String? winning3D;

  WinningData({
    required this.id,
    required this.resultDate,
    this.winning2DAM,
    this.winning2DPM,
    this.winning3D,
  });

  factory WinningData.fromJson(Map<String, dynamic> json) {
    return WinningData(
      id: json['id'],
      resultDate: json['resultDate'],
      winning2DAM: json['winning2DAM'],
      winning2DPM: json['winning2DPM'],
      winning3D: json['winning3D'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'resultDate': resultDate,
    'winning2DAM': winning2DAM,
    'winning2DPM': winning2DPM,
    'winning3D': winning3D,
  };
}
