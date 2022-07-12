import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoggingInterceptor extends Interceptor {
  LoggingInterceptor();

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    _logPrint(
        '==================================== API Request - Start ====================================');

    _printKeyValue('URI', options.uri);
    _printKeyValue('METHOD', options.method);
    _logPrint('HEADERS:');
    options.headers.forEach((key, v) => _printKeyValue(' - $key', v));
    _logPrint('BODY:');
    _printAll(options.data ?? '');

    _logPrint(
        '==================================== API Request - End ====================================');

    return handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    _logPrint(
        '==================================== Api Error - Start ====================================');

    _logPrint('URI: ${err.requestOptions.uri}');
    if (err.response != null) {
      _logPrint('STATUS CODE: ${err.response?.statusCode?.toString()}');
    }
    _logPrint('$err');
    if (err.response != null) {
      _printKeyValue('REDIRECT', err.response?.realUri ?? '');
      _logPrint('BODY:');
      _printAll(err.response?.data.toString());
    }

    _logPrint(
        '==================================== Api Error - End ====================================');
    return handler.next(err);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    _logPrint(
        '==================================== Api Response - Start ====================================');

    _printKeyValue('URI', response.requestOptions.uri);
    _printKeyValue('STATUS CODE', response.statusCode ?? '');
    _printKeyValue('REDIRECT', response.isRedirect ?? false);
    _logPrint('BODY:');
    _printAll(response.data ?? '');

    _logPrint(
        '==================================== Api Response - End ====================================');

    return handler.next(response);
  }

  void _printKeyValue(String key, Object v) {
    _logPrint('$key: $v');
  }

  void _printAll(msg) {
    msg.toString().split('\n').forEach(_logPrint);
  }

  void _logPrint(String s) {
    debugPrint(s);
  }
}
