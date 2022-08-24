part of 'account_bloc.dart';

abstract class AccountEvent extends Equatable {
  const AccountEvent();

  @override
  List<Object> get props => [];
}

class GetAccount extends AccountEvent {}

class UpgradeAccount extends AccountEvent {
  final String ipAddress;

  const UpgradeAccount(this.ipAddress);
}

class GetSdkToken extends AccountEvent {}

class UpdateOnfidoResult extends AccountEvent {
  final String outcome;
  final String reason;
  final String token;

  const UpdateOnfidoResult(this.outcome, this.reason, this.token);
}
