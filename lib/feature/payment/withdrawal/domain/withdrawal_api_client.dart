import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../../../core/data/remote/asklora_api_client.dart';
import '../../../../../../core/domain/endpoints.dart';
import 'withdrawal_request.dart';

class WithdrawalApiClient {
  Future<Response> submitWithdrawal(WithdrawalRequest request) async =>
      await AskloraApiClient().post(
          endpoint: endpointWithdrawal, payload: jsonEncode(request.toJson()));
}
