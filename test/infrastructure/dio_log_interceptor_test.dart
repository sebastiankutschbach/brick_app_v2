import 'package:brick_app_v2/infrastructure/dio_log_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDioError extends Mock implements DioError {}

class MockRequestOptions extends Mock implements RequestOptions {}

class MockResponse extends Mock implements Response {}

class MockErrorInterceptorHandler extends Mock
    implements ErrorInterceptorHandler {}

class MockRequestInterceptorHandler extends Mock
    implements RequestInterceptorHandler {}

class MockResponseInterceptorHandler extends Mock
    implements ResponseInterceptorHandler {}

main() {
  final DioLogInterceptor dioLogInterceptor = DioLogInterceptor();

  test('onError delegates after logging', () {
    final ErrorInterceptorHandler handler = MockErrorInterceptorHandler();
    var dioError = MockDioError();
    dioLogInterceptor.onError(dioError, handler);
    verify((() => handler.next(dioError))).called(1);
  });

  test('onRequest delegates after logging', () {
    final RequestInterceptorHandler handler = MockRequestInterceptorHandler();
    var requestOptions = MockRequestOptions();
    when(() => requestOptions.uri).thenReturn(Uri.parse('www.google.de'));
    dioLogInterceptor.onRequest(requestOptions, handler);
    verify((() => handler.next(requestOptions))).called(1);
  });

  test('onResponse delegates after logging', () {
    final ResponseInterceptorHandler handler = MockResponseInterceptorHandler();
    var response = MockResponse();
    dioLogInterceptor.onResponse(response, handler);
    verify((() => handler.next(response))).called(1);
  });
}
