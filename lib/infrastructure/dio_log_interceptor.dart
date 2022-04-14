import 'dart:developer';

import 'package:dio/dio.dart';

class DioLogInterceptor implements Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log('dio - onError: $err');
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('dio - onRequest: ${options.uri}');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('dio - onResponse: $response');
    handler.next(response);
  }
}
