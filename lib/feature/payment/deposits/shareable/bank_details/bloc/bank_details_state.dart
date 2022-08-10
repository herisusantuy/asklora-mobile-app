part of 'bank_details_bloc.dart';

enum CompleteStep { eddaFirstStep, eddaSecondStep, others }

class BankDetailsState extends Equatable {
  final String bankAccountNumber;
  final String confirmBankAccountNumber;
  final String bankAccountName;
  final BaseResponse response;

  const BankDetailsState(
      {this.bankAccountNumber = '',
      this.confirmBankAccountNumber = '',
      this.bankAccountName = '',
      this.response = const BaseResponse()})
      : super();

  @override
  List<Object> get props =>
      [bankAccountNumber, confirmBankAccountNumber, bankAccountName, response];

  BankDetailsState copyWith({
    String? bankAccountNumber,
    String? confirmBankAccountNumber,
    String? bankAccountName,
    BaseResponse? response,
  }) {
    return BankDetailsState(
        bankAccountNumber: bankAccountNumber ?? this.bankAccountNumber,
        confirmBankAccountNumber:
            confirmBankAccountNumber ?? this.confirmBankAccountNumber,
        bankAccountName: bankAccountName ?? this.bankAccountName,
        response: response ?? this.response);
  }
}
