import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../core/data/remote/asklora_api_client.dart';
import '../../../../core/domain/endpoints.dart';
import 'bot_detail_request.dart';

class BotStockApiClient {
  Future<Response> fetchBotRecommendation(String accountId) async =>
      await AskloraApiClient().get(endpoint: '$endpointBotDetail/$accountId');

  Future<Response> fetchBotDetail(BotDetailRequest request) async =>
      await AskloraApiClient().post(
          endpoint: endpointBotDetail, payload: jsonEncode(request.toJson()));
}
