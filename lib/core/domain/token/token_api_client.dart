import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../core/domain/asklora/asklora_api_client.dart';
import '../../../../core/domain/endpoints.dart';
import 'token_refresh_request.dart';
import 'token_verify_request.dart';

class TokenApiClient {
  Future<Response> verify(TokenVerifyRequest request) async {
    var response = await AskloraApiClient()
        .dio
        .post(endpointTokenVerify, data: jsonEncode(request.toJson()));
    return response;
  }

  Future<Response> refresh(TokenRefreshRequest request) async {
    var response = await AskloraApiClient()
        .dio
        .post(endpointTokenRefresh, data: jsonEncode(request.toJson()));
    return response;
  }
}
