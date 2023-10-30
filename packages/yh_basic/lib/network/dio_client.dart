import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:yh_basic/yh_basic.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper implements LibraryInitializer {
  late Dio _dio;

  Dio getDio() {
    return _dio;
  }

  @override
  Future<void> init({List<InterceptorsWrapper>? interceptors, bool hasLog = true}) async {
    _dio = Dio();

    _dio.options = BaseOptions(
      baseUrl: AppGlobal
          .I()
          .site
          .domain,
      contentType: NetworkConstants.contentType,
      sendTimeout: DioConstants.timeout,
      connectTimeout: DioConstants.timeout,
      receiveTimeout: DioConstants.timeout,
    );
    if (!empty(interceptors)) _dio.interceptors.addAll(interceptors!);
    if (hasLog) {
      _dio.interceptors.add(PrettyDioLogger(requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          compact: false));
    }
  }

  Future<ApiResponse<T>> get<T>(String url, {
    Function? convertJson,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    final dio = getDio();
    try {
      final response = await dio.get(url, queryParameters: queryParameters, options: options, cancelToken: cancelToken, onReceiveProgress: onReceiveProgress);
      return ApiResponse<T>.success((convertJson?.call(response.data) as T));
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }

  Future<ApiResponse<T>> post<T>(String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final dio = getDio();
    try {
      final response = await dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return ApiResponse(data: response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse<T>> put<T>(String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final dio = getDio();
    try {
      final response = await dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return ApiResponse(data: response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse<T>> delete<T>(String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final dio = getDio();
    try {
      final response = await dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return ApiResponse(data: response.data);
    } catch (e) {
      rethrow;
    }
  }
}
