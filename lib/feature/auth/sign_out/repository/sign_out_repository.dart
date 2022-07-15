import 'dart:async';
import 'dart:io';

import '../domain/sign_out_api_client.dart';
import '../domain/sign_out_request.dart';

class SignOutRepository {
  final SignOutApiClient _signOutApiClient = SignOutApiClient();

  Future<bool> signOut(String? token) async {
    var response = await _signOutApiClient.signOut(SignOutRequest(token));
    return response.statusCode == HttpStatus.resetContent;
  }
}
