part of 'bank_account_bloc.dart';

class BankAccountState extends Equatable {
  final BaseResponse response;

  const BankAccountState({
    this.response = const BaseResponse(),
  }) : super();

  @override
  List<Object?> get props => [response];

  BankAccountState copyWith({
    BaseResponse? response,
  }) {
    return BankAccountState(
      response: response ?? this.response,
    );
  }
}
