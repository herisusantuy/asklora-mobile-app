import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../core/data/remote/asklora_api_client.dart';
import '../../../../core/domain/endpoints.dart';
import '../../../core/data/remote/ppi_api_client.dart';
import 'bot_detail_request.dart';
import 'orders/bot_create_order_request.dart';
import 'orders/bot_order_request.dart';

class BotStockApiClient {
  Future<Response> fetchBotRecommendation(String accountId) async =>
      await PpiApiClient()
          .get(endpoint: '$endpointBotRecommendation/$accountId');

  Future<Response> fetchBotDetail(BotDetailRequest request) async =>
      await AskloraApiClient().post(
          endpoint: endpointBotDetail, payload: jsonEncode(request.toJson()));

  Future<Response> activeOrder() async =>
      await AskloraApiClient().get(endpoint: endpointBotActiveOrder);

  Future<Response> createOrder(BotCreateOrderRequest request) async =>
      await AskloraApiClient().post(
          endpoint: endpointBotCreateOrder,
          payload: jsonEncode(request.toJson()));

  Future<Response> cancelOrder(BotOrderRequest request) async =>
      await AskloraApiClient().post(
          endpoint: endpointBotCancelOrder,
          payload: jsonEncode(request.toJson()));

  Future<Response> rolloverOrder(BotOrderRequest request) async =>
      await AskloraApiClient().post(
          endpoint: endpointBotRolloverOrder,
          payload: jsonEncode(request.toJson()));

  Future<Response> terminateOrder(BotOrderRequest request) async =>
      await AskloraApiClient().post(
          endpoint: endpointBotTerminateOrder,
          payload: jsonEncode(request.toJson()));
}
