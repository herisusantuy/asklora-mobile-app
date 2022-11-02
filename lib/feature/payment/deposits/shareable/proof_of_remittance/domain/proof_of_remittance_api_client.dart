import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../../../core/data/remote/asklora_api_client.dart';
import '../../../../../../core/domain/endpoints.dart';
import 'proof_of_remittance_request.dart';

class ProofOfRemittanceApiClient {
  Future<Response> submitProofOfRemittance(ProofOfRemittanceRequest request) async =>
      await AskloraApiClient().post(
          endpoint: endpointProofOfRemittance, payload: jsonEncode(request.toJson()));


}
