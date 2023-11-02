import 'package:dio/dio.dart';

class CacheXBuilder {
  InterceptorsWrapper? _interceptor;

  InterceptorsWrapper get interceptor {
    return _interceptor ??= InterceptorsWrapper(onRequest: _onRequest, onResponse: _onResponse, onError: _onError);
  }

  void _onRequest(RequestOptions options, RequestInterceptorHandler handler) {}

  void _onResponse(Response e, ResponseInterceptorHandler handler) {}

  void _onError(DioException e, ErrorInterceptorHandler handler) {}
}
