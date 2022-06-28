part of 'get_account_bloc.dart';

enum GetAccountStatus { success, failure, unknown, loading }

class GetAccountState extends Equatable {
  const GetAccountState(
      {this.status = GetAccountStatus.unknown,
      this.responseMessage = '',
      this.account});

  final GetAccountStatus status;
  final String responseMessage;
  final GetAccountResponse? account;

  @override
  List<Object?> get props => [status, responseMessage, account];

  GetAccountState copyWith({
    GetAccountStatus? status,
    String? responseMessage,
    GetAccountResponse? account,
  }) {
    return GetAccountState(
      status: status ?? this.status,
      responseMessage: responseMessage ?? this.responseMessage,
      account: account ?? this.account,
    );
  }
}
