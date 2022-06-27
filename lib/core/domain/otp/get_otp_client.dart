import 'dart:convert';

import 'verify_otp_request.dart';
import 'package:dio/dio.dart';

import '../asklora/asklora_api_client.dart';
import '../endpoints.dart';
import 'get_otp_request.dart';

class GetOtpClient {
  static GetOtpClient? _instance;

  factory GetOtpClient() => _instance ??= GetOtpClient._();

  GetOtpClient._();

  Future<Response> getOtp(GetOtpRequest getOtpRequest) async {
    var response = await AskloraApiClient()
        .dio
        .post(endpointGetOtp, data: json.encode(getOtpRequest.toJson()));
    return response;
  }

  Future<Response> verifyOtp(VerifyOtpRequest verifyOtpRequest) async {
    var response = await AskloraApiClient().dio.post(endpointVerifyEmail,
        data: json.encode(verifyOtpRequest.toJson()));
    return response;
  }
}
