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
  const AccountState({
    this.status = GetAccountStatus.unknown,
    this.responseMessage = '',
    this.account,
    this.upgradeAccountRequest,
    this.currentStepIndex = 0,
  });

  final GetAccountStatus status;
  final String responseMessage;
  final GetAccountResponse? account;
  final UpgradeAccountRequest? upgradeAccountRequest;
  final int currentStepIndex;

  @override
  List<Object?> get props {
    return [
      status,
      responseMessage,
      account,
      upgradeAccountRequest,
      currentStepIndex,
    ];
  }

  AccountState copyWith({
    GetAccountStatus? status,
    String? responseMessage,
    GetAccountResponse? account,
    UpgradeAccountRequest? upgradeAccountRequest,
    int? currentStepIndex,
  }) {
    return AccountState(
      status: status ?? this.status,
      responseMessage: responseMessage ?? this.responseMessage,
      account: account ?? this.account,
      upgradeAccountRequest:
          upgradeAccountRequest ?? this.upgradeAccountRequest,
      currentStepIndex: currentStepIndex ?? this.currentStepIndex,
    );
  }

  // bool disableNextButton() {
  //   if (firstName.isEmpty ||
  //       middleName.isEmpty ||
  //       lastName.isEmpty ||
  //       chineseName.isEmpty ||
  //       gender.isEmpty ||
  //       dateOfBirth.isEmpty ||
  //       countryCode.isEmpty ||
  //       phoneNumber.isEmpty ||
  //       countryOfCitizenship.isEmpty) {
  //     return true;
  //   }
  //   return false;
  // }
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
