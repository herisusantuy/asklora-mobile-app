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

class SubmitPersonalInfo extends KycEvent {
  final PersonalInfoRequest personalInfoRequest;
  const SubmitPersonalInfo(
    this.personalInfoRequest,
  );

  @override
  List<Object> get props => [personalInfoRequest];
}
