class LiveData {
  final String set;
  final String value;
  final String time;
  final String twod;

  LiveData({
    required this.set,
    required this.value,
    required this.time,
    required this.twod,
  });

  factory LiveData.fromJson(Map<String, dynamic> json) {
    return LiveData(
      set: json['set'] ?? '--',
      value: json['value'] ?? '--',
      time: json['time'] ?? 'N/A',
      twod: json['twod'] ?? '--',
    );
  }
}
