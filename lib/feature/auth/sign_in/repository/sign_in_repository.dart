import 'dart:async';

import '../domain/sign_in_api_client.dart';
import '../domain/sign_in_request.dart';
import '../domain/sign_in_response.dart';

class SignInRepository {
  late SignInApiClient _signInApiClient;

  SignInRepository() {
    _signInApiClient = SignInApiClient();
  }

  Future<SignInResponse> signIn({
    required String email,
    required String password,
  }) async {
    var response =
        await _signInApiClient.signIn(SignInRequest(email, password));
    return SignInResponse.fromJson(response.data);
  }
}
