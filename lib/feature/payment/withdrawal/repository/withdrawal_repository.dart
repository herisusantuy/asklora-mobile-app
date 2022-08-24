import '../../../../core/domain/base_response.dart';
import '../domain/withdrawal_api_client.dart';
import '../domain/withdrawal_request.dart';
import '../domain/withdrawal_response.dart';

class WithdrawalRepository {
  final WithdrawalApiClient _paymentApiClient = WithdrawalApiClient();

  Future<BaseResponse<WithdrawalResponse>> submitWithdrawal({
    required WithdrawalRequest withdrawalRequest,
  }) async {
    var response = await _paymentApiClient.submitWithdrawal(withdrawalRequest);
    return BaseResponse.complete(WithdrawalResponse.fromJson(response.data));
  }
}
