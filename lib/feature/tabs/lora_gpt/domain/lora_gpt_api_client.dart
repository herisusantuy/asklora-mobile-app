import 'package:dio/dio.dart';

import '../../../../core/domain/endpoints.dart';
import '../remote/lora_gpt_client.dart';

class LoraGptClient {
  static LoraGptClient? _instance;

  factory LoraGptClient() => _instance ??= LoraGptClient._();

  LoraGptClient._();

  Future<Response> searchQuery(Map<String, String> params) async =>
      await LoraGptApiClient()
          .get(endpoint: endpointChat, queryParameters: params);
}
