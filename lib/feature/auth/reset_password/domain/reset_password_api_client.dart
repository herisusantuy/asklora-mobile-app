import 'dart:convert';
import 'package:dio/dio.dart';

import '../../../../core/domain/endpoints.dart';
import 'reset_password_request.dart';
import '../../../../core/domain/asklora/asklora_api_client.dart';

class ResetPasswordApiClient {
  Future<Response> resetPassword(ResetPasswordRequest request) async {
    var response = await AskloraApiClient().dio.post(
          endpointResetPassword,
          data: json.encode(
            request.toJson(),
          ),
        );
    return response;
  }
}
