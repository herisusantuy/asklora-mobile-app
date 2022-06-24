part of 'otp_bloc.dart';

abstract class OtpEvent extends Equatable {
  const OtpEvent() : super();

  @override
  List<Object?> get props => [];
}

class OtpInputChanged extends OtpEvent {
  final String otp;

  const OtpInputChanged(this.otp) : super();

  @override
  List<Object> get props => [otp];
}

class OtpSubmitted extends OtpEvent {
  const OtpSubmitted() : super();

  @override
  List<Object> get props => [];
}
