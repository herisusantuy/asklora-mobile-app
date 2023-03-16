part of 'otp_bloc.dart';

class OtpState extends Equatable {
  final BaseResponse response;
  final String otp;
  final int resetTime;
  final bool disableRequest;

  const OtpState({
    this.disableRequest = false,
    this.response = const BaseResponse(),
    this.otp = '',
    this.resetTime = 0,
  }) : super();

  @override
  List<Object> get props => [
        disableRequest,
        response,
        otp,
        resetTime,
      ];

  OtpState copyWith({
    BaseResponse? response,
    String? otp,
    bool? disableRequest,
    int? resetTime,
  }) {
    return OtpState(
      response: response ?? this.response,
      otp: otp ?? this.otp,
      disableRequest: disableRequest ?? this.disableRequest,
      resetTime: resetTime ?? this.resetTime,
    );
  }
}

class OtpValidationSuccess extends OtpState {
  @override
  List<Object> get props => [];
}
