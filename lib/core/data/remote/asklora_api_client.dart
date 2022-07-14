import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../domain/endpoints.dart';
import '../../domain/token/model/token_refresh_response.dart';
import '../../domain/token/repository/repository.dart';
import '../../domain/token/repository/token_repository.dart';
import '../../utils/build_configs/build_config.dart';
import '../../utils/logging_interceptor.dart';

class AskloraApiClient {
  late Dio _dio;

  AskloraApiClient._internal() {
    _dio = _createDio();
  }

  static final _singleton = AskloraApiClient._internal();

  factory AskloraApiClient() => _singleton;

  Future<Response> post(
          {required String endpoint, required String payload}) async =>
      _singleton._dio.post(endpoint, data: payload);

  Future<Response> get(
          {required String endpoint,
          Map<String, dynamic>? queryParameters}) async =>
      _singleton._dio.get(endpoint, queryParameters: queryParameters);

  Future<Response> patch(
          {required String endpoint, required String payload}) async =>
      _singleton._dio.patch(endpoint, data: payload);

  Dio _createDio() {
    var dio = Dio(BaseOptions(
        baseUrl: Environment().config.askLoraApiBaseUrl,
        followRedirects: false,
        validateStatus: (status) {
          if (status != null && status < 300) {
            return true;
          }
          return false;
        },
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        }));

    if (kDebugMode) {
      dio.interceptors.add(LoggingInterceptor());
    }
    dio.interceptors.add(AppInterceptors(TokenRepository(), dio));
    return dio;
  }
}

class AppInterceptors extends Interceptor {
  final Repository _storage;
  final Dio _dio;

  AppInterceptors(this._storage, this._dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    var accessToken = await _storage.getAccessToken();
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    return handler.next(options);
  }

  Future<void> _handleExpiredToken(
      DioError error, ErrorInterceptorHandler handler) async {
    if (await _refreshToken()) {
      return handler.resolve(await _retry(error.requestOptions));
    }
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return _dio.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }

  Future<bool> _refreshToken() async {
    final refreshToken = await _storage.getRefreshToken();
    final response =
        await _dio.post(endpointTokenRefresh, data: {'refresh': refreshToken});

    if (response.statusCode == 200) {
      var refreshResponse = TokenRefreshResponse.fromJson(response.data);
      var accessToken = refreshResponse.access!;
      _storage.saveAccessToken(accessToken);
      return true;
    } else {
      _storage.deleteAll();
      return false;
    }
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw DeadlineExceededException(err.requestOptions);
      case DioErrorType.response:
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestException(err.requestOptions);
          case 401:
            if (err.response?.data['message'] == 'Token invalid') {
              _handleExpiredToken(err, handler);
              return;
            } else {
              throw UnauthorizedException(err.requestOptions);
            }
          case 404:
            throw NotFoundException(err.requestOptions);
          case 406:
            throw NotAcceptableException(err.requestOptions);
          case 409:
            throw ConflictException(err.requestOptions);
          case 500:
            throw InternalServerErrorException(err.requestOptions);
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
        throw NoInternetConnectionException(err.requestOptions);
    }

    return handler.next(err);
  }
}

class BadRequestException extends DioError {
  BadRequestException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Invalid request';
  }
}

class InternalServerErrorException extends DioError {
  InternalServerErrorException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Unknown error occurred, please try again later.';
  }
}

class ConflictException extends DioError {
  ConflictException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Conflict occurred';
  }
}

class UnauthorizedException extends DioError {
  UnauthorizedException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Access denied';
  }
}

class NotFoundException extends DioError {
  NotFoundException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The requested information could not be found';
  }
}

class NotAcceptableException extends DioError {
  NotAcceptableException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The requested information could not be found';
  }
}

class NoInternetConnectionException extends DioError {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'No internet connection detected, please try again.';
  }
}

class DeadlineExceededException extends DioError {
  DeadlineExceededException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The connection has timed out, please try again.';
  }
}
