import 'package:brick_app_v2/infrastructure/dio_log_interceptor.dart';
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
    _dio.options.queryParameters['page_size'] = 1000;
  }

  Dio get dio => _dio;
}
