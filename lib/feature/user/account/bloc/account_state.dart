part of 'account_bloc.dart';

enum GetAccountStatus {
  success,
  failure,
  unknown,
  fetchingAccount,
  upgradingAccount,
  fetchingOnfidoToken
}

enum Gender { femail, male, other, unknown }

class AccountState extends Equatable {
  const AccountState(
      {this.status = GetAccountStatus.unknown,
      this.responseMessage = '',
      this.account,
      this.upgradeAccountRequest,
      this.contact,
      this.identity,
      this.disclosures,
      this.agreements});

  final GetAccountStatus status;
  final String responseMessage;
  final GetAccountResponse? account;
  final UpgradeAccountRequest? upgradeAccountRequest;
  final Map<String, dynamic>? contact;
  final Map<String, dynamic>? identity;
  final Map<String, dynamic>? disclosures;
  final Map<String, dynamic>? agreements;

  @override
  List<Object?> get props {
    return [
      status,
      responseMessage,
      account,
      upgradeAccountRequest,
      contact,
      identity,
      disclosures,
      agreements
    ];
  }

  AccountState copyWith({
    GetAccountStatus? status,
    String? responseMessage,
    GetAccountResponse? account,
    UpgradeAccountRequest? upgradeAccountRequest,
    Map<String, dynamic>? contact,
    Map<String, dynamic>? identity,
    Map<String, dynamic>? disclosures,
    Map<String, dynamic>? agreements,
  }) {
    return AccountState(
      status: status ?? this.status,
      responseMessage: responseMessage ?? this.responseMessage,
      account: account ?? this.account,
      upgradeAccountRequest:
          upgradeAccountRequest ?? this.upgradeAccountRequest,
      contact: contact ?? this.contact,
      identity: identity ?? this.identity,
      disclosures: disclosures ?? this.disclosures,
      agreements: agreements ?? this.agreements,
    );
  }
}

class OnfidoSdkToken extends AccountState {
  final String token;

  const OnfidoSdkToken(this.token);
}
