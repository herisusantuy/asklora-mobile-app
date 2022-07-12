part of 'account_bloc.dart';

enum GetAccountStatus {
  success,
  failure,
  unknown,
  fetchingAccount,
  upgradingAccount,
  fetchingOnfidoToken,
  submittingOnfidoResult,
}

class AccountState extends Equatable {
  const AccountState(
      {this.status = GetAccountStatus.unknown,
      this.responseMessage = '',
      this.account,
      this.upgradeAccountRequest,
      this.currentStepIndex = 0,
      this.currentStepName = 'Basic Information',
      this.isBasicInformationCompleted = false,
      this.isAddressProofCompleted = false,
      this.isFinancialProfileCompleted = false});

  final GetAccountStatus status;
  final String responseMessage;
  final GetAccountResponse? account;
  final UpgradeAccountRequest? upgradeAccountRequest;
  final int currentStepIndex;
  final String currentStepName;
  final bool isBasicInformationCompleted;
  final bool isAddressProofCompleted;
  final bool isFinancialProfileCompleted;

  @override
  List<Object?> get props {
    return [
      status,
      responseMessage,
      account,
      upgradeAccountRequest,
      currentStepIndex,
      currentStepName,
      isBasicInformationCompleted,
      isAddressProofCompleted,
      isFinancialProfileCompleted
    ];
  }

  AccountState copyWith(
      {GetAccountStatus? status,
      String? responseMessage,
      GetAccountResponse? account,
      UpgradeAccountRequest? upgradeAccountRequest,
      int? currentStepIndex,
      String? currentStepName,
      bool? isBasicInformationCompleted,
      bool? isAddressProofCompleted,
      bool? isFinancialProfileCompleted}) {
    return AccountState(
        status: status ?? this.status,
        responseMessage: responseMessage ?? this.responseMessage,
        account: account ?? this.account,
        upgradeAccountRequest:
            upgradeAccountRequest ?? this.upgradeAccountRequest,
        currentStepIndex: currentStepIndex ?? this.currentStepIndex,
        currentStepName: currentStepName ?? this.currentStepName,
        isBasicInformationCompleted:
            isBasicInformationCompleted ?? this.isBasicInformationCompleted,
        isAddressProofCompleted:
            isAddressProofCompleted ?? this.isAddressProofCompleted,
        isFinancialProfileCompleted:
            isFinancialProfileCompleted ?? this.isFinancialProfileCompleted);
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
