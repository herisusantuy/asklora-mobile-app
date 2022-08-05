part of 'bank_details_bloc.dart';

enum CompleteStep { firstStep, secondStep }

class BankDetailsState extends Equatable {
  final String bankAccountNumber;
  final String confirmBankAccountNumber;
  final BaseResponse response;

  const BankDetailsState(
      {this.bankAccountNumber = '',
      this.confirmBankAccountNumber = '',
      this.response = const BaseResponse()})
      : super();

  @override
  List<Object> get props =>
      [bankAccountNumber, confirmBankAccountNumber, response];

  BankDetailsState copyWith({
    String? bankAccountNumber,
    String? confirmBankAccountNumber,
    BaseResponse? response,
  }) {
    return BankDetailsState(
        bankAccountNumber: bankAccountNumber ?? this.bankAccountNumber,
        confirmBankAccountNumber:
            confirmBankAccountNumber ?? this.confirmBankAccountNumber,
        response: response ?? this.response);
  }
}
