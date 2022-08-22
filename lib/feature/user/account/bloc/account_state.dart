part of 'account_bloc.dart';

enum AccountStatus {
  success,
  failure,
  unknown,
  fetchingAccount,
  upgradingAccount,
  fetchingOnfidoToken,
  submittingOnfidoResult,
  submittingTaxInfo
}

enum UpgradeAccountPageStep {
  basicInformation,
  countryOfTaxResidence,
  addressProof,
  employmentFinancialProfile,
  disclosureAffiliation,
  signingTaxAgreement,
  signingBrokerAgreement,
  trustedContact,
  riskDisclosure,
  reviewInformation,
  unknown
}

extension Type on UpgradeAccountPageStep {
  String get name {
    switch (this) {
      case UpgradeAccountPageStep.basicInformation:
        return 'Basic Information';
      case UpgradeAccountPageStep.countryOfTaxResidence:
        return 'Country of Tax Residence';
      case UpgradeAccountPageStep.addressProof:
        return 'Permanent Residential Address';
      case UpgradeAccountPageStep.employmentFinancialProfile:
        return 'Employment, Financial Profile';
      case UpgradeAccountPageStep.disclosureAffiliation:
        return 'Disclosure & Affiliations';
      case UpgradeAccountPageStep.signingTaxAgreement:
        return 'Signing Tax Agreements';
      case UpgradeAccountPageStep.signingBrokerAgreement:
        return 'Signing Broker Agreements';
      case UpgradeAccountPageStep.trustedContact:
        return 'Trusted Contact';
      case UpgradeAccountPageStep.riskDisclosure:
        return 'Risk Disclosure';
      case UpgradeAccountPageStep.reviewInformation:
        return 'Review Information';
      default:
        return '';
    }
  }
}

class AccountState extends Equatable {
  const AccountState(
      {this.status = AccountStatus.unknown,
      this.responseMessage = '',
      this.account,
      this.upgradeAccountRequest,
      this.currentStepIndex = 0,
      this.currentStepName = 'Basic Information'});

  final AccountStatus status;
  final String responseMessage;
  final GetAccountResponse? account;
  final UpgradeAccountRequest? upgradeAccountRequest;
  final int currentStepIndex;
  final String currentStepName;

  @override
  List<Object?> get props {
    return [
      status,
      responseMessage,
      account,
      upgradeAccountRequest,
      currentStepIndex,
      currentStepName,
    ];
  }

  AccountState copyWith({
    AccountStatus? status,
    String? responseMessage,
    GetAccountResponse? account,
    UpgradeAccountRequest? upgradeAccountRequest,
    int? currentStepIndex,
    String? currentStepName,
  }) {
    return AccountState(
      status: status ?? this.status,
      responseMessage: responseMessage ?? this.responseMessage,
      account: account ?? this.account,
      upgradeAccountRequest:
          upgradeAccountRequest ?? this.upgradeAccountRequest,
      currentStepIndex: currentStepIndex ?? this.currentStepIndex,
      currentStepName: currentStepName ?? this.currentStepName,
    );
  }
}

class EnableBasicInformationNextButton extends AccountState {}

class OnfidoSdkToken extends AccountState {
  final String token;

  const OnfidoSdkToken(this.token);
}

class OnfidoResultUpdated extends AccountState {
  final OnfidoResultResponse response;

  const OnfidoResultUpdated(this.response);
}

class TaxInfoSubmitted extends AccountState {}
