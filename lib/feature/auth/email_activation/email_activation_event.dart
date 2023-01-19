part of 'email_activation_bloc.dart';

abstract class EmailActivationEvent extends Equatable {
  const EmailActivationEvent();
}

class ResendEmailActivationLink extends EmailActivationEvent {
  final String email;

  const ResendEmailActivationLink(this.email);

  @override
  List<Object> get props => [email];
}
