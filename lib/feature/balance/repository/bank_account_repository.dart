import '../../../core/domain/base_response.dart';
import '../../../main.dart';
import '../../../mock/mock_data.dart';
import '../deposit/utils/deposit_utils.dart';
import '../domain/bank_account_api_client.dart';
import '../domain/get_bank_account_response.dart';
import '../domain/registered_bank_accounts.dart';

class BankAccountRepository {
  final BankAccountApiClient _bankDetailsApiClient = BankAccountApiClient();

  Future<BaseResponse<RegisteredBankAccounts>> getBankAccount() async {
    if (isDemoEnable) {
      ///MOCK
      await Future.delayed(const Duration(milliseconds: 500));
      DepositType depositType = await MockData().getDepositType();
      return BaseResponse.complete(
          RegisteredBankAccounts(depositType == DepositType.firstTime
              ? []
              : const [
                  GetBankAccountResponse('', '', '', '123', 'Alex', '112233',
                      'FPS', '', 'Bank Central Asia', '', '', '')
                ]));
    } else {
      ///REAL
      var response = await _bankDetailsApiClient.getBankAccount();
      return BaseResponse.complete(RegisteredBankAccounts(
          List<GetBankAccountResponse>.from(response.data
              .map((model) => GetBankAccountResponse.fromJson(model)))));
    }
  }
}
