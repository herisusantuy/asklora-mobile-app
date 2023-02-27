import 'dart:async';

import '../../../../core/domain/base_response.dart';
import '../domain/forgot_password_api_client.dart';
import '../domain/forgot_password_request.dart';
import '../domain/forgot_password_response.dart';

class ForgotPasswordRepository {
  final ForgotPasswordApiClient _forgotPasswordApiClient =
      ForgotPasswordApiClient();

  Future<BaseResponse<ForgotPasswordResponse>> forgotPassword(
      {required String email}) async {
    var response = await _forgotPasswordApiClient.forgotPassword(
      ForgotPasswordRequest(email),
    );
    return BaseResponse.complete(
        ForgotPasswordResponse.fromJson(response.data));
  }
}
