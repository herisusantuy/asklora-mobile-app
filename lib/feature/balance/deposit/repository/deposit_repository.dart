import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';

import '../../../../../../core/domain/base_response.dart';
import '../../../../main.dart';
import '../../../../mock/mock_data.dart';
import '../domain/deposit_api_client.dart';
import '../domain/deposit_request.dart';
import '../domain/deposit_response.dart';

class DepositRepository {
  final DepositApiClient _depositApiClient = DepositApiClient();

  Future<BaseResponse<DepositResponse>> submitDeposit({
    required double depositAmount,
    required List<PlatformFile> platformFiles,
  }) async {
    if (isDemoEnable) {
      ///MOCK
      await Future.delayed(const Duration(seconds: 1));
      MockData().saveDeposit(depositAmount);
      return BaseResponse.complete(const DepositResponse('Deposit success'));
    } else {
      ///REAL
      List<ProofFile> proofFiles = [];
      for (var element in platformFiles) {
        final bytes = File(element.path!).readAsBytesSync();
        proofFiles
            .add(ProofFile('data:image/png;base64,${base64Encode(bytes)}'));
      }
      var response = await _depositApiClient
          .submitDeposit(DepositRequest(depositAmount, proofFiles));

      return BaseResponse.complete(DepositResponse.fromJson(response.data));
    }
  }
}
