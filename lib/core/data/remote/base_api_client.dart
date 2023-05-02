import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../domain/endpoints.dart';
import '../../domain/token/model/token_refresh_response.dart';
import '../../domain/token/repository/repository.dart';
import '../../domain/token/repository/token_repository.dart';
import '../../utils/build_configs/build_config.dart';
import '../../utils/header_util.dart';
import '../../utils/logging_interceptor.dart';

class BaseApiClient {
  late Dio _dio;

  BaseApiClient() {
    _dio = _createDio();
  }

  Future<Response> post(
          {required String endpoint, required String payload}) async =>
      _dio.post(endpoint, data: payload);

  Future<Response> get(
          {required String endpoint,
          Map<String, dynamic>? queryParameters}) async =>
      _dio.get(endpoint, queryParameters: queryParameters);

  Future<Response> patch(
          {required String endpoint, required String payload}) async =>
      _dio.patch(endpoint, data: payload);

  String get baseUrl => Environment().config.askLoraApiBaseUrl;

  Map<String, String> get headers => {};

  String? get token => null;

  final Duration timeOutDuration = const Duration(seconds: 60);

  Dio _createDio() {
    var dio = Dio(BaseOptions(
        connectTimeout: timeOutDuration,
        sendTimeout: timeOutDuration,
        receiveTimeout: timeOutDuration,
        baseUrl: baseUrl,
        followRedirects: false,
        validateStatus: (status) {
          if (status != null && status < 300) {
            return true;
          }
          return false;
        },
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          ...headers
        }));

    if (kDebugMode) {
      dio.interceptors.add(LoggingInterceptor());
    }
    dio.interceptors.add(AppInterceptors(TokenRepository(), dio, token));
    return dio;
  }
}

class AppInterceptors extends Interceptor {
  final Repository _storage;
  final Dio _dio;
  String? _deviceId;
  String? _userAgent;
  String? token;

  Future<String?> _loadDeviceId() async {
    _deviceId = await getDeviceId();
    return _deviceId;
  }

  Future<String?> _loadDeviceAgent() async {
    _userAgent = await getDeviceAgent();
    return _userAgent;
  }

  AppInterceptors(this._storage, this._dio, this.token);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    var accessToken = await _storage.getAccessToken();
    if (token == null) {
      if (accessToken != null) {
        options.headers['Authorization'] = 'Bearer $accessToken';
      }
    } else {
      options.headers['Authorization'] = 'Bearer $token';
    }
    options.headers['X-Device-id'] = _deviceId ?? await _loadDeviceId();
    options.headers['X-Device-User-Agent'] =
        _userAgent ?? await _loadDeviceAgent();
    return handler.next(options);
  }

  Future<void> _handleExpiredToken(
      DioError error, ErrorInterceptorHandler handler) async {
    if (await _refreshToken()) {
      return handler.resolve(await _retry(error.requestOptions));
    }
    handler.next(error);
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
    try {
      final refreshToken = await _storage.getRefreshToken();
      final response = await _dio
          .post(endpointTokenRefresh, data: {'refresh': refreshToken});

      if (response.statusCode == 200) {
        var refreshResponse = TokenRefreshResponse.fromJson(response.data);
        var accessToken = refreshResponse.access!;
        _storage.saveAccessToken(accessToken);
        return true;
      } else {
        _storage.deleteAll();
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioErrorType.connectionTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw DeadlineExceededException(err.requestOptions);
      case DioErrorType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestException(err.requestOptions);
          case 401:
            final message = err.response?.data['message'];
            if (message == 'Token invalid' ||
                message == 'Token invalid / expired') {
              _handleExpiredToken(err, handler);
              return;
            } else {
              throw UnauthorizedException(err.requestOptions);
            }
          case 403:
            throw ForbiddenException(err.requestOptions);
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
      case DioErrorType.unknown:
        throw NoInternetConnectionException(err.requestOptions);
      case DioErrorType.badCertificate:
        // TODO: Handle this case.
        break;
      case DioErrorType.connectionError:
        // TODO: Handle this case.
        break;
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

class ForbiddenException extends DioError {
  ForbiddenException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return "You don't have permission to access this resource";
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
