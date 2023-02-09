part of 'kyc_bloc.dart';

abstract class KycEvent extends Equatable {
  const KycEvent();

  @override
  List<Object> get props => [];
}

class SubmitKyc extends KycEvent {}

class GetSdkToken extends KycEvent {}

class UpdateOnfidoResult extends KycEvent {
  final String outcome;
  final String reason;
  final String token;

  const UpdateOnfidoResult(this.outcome, this.reason, this.token);
}
