part of 'bank_details_bloc.dart';

class BankDetailsState extends Equatable {
  final String bankAccountNumber;
  final String confirmBankAccountNumber;
  final String bankAccountName;
  final String confirmBankAccountNumberErrorText;

  const BankDetailsState(
      {this.bankAccountNumber = '',
      this.confirmBankAccountNumber = '',
      this.bankAccountName = '',
      this.confirmBankAccountNumberErrorText = ''})
      : super();

  @override
  List<Object> get props =>
      [bankAccountNumber, confirmBankAccountNumber, bankAccountName];

  BankDetailsState copyWith(
      {String? bankAccountNumber,
      String? confirmBankAccountNumber,
      String? bankAccountName,
      String? confirmBankAccountNumberErrorText}) {
    return BankDetailsState(
        bankAccountNumber: bankAccountNumber ?? this.bankAccountNumber,
        confirmBankAccountNumber:
            confirmBankAccountNumber ?? this.confirmBankAccountNumber,
        bankAccountName: bankAccountName ?? this.bankAccountName,
        confirmBankAccountNumberErrorText: confirmBankAccountNumberErrorText ??
            this.confirmBankAccountNumberErrorText);
  }
}
