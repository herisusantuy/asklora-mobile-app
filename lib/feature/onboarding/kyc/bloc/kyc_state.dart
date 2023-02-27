part of 'kyc_bloc.dart';

enum KycStatus {
  success,
  failure,
  unknown,
  fetchingAccount,
  submittingKyc,
  fetchingOnfidoToken,
  submittingOnfidoResult,
  submittingTaxInfo
}

enum KycPageStep {
  progress,
  residentCheck,
  personalInfoRejected,
  personalInfo,
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
  financialProfileSummary,
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
    this.response = const BaseResponse(),
    this.personalInfoResponse = const BaseResponse(),
  });

  final BaseResponse response;
  final BaseResponse personalInfoResponse;

  @override
  List<Object?> get props {
    return [
      response,
      personalInfoResponse,
    ];
  }

  KycState copyWith({
    BaseResponse? response,
    BaseResponse? personalInfoResponse,
  }) {
    return KycState(
      response: response ?? this.response,
      personalInfoResponse: personalInfoResponse ?? this.personalInfoResponse,
    );
  }
}

class OnfidoSdkToken extends KycState {
  final String token;

  const OnfidoSdkToken(this.token);
}

class OnfidoResultUpdated extends KycState {
  final OnfidoResultResponse onfidoResponse;

  const OnfidoResultUpdated(this.onfidoResponse);
}
