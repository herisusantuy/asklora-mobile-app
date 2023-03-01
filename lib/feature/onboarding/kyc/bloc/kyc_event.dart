part of 'kyc_bloc.dart';

abstract class KycEvent extends Equatable {
  const KycEvent();

  @override
  List<Object> get props => [];
}

class SubmitKyc extends KycEvent {
  final UpgradeAccountRequest upgradeAccountRequest;
  const SubmitKyc(
    this.upgradeAccountRequest,
  );
  @override
  List<Object> get props => [upgradeAccountRequest];
}

class GetSdkToken extends KycEvent {}

class UpdateOnfidoResult extends KycEvent {
  final String outcome;
  final String reason;
  final String token;

  const UpdateOnfidoResult(this.outcome, this.reason, this.token);
}
