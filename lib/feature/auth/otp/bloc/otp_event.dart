part of 'otp_bloc.dart';

abstract class OtpEvent extends Equatable {
  const OtpEvent() : super();

  @override
  List<Object?> get props => [];
}

class OtpInputChanged extends OtpEvent {
  final String otp;
  final int textPosition;

  const OtpInputChanged(this.otp)
      : textPosition = otp.length,
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

class OtpSubmitted extends OtpEvent {
  const OtpSubmitted() : super();

  @override
  List<Object> get props => [];
}
