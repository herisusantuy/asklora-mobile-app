import 'dart:async';
import '../../../../core/domain/token/repository/repository.dart';
import '../domain/sign_in_api_client.dart';
import '../domain/sign_in_request.dart';
import '../domain/sign_in_with_otp_request.dart';
import '../domain/sign_in_response.dart';

class SignInRepository {
  final SignInApiClient _signInApiClient = SignInApiClient();

  final Repository _storage;

  SignInRepository(this._storage);

  Future<SignInResponse> signIn({
    required String email,
    required String password,
  }) async {
    var response =
        await _signInApiClient.signIn(SignInRequest(email, password));
    var signInResponse = SignInResponse.fromJson(response.data);
    if (response.statusCode == 200) {
      _storage.saveAccessToken(signInResponse.access!);
      _storage.saveRefreshToken(signInResponse.refresh!);
    }
    return signInResponse.copyWith(statusCode: response.statusCode);
  }

  Future<SignInResponse> signInWithOtp({
    required String otp,
    required String email,
    required String password,
  }) async {
    var response = await _signInApiClient
        .signInWithOtp(SignInWithOtpRequest(otp, email, password));
    var signInResponse = SignInResponse.fromJson(response.data);

    if (response.statusCode == 200) {
      _storage.saveAccessToken(signInResponse.access!);
      _storage.saveRefreshToken(signInResponse.refresh!);
    }
    return signInResponse.copyWith(statusCode: response.statusCode);
  }
}
