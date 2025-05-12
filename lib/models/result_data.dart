class ResultData {
  final String set;
  final String value;
  final String openTime;
  final String twod;

  ResultData({
    required this.set,
    required this.value,
    required this.openTime,
    required this.twod,
  });

  factory ResultData.fromJson(Map<String, dynamic> json) {
    return ResultData(
      set: json['set'] ?? '--',
      value: json['value'] ?? '--',
      openTime: json['open_time'] ?? 'N/A',
      twod: json['twod'] ?? '--',
    );
  }
}
