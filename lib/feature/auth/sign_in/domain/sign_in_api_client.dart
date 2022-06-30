import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../core/domain/asklora/asklora_api_client.dart';
import '../../../../core/domain/endpoints.dart';
import 'sign_in_request.dart';

class SignInApiClient {
  Future<Response> signIn(SignInRequest request) async {
    var response = await AskloraApiClient()
        .dio
        .post(endpointSignIn, data: jsonEncode(request.toJson()));
    return response;
  }
}
