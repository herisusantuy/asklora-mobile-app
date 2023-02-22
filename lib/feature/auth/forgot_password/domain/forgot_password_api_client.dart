import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../core/data/remote/asklora_api_client.dart';
import '../../../../core/domain/endpoints.dart';
import 'forgot_password_request.dart';

class ForgotPasswordApiClient {
  Future<Response> forgotPassword(ForgotPasswordRequest request) async {
    var response = await AskloraApiClient().post(
      endpoint: endpointForgotPassword,
      payload: json.encode(
        request.toJson(),
      ),
    );
    return response;
  }
}
