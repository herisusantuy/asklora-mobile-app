import 'package:equatable/equatable.dart';

import 'get_bank_account_response.dart';

class RegisteredBankAccount extends Equatable {
  late final List<BankDetail>? fpsBankAccount;
  late final List<BankDetail>? wireBankAccount;
  late final List<BankDetail>? eDdaBankAccount;

  RegisteredBankAccount(List<BankDetail> getBankAccountResponse) {
    fpsBankAccount = List.from((getBankAccountResponse)
        .where((bankDetail) => bankDetail.bankTransferType!.contains('FPS')));
    wireBankAccount = List.from((getBankAccountResponse)
        .where((bankDetail) => bankDetail.bankTransferType!.contains('WIRE')));
    eDdaBankAccount = List.from((getBankAccountResponse)
        .where((bankDetail) => bankDetail.bankTransferType!.contains('EDDA')));
  }

  @override
  List<Object?> get props => [fpsBankAccount, wireBankAccount, eDdaBankAccount];
}
