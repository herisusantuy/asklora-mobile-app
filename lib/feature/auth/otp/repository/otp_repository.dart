import 'dart:async';

import '../../../../core/domain/otp/get_otp_client.dart';
import '../../../../core/domain/otp/get_otp_request.dart';
import '../../../../core/domain/otp/verify_otp_request.dart';
import '../../sign_up/domain/response.dart';

class OtpRepository {
  late GetOtpClient _getOtpApiClient;

  OtpRepository() {
    _getOtpApiClient = GetOtpClient();
  }

  Future<GetOtpResponse> getOtp({
    required GetOtpRequest getOtpRequest,
  }) async {
    var response = await _getOtpApiClient.getOtp(getOtpRequest);
    return GetOtpResponse.fromJson(response.data);
  }

  Future<GetOtpResponse> verifyOtp({
    required VerifyOtpRequest verifyOtpRequest,
  }) async {
    var response = await _getOtpApiClient.verifyOtp(verifyOtpRequest);
    return GetOtpResponse.fromJson(response.data);
  }
}
