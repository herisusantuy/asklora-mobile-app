part of 'withdrawal_bank_detail_bloc.dart';

class WithdrawalBankDetailState extends Equatable {
  final String accountNumber;
  final String bankName;
  final String bankNumber;
  final String accountName;
  final bool nextButtonDisable;

  const WithdrawalBankDetailState(
      {this.accountNumber = '',
      this.bankName = '',
      this.bankNumber = '',
      this.accountName = '',
      this.nextButtonDisable = true})
      : super();

  @override
  List<Object> get props => [accountNumber, bankName, bankNumber, accountName];

  WithdrawalBankDetailState copyWith(
      {String? accountNumber,
      String? bankName,
      String? bankNumber,
      String? accountName,
      bool? nextButtonDisable}) {
    return WithdrawalBankDetailState(
      accountNumber: accountNumber ?? this.accountNumber,
      bankName: bankName ?? this.bankName,
      bankNumber: bankNumber ?? this.bankNumber,
      accountName: accountName ?? this.accountName,
      nextButtonDisable: _nextButtonDisable,
    );
  }

  bool get _nextButtonDisable {
    if (accountNumber.isNotEmpty &&
        accountName.isNotEmpty &&
        bankNumber.isNotEmpty &&
        bankName.isNotEmpty) {
      return false;
    } else {
      return true;
    }
  }
}
