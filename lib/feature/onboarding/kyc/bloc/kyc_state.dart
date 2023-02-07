part of 'kyc_bloc.dart';

enum KycStatus {
  success,
  failure,
  unknown,
  fetchingAccount,
  upgradingAccount,
  fetchingOnfidoToken,
  submittingOnfidoResult,
  submittingTaxInfo
}

enum KycPageStep {
  progress,
  residentCheck,
  personalInfoRejected,
  basicInformation,
  otp,
  tin,
  addressProof,
  personalInfoSummary,
  disclosureAffiliationPerson,
  disclosureAffiliationPersonInput,
  disclosureAffiliationAssociates,
  disclosureAffiliationAssociatesInput,
  disclosureAffiliationCommissions,
  disclosureRejected,
  disclosureSummary,
  financialProfileEmployment,
  financialProfileSourceOfWealth,
  verifyIdentity,
  signBrokerAgreements,
  signRiskDisclosureAgreements,
  signTaxAgreements,
  kycSummary,
  kycResultScreen
}

class KycState extends Equatable {
  const KycState({
    this.status = KycStatus.unknown,
    this.responseMessage = '',
  });

  final KycStatus status;
  final String responseMessage;

  @override
  List<Object?> get props {
    return [status, responseMessage];
  }

  KycState copyWith({
    KycStatus? status,
    String? responseMessage,
  }) {
    return KycState(
        status: status ?? this.status,
        responseMessage: responseMessage ?? this.responseMessage);
  }
}

class OnfidoSdkToken extends KycState {
  final String token;

  const OnfidoSdkToken(this.token);
}

class OnfidoResultUpdated extends KycState {
  final OnfidoResultResponse response;

  const OnfidoResultUpdated(this.response);
}
