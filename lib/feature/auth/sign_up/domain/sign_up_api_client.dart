import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'sign_up_request.dart';

import '../../../../core/domain/asklora/asklora_api_client.dart';

class SignUpApiClient {
  static SignUpApiClient? _instance;

  factory SignUpApiClient() => _instance ??= SignUpApiClient._();

  SignUpApiClient._();

  Future<Response> signUp(SignUpRequest request) async {
    var response = await AskLoraApiClient()
        .dio
        .post('/api/v1/accounts/', data: json.encode(request.toJson()));
    return response;
  }
}
