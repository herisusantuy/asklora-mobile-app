import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../core/data/remote/asklora_api_client.dart';
import '../../../../core/domain/endpoints.dart';
import 'reset_password_request.dart';

class ResetPasswordApiClient {
  Future<Response> resetPassword(ResetPasswordRequest request) async {
    var response = await AskloraApiClient().post(
      endpoint: endpointResetPassword,
      payload: json.encode(
        request.toJson(),
      ),
    );
    return response;
  }
}
