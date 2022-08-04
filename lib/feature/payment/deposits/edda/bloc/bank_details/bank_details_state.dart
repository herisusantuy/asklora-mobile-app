part of 'bank_details_bloc.dart';

enum CompleteStep { firstStep, secondStep }

class BankDetailsState extends Equatable {
  final String bankAccountNumber;
  final BaseResponse response;

  const BankDetailsState(
      {this.bankAccountNumber = '',
      this.response = const BaseResponse<Never>()})
      : super();

  @override
  List<Object> get props => [bankAccountNumber, response];

  BankDetailsState copyWith({
    String? bankAccountNumber,
    BaseResponse? response,
  }) {
    return BankDetailsState(
        bankAccountNumber: bankAccountNumber ?? this.bankAccountNumber,
        response: response ?? this.response);
  }
}
