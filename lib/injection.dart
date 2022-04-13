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
  }

  Dio get dio => _dio;
}
