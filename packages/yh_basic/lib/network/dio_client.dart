import 'package:dio/dio.dart';
import 'package:yh_basic/yh_basic.dart';

class DioHelper implements LibraryInitializer {
  late Dio _dio;

  Dio getDio() {
    return _dio;
  }

  @override
  Future<void> init({List<InterceptorsWrapper>? interceptors}) async {
    _dio = Dio();

    _dio.options = BaseOptions(
      baseUrl: AppGlobal.I().site.domain,
      contentType: NetworkConstants.contentType,
      sendTimeout: DioConstants.timeout,
      connectTimeout: DioConstants.timeout,
      receiveTimeout: DioConstants.timeout,
    );
    if(!empty(interceptors)) _dio.interceptors.addAll(interceptors!);
  }

  Future<ApiResponse<T>> get<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    final dio = getDio();
    try {
      final response = await dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return ApiResponse<T>(data: response.data);
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }

  Future<ApiResponse<T>> post<T>(
    String url, {
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
      return ApiResponse.success(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse<T>> put<T>(
    String url, {
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
      return ApiResponse.success(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse<T>> delete<T>(
    String url, {
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
      return ApiResponse.success(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
