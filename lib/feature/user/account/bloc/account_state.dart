part of 'account_bloc.dart';

enum GetAccountStatus {
  success,
  failure,
  unknown,
  fetchingAccount,
  upgradingAccount,
  fetchOnfidoToken
}

class AccountState extends Equatable {
  const AccountState(
      {this.status = GetAccountStatus.unknown,
      this.responseMessage = '',
      this.account});

  final GetAccountStatus status;
  final String responseMessage;
  final GetAccountResponse? account;

  @override
  List<Object?> get props => [status, responseMessage, account];

  AccountState copyWith({
    GetAccountStatus? status,
    String? responseMessage,
    GetAccountResponse? account,
  }) {
    return AccountState(
      status: status ?? this.status,
      responseMessage: responseMessage ?? this.responseMessage,
      account: account ?? this.account,
    );
  }
}

class OnfidoSdkToken extends AccountState {
  final String token;

  const OnfidoSdkToken(this.token);
}
