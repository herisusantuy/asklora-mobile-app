part of 'kyc_bloc.dart';

class KycEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitiateOnfidoSdk extends KycEvent {
  final String token;

  InitiateOnfidoSdk(this.token);
}
