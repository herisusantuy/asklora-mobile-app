import 'dart:async';

import '../domain/sign_in_api_client.dart';
import '../domain/sign_in_request.dart';
import '../domain/sign_in_response.dart';
import '../../../../core/utils/secure_storage.dart';

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
    var signResponse = SignInResponse.fromJson(response.data);
    await secureStorage.saveSecureData('token', signResponse.access!);
    return signResponse;
  }
}
