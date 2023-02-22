import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../core/data/remote/asklora_api_client.dart';
import '../../../../core/domain/endpoints.dart';
import 'sign_in_request.dart';
import 'sign_in_with_otp_request.dart';

class SignInApiClient {
  Future<Response> signIn(SignInRequest request) async =>
      await AskloraApiClient().post(
          endpoint: endpointSignIn, payload: jsonEncode(request.toJson()));

  Future<Response> signInWithOtp(SignInWithOtpRequest request) async =>
      await AskloraApiClient().post(
          endpoint: endpointSignIn, payload: jsonEncode(request.toJson()));
}
