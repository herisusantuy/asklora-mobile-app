import 'package:equatable/equatable.dart';

enum ResponseState { success, error, unknown, loading }

class BaseResponse<T> extends Equatable {
  static const String errorMessage = 'Something went wrong! Please try again.';

  final ResponseState state;
  final T? data;
  final String message;

  const BaseResponse(
      {this.state = ResponseState.unknown, this.data, this.message = ''});

  static BaseResponse<T> unknown<T>() {
    return const BaseResponse(state: ResponseState.unknown);
  }

  static BaseResponse<T> loading<T>() {
    return const BaseResponse(state: ResponseState.loading);
  }

  static BaseResponse<T> complete<T>(T data, {String message = ''}) {
    return BaseResponse(
        state: ResponseState.success, data: data, message: message);
  }

  static BaseResponse<T> error<T>(
      {String message = BaseResponse.errorMessage}) {
    return BaseResponse(state: ResponseState.error, message: message);
  }

  BaseResponse<T> copyWith({
    ResponseState? state,
    T? data,
    String? message,
  }) {
    return BaseResponse<T>(
      state: state ?? this.state,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props {
    return [state, data, message];
  }
}
