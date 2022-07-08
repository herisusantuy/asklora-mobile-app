part of 'account_bloc.dart';

abstract class AccountEvent extends Equatable {
  const AccountEvent();

  @override
  List<Object> get props => [];
}

class GetAccount extends AccountEvent {}

class UpgradeAccount extends AccountEvent {
  final UpgradeAccountRequest? upgradeAccountRequest;

  const UpgradeAccount(this.upgradeAccountRequest);
}

class GetSdkToken extends AccountEvent {}

class AccountCurrentStepChanged extends AccountEvent {
  final String type;
  const AccountCurrentStepChanged(
    this.type,
  ) : super();
  @override
  List<Object> get props => [type];
}

class UpdateOnfidoResult extends AccountEvent {
  final String outcome;
  final String reason;
  final String token;

  const UpdateOnfidoResult(this.outcome, this.reason, this.token);
}
