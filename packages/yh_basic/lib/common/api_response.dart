
import 'constants/network_constant.dart';

class ApiResponse<T> {
  final int? code;
  final String? message;
  final T? data;

  ApiResponse({this.code, this.message, this.data});

  factory ApiResponse.success(T data, {String? message}) {
    return ApiResponse(data: data, code: 1, message: message ?? NetworkConstants.success);
  }

  factory ApiResponse.error({int code = -1, required String message}) {
    return ApiResponse(data: null, code: code, message: message);
  }
}
