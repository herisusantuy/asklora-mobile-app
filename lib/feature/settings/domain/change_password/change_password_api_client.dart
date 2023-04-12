import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../core/data/remote/asklora_api_client.dart';
import 'change_password_request.dart';

class ChangePasswordApiClient {
  Future<Response> changePassword(ChangePasswordRequest request) async {
    var response = await AskloraApiClient()
        .post(endpoint: '', payload: json.encode(request.toJson()));
    return response;
  }
}
