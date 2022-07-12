import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../core/data/remote/asklora_api_client.dart';
import '../../../../core/domain/endpoints.dart';
import 'sign_up_request.dart';

class SignUpApiClient {
  Future<Response> signUp(SignUpRequest request) async =>
      await AskloraApiClient().post(
          endpoint: endpointSignUp, payload: json.encode(request.toJson()));
}
