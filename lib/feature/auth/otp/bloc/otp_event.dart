part of 'otp_bloc.dart';

abstract class OtpEvent extends Equatable {
  const OtpEvent() : super();

  @override
  List<Object?> get props => [];
}

class OtpInputChanged extends OtpEvent {
  final String otp;
  final int textInputPosition;

  const OtpInputChanged(this.otp)
      : textInputPosition = otp.length,
        super();

  @override
  List<Object> get props => [otp];
}

class OtpRequested extends OtpEvent {
  final String email;

  const OtpRequested(this.email) : super();

  @override
  List<Object> get props => [email];
}

class OtpTimeResetUpdate extends OtpEvent {
  const OtpTimeResetUpdate() : super();

  @override
  List<Object> get props => [];
}

class OtpSubmitted extends OtpEvent {
  final VerifyOtpRequest verifyOtpRequest;

  const OtpSubmitted(this.verifyOtpRequest) : super();

  @override
  List<Object> get props => [];
}
