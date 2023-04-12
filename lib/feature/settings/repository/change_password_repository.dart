import '../../../core/domain/base_response.dart';
import '../domain/change_password/change_password_api_client.dart';
import '../domain/change_password/change_password_request.dart';
import '../domain/change_password/change_password_response.dart';

class ChangePasswordRepository {
  final ChangePasswordApiClient _changePasswordApiClient =
      ChangePasswordApiClient();

  Future<BaseResponse<ChangePasswordResponse>> changePassword({
    required String password,
    required String newPassword,
    required String confirmNewPassword,
  }) async {
    try {
      var response = await _changePasswordApiClient.changePassword(
          ChangePasswordRequest(password, newPassword, confirmNewPassword));
      return BaseResponse.complete(
          ChangePasswordResponse.fromJson(response.data));
    } catch (e) {
      return BaseResponse.error();
    }
  }
}
