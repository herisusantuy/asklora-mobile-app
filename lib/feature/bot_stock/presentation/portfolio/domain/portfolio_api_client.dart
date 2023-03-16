import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../../core/data/remote/asklora_api_client.dart';
import '../../../../../core/domain/endpoints.dart';
import '../../../domain/bot_detail_request.dart';

class PortfolioApiClient {
  Future<Response> fetchPortfolioBotDetail(BotDetailRequest request) async =>
      await AskloraApiClient().post(
          endpoint: endpointBotDetail, payload: jsonEncode(request.toJson()));
}
