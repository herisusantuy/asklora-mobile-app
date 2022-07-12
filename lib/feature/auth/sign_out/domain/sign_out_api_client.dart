import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../core/data/remote/asklora_api_client.dart';
import '../../../../core/domain/endpoints.dart';
import 'sign_out_request.dart';

class SignOutApiClient {
  Future<Response> signOut(SignOutRequest request) async =>
      await AskloraApiClient().post(
          endpoint: endpointSignOut, payload: jsonEncode(request.toJson()));
}
