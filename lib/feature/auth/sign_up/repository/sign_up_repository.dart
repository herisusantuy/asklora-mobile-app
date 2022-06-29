import 'dart:async';
import '../domain/sign_up_api_client.dart';
import '../domain/sign_up_request.dart';
import '../domain/response.dart';

class SignUpRepository {
  late SignUpApiClient _signUpApiClient;

  //late GetOtpClient _getOtpClient;

  SignUpRepository() {
    _signUpApiClient = SignUpApiClient();
    //_getOtpClient = GetOtpClient();
  }

  Future<SignUpResponse> signUp({
    required String email,
    required String password,
  }) async {
    var response =
        await _signUpApiClient.signUp(SignUpRequest(email, password));
    return SignUpResponse.fromJson(response.data);
  }
}
