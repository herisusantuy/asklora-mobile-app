part of 'otp_bloc.dart';

abstract class OtpEvent extends Equatable {
  const OtpEvent() : super();

  @override
  List<Object?> get props => [];
}

class OtpRequested extends OtpEvent {
  const OtpRequested() : super();

  @override
  List<Object> get props => [];
}

class OtpTimeResetUpdate extends OtpEvent {
  const OtpTimeResetUpdate() : super();

  @override
  List<Object> get props => [];
}

class OtpSubmitted extends OtpEvent {
  final String otp;

  const OtpSubmitted(this.otp) : super();

  @override
  List<Object> get props => [];
}
