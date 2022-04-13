import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => $initGetIt(getIt);

@module
abstract class DioModule {
  late Dio _dio;

  DioModule() {
    _dio = Dio();
    _dio.interceptors.add(DioLogInterceptor());
  }

  Dio get dio => _dio;
}

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
