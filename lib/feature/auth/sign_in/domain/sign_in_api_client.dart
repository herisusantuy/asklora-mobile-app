import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../core/domain/asklora/asklora_api_client.dart';
import 'sign_in_request.dart';

class SignInApiClient {
  static SignInApiClient? _instance;

  factory SignInApiClient() => _instance ??= SignInApiClient._();

  SignInApiClient._();

  Future<Response> signIn(SignInRequest request) async {
    var response = await AskLoraApiClient()
        .dio
        .post('/api/v1/auth/', data: jsonEncode(request.toJson()));
    return response;
  }
}
