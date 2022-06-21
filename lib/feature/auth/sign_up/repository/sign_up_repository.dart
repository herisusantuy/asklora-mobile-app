import 'dart:async';
import '../domain/sign_up_api_client.dart';
import '../domain/sign_up_request.dart';
import '../domain/sign_up_response.dart';

class SignUpRepository {
  late SignUpApiClient _signUpApiClient;

  SignUpRepository() {
    _signUpApiClient = SignUpApiClient();
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
