part of 'kyc_bloc.dart';

abstract class AccountEvent extends Equatable {
  const AccountEvent();

  @override
  List<Object> get props => [];
}

class GetSdkToken extends AccountEvent {}

class UpdateOnfidoResult extends AccountEvent {
  final String outcome;
  final String reason;
  final String token;

  const UpdateOnfidoResult(this.outcome, this.reason, this.token);
}
