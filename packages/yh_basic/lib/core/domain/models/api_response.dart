class ApiResponse<K> {
  final int? code;
  final String? message;
  final K data;

  ApiResponse({this.code, this.message, required this.data});

  factory ApiResponse.success(K data) {
    return ApiResponse(data: data, code: 1);
  }
}
