part of 'otp_bloc.dart';

enum OtpStatus { success, failure, unknown, loading }

class OtpState extends Equatable {
  final OtpStatus status;
  final String otp;
  final bool isOtpValid;
  final String otpErrorText;
  final String responseMessage;

  const OtpState({
    this.status = OtpStatus.unknown,
    this.otp = '',
    this.isOtpValid = false,
    this.otpErrorText = '',
    this.responseMessage = '',
  }) : super();

  @override
  List<Object> get props => [
        status,
        otp,
        isOtpValid,
        otpErrorText,
        responseMessage,
      ];

  OtpState copyWith({
    OtpStatus? status,
    String? otp,
    bool? isOtpValid,
    String? otpErrorText,
    String? responseMessage,
  }) {
    return OtpState(
      status: status ?? this.status,
      otp: otp ?? this.otp,
      isOtpValid: isOtpValid ?? this.isOtpValid,
      otpErrorText: otpErrorText ?? this.otpErrorText,
      responseMessage: responseMessage ?? this.responseMessage,
    );
  }
}
