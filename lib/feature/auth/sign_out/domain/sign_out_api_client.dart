import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../core/domain/asklora/asklora_api_client.dart';
import '../../../../core/domain/endpoints.dart';
import 'sign_out_request.dart';

class SignOutApiClient {
  Future<Response> signOut(SignOutRequest request) async {
    var response = await AskloraApiClient()
        .dio
        .post(endpointSignOut, data: jsonEncode(request.toJson()));
    return response;
  }
}
