import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../../../core/data/remote/asklora_api_client.dart';
import '../../../../../../core/domain/endpoints.dart';
import 'deposit_request.dart';

class DepositApiClient {
  Future<Response> submitDeposit(DepositRequest request) async =>
      await AskloraApiClient().post(
          endpoint: endpointProofOfRemittance,
          payload: jsonEncode(request.toJson()));
}
