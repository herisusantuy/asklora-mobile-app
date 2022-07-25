part of 'withdrawal_bank_detail_bloc.dart';

class WithdrawalBankDetailState extends Equatable {
  final String accountNo, bankName, bankNo, accountName;
  final bool nextButtonDisable;

  const WithdrawalBankDetailState(
      {this.accountNo = '',
      this.bankName = '',
      this.bankNo = '',
      this.accountName = '',
      this.nextButtonDisable = true})
      : super();

  @override
  List<Object> get props => [accountNo, bankName, bankNo, accountName];

  WithdrawalBankDetailState copyWith(
      {String? accountNo,
      String? bankName,
      String? bankNo,
      String? accountName,
      bool? nextButtonDisable}) {
    return WithdrawalBankDetailState(
      accountNo: accountNo ?? this.accountNo,
      bankName: bankName ?? this.bankName,
      bankNo: bankNo ?? this.bankNo,
      accountName: accountName ?? this.accountName,
      nextButtonDisable: _nextButtonDisable,
    );
  }

  bool get _nextButtonDisable {
    if (accountNo.isNotEmpty &&
        accountName.isNotEmpty &&
        bankNo.isNotEmpty &&
        bankName.isNotEmpty) {
      return false;
    } else {
      return true;
    }
  }
}
