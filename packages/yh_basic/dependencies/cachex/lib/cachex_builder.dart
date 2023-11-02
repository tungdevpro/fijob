import 'package:cachex/cachex.dart';
import 'package:dio/dio.dart';

class CacheXBuilder {
  CacheXBuilder(Configuration configuration) {
    baseUrl = configuration.baseUrl ?? '';
  }

  late String baseUrl;

  InterceptorsWrapper? _interceptor;

  InterceptorsWrapper get interceptor {
    return _interceptor ??= InterceptorsWrapper(onRequest: _onRequest, onResponse: _onResponse, onError: _onError);
  }

  void _onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    return handler.next(options);
  }

  void _onResponse(Response e, ResponseInterceptorHandler handler) {
    return handler.next(e);
  }

  void _onError(DioException e, ErrorInterceptorHandler handler) {
    return handler.next(e);
  }
}
