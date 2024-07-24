import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioInterceptor extends Interceptor {

  DioInterceptor({required this.dio, this.maxRetries = 3, this.retryDelay = 1000});
  final Dio dio;
  final int maxRetries;
  final int retryDelay;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      options.headers = {'Content-Type': 'application/x-protobuf'};
      print('REQUEST[${options.method}] => PATH: ${options.path}');
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      print('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (kDebugMode) {
      print('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    }

    var retries = err.requestOptions.extra['retries'] ?? 0;

    if (retries < maxRetries) {
      retries++;
      err.requestOptions.extra['retries'] = retries;

      if (kDebugMode) {
        print('Retrying request... ($retries/$maxRetries)');
      }

      await Future.delayed(Duration(milliseconds: retryDelay));

      try {
        final response = await dio.request(
          err.requestOptions.path,
          options: Options(
            method: err.requestOptions.method,
            headers: err.requestOptions.headers,
          ),
          data: err.requestOptions.data,
          queryParameters: err.requestOptions.queryParameters,
        );

        return handler.resolve(response);
      } catch (e) {
        return handler.next(err);
      }
    }

    return super.onError(err, handler);
  }
}
