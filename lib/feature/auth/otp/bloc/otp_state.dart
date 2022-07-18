part of 'otp_bloc.dart';

class OtpState extends Equatable {
  final ResponseState status;
  final String otp;
  final int resetTime;
  final bool disableRequest;
  final String responseMessage;

  const OtpState({
    this.disableRequest = false,
    this.status = ResponseState.unknown,
    this.otp = '',
    this.responseMessage = '',
    this.resetTime = 0,
  }) : super();

  @override
  List<Object> get props => [
        disableRequest,
        status,
        otp,
        responseMessage,
        resetTime,
      ];

  OtpState copyWith({
    ResponseState? status,
    String? otp,
    bool? disableRequest,
    int? resetTime,
    String? responseMessage,
  }) {
    return OtpState(
      status: status ?? this.status,
      otp: otp ?? this.otp,
      disableRequest: disableRequest ?? this.disableRequest,
      resetTime: resetTime ?? this.resetTime,
      responseMessage: responseMessage ?? this.responseMessage,
    );
  }
}
