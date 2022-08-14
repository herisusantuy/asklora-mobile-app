import 'package:equatable/equatable.dart';

import 'get_bank_account_response.dart';

class RegisteredBankAccount extends Equatable {
  late final List<GetBankAccountResponse>? fpsBankAccount;
  late final List<GetBankAccountResponse>? wireBankAccount;
  late final List<GetBankAccountResponse>? eDdaBankAccount;

  RegisteredBankAccount(List<GetBankAccountResponse> getBankAccountResponse) {
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
