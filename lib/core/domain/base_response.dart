enum ResponseState { success, error, unknown, loading }

class BaseResponse<T> {
  ResponseState state;
  T? data;
  Exception? exception;

  BaseResponse({this.state = ResponseState.success, this.data, this.exception});

  static BaseResponse<T> unknown<T>() {
    return BaseResponse(state: ResponseState.unknown);
  }

  static BaseResponse<T> loading<T>() {
    return BaseResponse(state: ResponseState.loading);
  }

  static BaseResponse<T> complete<T>(T data) {
    return BaseResponse(state: ResponseState.success, data: data);
  }

  static BaseResponse<T> error<T>(Exception exception) {
    return BaseResponse(state: ResponseState.error, exception: exception);
  }

  BaseResponse<T> copyWith({
    ResponseState? state,
    T? data,
    Exception? exception,
  }) {
    return BaseResponse<T>(
      state: state ?? this.state,
      data: data ?? this.data,
      exception: exception ?? this.exception,
    );
  }
}
