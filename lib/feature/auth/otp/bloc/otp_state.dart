part of 'otp_bloc.dart';

enum OtpStatus { success, failure, unknown, loading, request }

class OtpState extends Equatable {
  final OtpStatus status;
  final String otp;
  final int resetTime;
  final int textPosition;
  final bool isOtpValid;
  final bool disableRequest;
  final String otpErrorText;
  final String responseMessage;

  const OtpState(
      {this.disableRequest = false,
      this.status = OtpStatus.unknown,
      this.otp = '',
      this.isOtpValid = false,
      this.otpErrorText = '',
      this.responseMessage = '',
      this.resetTime = 0,
      this.textPosition = 0})
      : super();

  @override
  List<Object> get props => [
        status,
        otp,
        disableRequest,
        isOtpValid,
        otpErrorText,
        resetTime,
        responseMessage,
      ];

  OtpState copyWith({
    OtpStatus? status,
    String? otp,
    bool? isOtpValid,
    bool? disableRequest,
    int? resetTime,
    int? textPosition,
    String? otpErrorText,
    String? responseMessage,
  }) {
    return OtpState(
      status: status ?? this.status,
      otp: otp ?? this.otp,
      isOtpValid: isOtpValid ?? this.isOtpValid,
      disableRequest: disableRequest ?? this.disableRequest,
      resetTime: resetTime ?? this.resetTime,
      textPosition: textPosition ?? this.textPosition,
      otpErrorText: otpErrorText ?? this.otpErrorText,
      responseMessage: responseMessage ?? this.responseMessage,
    );
  }
}
