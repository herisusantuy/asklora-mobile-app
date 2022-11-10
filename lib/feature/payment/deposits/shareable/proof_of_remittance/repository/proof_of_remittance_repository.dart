import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';

import '../../../../../../core/domain/base_response.dart';
import '../domain/proof_of_remittance_api_client.dart';
import '../domain/proof_of_remittance_request.dart';
import '../domain/proof_of_remittance_response.dart';

class ProofOfRemittanceRepository {
  final ProofOfRemittanceApiClient _proofOfRemittanceApiClient =
      ProofOfRemittanceApiClient();

  Future<BaseResponse<ProofOfRemittanceResponse>> submitProofOfRemittance({
    required double depositAmount,
    required List<PlatformFile> platformFiles,
  }) async {
    List<ProofFile> proofFiles = [];
    for (var element in platformFiles) {
      final bytes = File(element.path!).readAsBytesSync();
      proofFiles.add(ProofFile('data:image/png;base64,${base64Encode(bytes)}'));
    }
    var response = await _proofOfRemittanceApiClient.submitProofOfRemittance(
        ProofOfRemittanceRequest(depositAmount, proofFiles));

    return BaseResponse.complete(
        ProofOfRemittanceResponse.fromJson(response.data));
  }
}
