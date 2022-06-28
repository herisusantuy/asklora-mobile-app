part of 'otp_bloc.dart';

enum OtpStatus {
  submitSuccess,
  requestSuccess,
  failure,
  unknown,
  requestLoading,
  verifyLoading,
  request
}

class OtpState extends Equatable {
  final OtpStatus status;
  final String otp;
  final int resetTime;
  final int textInputPosition;
  final bool disableRequest;
  final String responseMessage;

  const OtpState(
      {this.disableRequest = false,
      this.status = OtpStatus.unknown,
      this.otp = '',
      this.responseMessage = '',
      this.resetTime = 0,
      this.textInputPosition = 0})
      : super();

  @override
  List<Object> get props => [
        status,
        otp,
        disableRequest,
        resetTime,
        responseMessage,
      ];

  OtpState copyWith({
    OtpStatus? status,
    String? otp,
    bool? disableRequest,
    int? resetTime,
    int? textInputPosition,
    String? responseMessage,
  }) {
    return OtpState(
      status: status ?? this.status,
      otp: otp ?? this.otp,
      disableRequest: disableRequest ?? this.disableRequest,
      resetTime: resetTime ?? this.resetTime,
      textInputPosition: textInputPosition ?? this.textInputPosition,
      responseMessage: responseMessage ?? this.responseMessage,
    );
  }
}
