import 'dart:async';

import '../../../../core/domain/token/repository/repository.dart';
import '../domain/sign_out_api_client.dart';
import '../domain/sign_out_request.dart';
import '../domain/sign_out_response.dart';

class SignOutRepository {
  final SignOutApiClient _signOutApiClient = SignOutApiClient();

  final Repository _storage;

  SignOutRepository(this._storage);

  Future<SignOutResponse> signOut() async {
    var refreshToken = await _storage.getRefreshToken();
    await _storage.deleteAll();
    var response =
        await _signOutApiClient.signOut(SignOutRequest(refreshToken));
    var signOutResponse = SignOutResponse.fromJson(response.data);
    return signOutResponse;
  }
}
