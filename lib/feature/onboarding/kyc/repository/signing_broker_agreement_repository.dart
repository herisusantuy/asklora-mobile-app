import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:signature/signature.dart';
import 'package:url_launcher/url_launcher.dart';

class SigningBrokerAgreementRepository {
  SigningBrokerAgreementRepository();

  Future<bool> openAlpacaCustomerAgreement(String filePath) async {
    try {
      await launchUrl(Uri.parse(filePath),
          mode: LaunchMode.externalApplication);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<String> getCustomerSignature(List<Point>? points) async {
    final exportController = SignatureController(
      penStrokeWidth: 2,
      penColor: Colors.black,
      exportBackgroundColor: Colors.transparent,
      points: points,
    );
    final bytes = await exportController.toPngBytes();
    return bytes != null ? base64Encode(bytes) : '';
  }
}
