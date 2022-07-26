import 'dart:async';

import '../../../../core/domain/base_response.dart';
import '../domain/response.dart';
import '../domain/sign_up_api_client.dart';
import '../domain/sign_up_request.dart';

class SignUpRepository {
  final SignUpApiClient _signUpApiClient = SignUpApiClient();

  Future<BaseResponse<SignUpResponse>> signUp({
    required String email,
    required String password,
  }) async {
    var response =
        await _signUpApiClient.signUp(SignUpRequest(email, password));
    return BaseResponse.complete(SignUpResponse.fromJson(response.data));
  }
}
