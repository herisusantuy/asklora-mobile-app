import '../../../../core/domain/base_response.dart';
import '../../../../main.dart';
import '../../../../mock/mock_data.dart';
import '../domain/withdrawal_api_client.dart';
import '../domain/withdrawal_request.dart';
import '../domain/withdrawal_response.dart';

class WithdrawalRepository {
  final WithdrawalApiClient _paymentApiClient = WithdrawalApiClient();

  Future<BaseResponse<WithdrawalResponse>> submitWithdrawal({
    required WithdrawalRequest withdrawalRequest,
  }) async {
    if (isDemoEnable) {
      ///MOCK
      await Future.delayed(const Duration(seconds: 1));
      return MockData().saveWithdrawal(double.parse(withdrawalRequest.amount));
    } else {
      ///REAL
      var response =
          await _paymentApiClient.submitWithdrawal(withdrawalRequest);
      return BaseResponse.complete(WithdrawalResponse.fromJson(response.data));
    }
  }
}
