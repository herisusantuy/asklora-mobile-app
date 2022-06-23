import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../core/domain/endpoints.dart';
import 'sign_up_request.dart';

import '../../../../core/domain/asklora/asklora_api_client.dart';

class SignUpApiClient {
  static SignUpApiClient? _instance;

  factory SignUpApiClient() => _instance ??= SignUpApiClient._();

  SignUpApiClient._();

  Future<Response> signUp(SignUpRequest request) async {
    var response = await AskloraApiClient()
        .dio
        .post(endpointSignUp, data: json.encode(request.toJson()));
    return response;
  }
}
