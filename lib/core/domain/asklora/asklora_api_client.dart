import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../utils/build_configs/build_config.dart';
import '../logging_interceptor.dart';

class AskloraApiClient {
  final dio = createDio();

  AskloraApiClient._internal();

  static final _singleton = AskloraApiClient._internal();

  factory AskloraApiClient() => _singleton;

  static Dio createDio() {
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
    dio.interceptors.add(AppInterceptors(dio));
    return dio;
  }
}

class AppInterceptors extends Interceptor {
  final Dio dio;

  AppInterceptors(this.dio);

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
            throw UnauthorizedException(err.requestOptions);
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
