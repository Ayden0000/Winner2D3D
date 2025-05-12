import 'live_data.dart';
import 'result_data.dart';

class ApiResponse {
  final LiveData live;
  final List<ResultData> result;

  ApiResponse({required this.live, required this.result});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    var list = json['result'] as List;
    List<ResultData> resultList =
        list.map((i) => ResultData.fromJson(i)).toList();

    return ApiResponse(
      live: LiveData.fromJson(json['live']),
      result: resultList,
    );
  }
}
