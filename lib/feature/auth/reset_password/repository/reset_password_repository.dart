import 'dart:async';

import '../domain/reset_password_api_client.dart';
import '../domain/reset_password_request.dart';
import '../domain/reset_password_response.dart';

class ResetPasswordRepository {
  late ResetPasswordApiClient _resetPasswordApiClient;

  ResetPasswordRepository(){
    _resetPasswordApiClient = ResetPasswordApiClient();
  }

  Future<ResetPasswordResponse> resetPassword({required String email}) async {
    var response = await _resetPasswordApiClient.resetPassword(
      ResetPasswordRequest(email),
    );
    return ResetPasswordResponse.fromJson(response.data);
  }
}
