part of 'select_bank_bloc.dart';

class SelectBankState extends Equatable {
  final BaseResponse response;

  const SelectBankState({
    this.response = const BaseResponse<List<BankDetails>>(
        state: ResponseState.loading, data: <BankDetails>[]),
  });

  SelectBankState copyWith({
    BaseResponse? response,
  }) {
    return SelectBankState(
      response: response ?? this.response,
    );
  }

  @override
  List<Object?> get props => [response];
}
