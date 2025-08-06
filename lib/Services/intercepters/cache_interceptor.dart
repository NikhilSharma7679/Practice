import 'package:dio/dio.dart';

class CacheInterceptor extends Interceptor {
  CacheInterceptor();

  var _cache = new Map<Uri, Response>();

  @override
  Future<dynamic> onRequest(RequestOptions options,  RequestInterceptorHandler handler) {
    return Future.value(options);
  }

  @override
  Future<dynamic> onResponse(Response response,ResponseInterceptorHandler handler) {
    print('onResponse App Cache Interceptor :  ${response.data}');
    _cache[response.requestOptions.uri] = response;
    return Future.value(response);
  }

  @override
  Future<dynamic> onError(DioError e, ErrorInterceptorHandler handler) {
    print('onError: $e');
    if (e.type == DioErrorType.connectTimeout ||
        e.type == DioErrorType.other) {
      var cachedResponse = _cache[e.requestOptions.uri];
      if (cachedResponse != null) {
        return Future.value(cachedResponse);
      }
    }
    return Future.value(e);
  }
}
