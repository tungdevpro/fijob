import 'package:cachex/cachex.dart';
import 'package:cachex/core/cache_manager.dart';
import 'package:dio/dio.dart';

const FORCE_REFRESH = 'force-refresh';

class CacheXBuilder {
  CacheXBuilder(Configuration configuration) {
    baseUrl = configuration.baseUrl ?? '';
    _manager = CacheManager(configuration);
  }

  late CacheManager _manager;
  late String baseUrl;

  InterceptorsWrapper? _interceptor;

  InterceptorsWrapper get interceptor {
    return _interceptor ??= InterceptorsWrapper(onRequest: _onRequest, onResponse: _onResponse, onError: _onError);
  }

  void _onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.extra.containsKey('forceRefresh') && options.extra[FORCE_REFRESH] == true) {
      return handler.next(options);
    }

    return handler.next(options);
  }

  void _onResponse(Response e, ResponseInterceptorHandler handler) {
    return handler.next(e);
  }

  void _onError(DioException e, ErrorInterceptorHandler handler) {
    return handler.next(e);
  }

  // Future<DataLocal> _saveRequestCaching(RequestOptions requestOptions) async {}

  static Options buildOptions({Options? options, String? key, bool? forceRefresh}) {
    if (options == null) {
      options = Options();
      options.extra = {};
    }
    return options;
  }
}
