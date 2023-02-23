import 'dart:async';

import '../../../../core/domain/base_response.dart';
import '../domain/reset_password_api_client.dart';
import '../domain/reset_password_request.dart';
import '../domain/reset_password_response.dart';

class ResetPasswordRepository {
  final ResetPasswordApiClient _resetPasswordApiClient =
      ResetPasswordApiClient();

  Future<BaseResponse<ResetPasswordResponse>> resetPassword(
      {required String token,
      required String password,
      required String confirmPassword}) async {
    var response = await _resetPasswordApiClient.resetPassword(
      ResetPasswordRequest(token, password, confirmPassword),
    );
    return BaseResponse.complete(ResetPasswordResponse.fromJson(response.data));
  }
}
