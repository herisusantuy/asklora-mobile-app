import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../core/domain/endpoints.dart';
import '../../../ai/investment_style_question/domain/investment_style_question_query_request.dart';
import '../remote/lora_gpt_client.dart';
import 'portfolio_query_request.dart';

class LoraGptClient {
  static LoraGptClient? _instance;

  factory LoraGptClient() => _instance ??= LoraGptClient._();

  LoraGptClient._();

  Future<Response> general(Map<String, String> params) async =>
      await LoraGptApiClient()
          .get(endpoint: endpointChat, queryParameters: params);

  Future<Response> portfolioDetails(Map<String, String> params) async =>
      await LoraGptApiClient()
          .get(endpoint: endpointPortfolioDetailPage, queryParameters: params);

  Future<Response> portfolio(
      {required Map<String, dynamic> params,
      required List<Botstock> payload}) async {
    var json = jsonEncode(payload.map((e) => e.toJson()).toList());
    return await LoraGptApiClient().post(
        endpoint: endpointPortfolio, queryParameters: params, payload: json);
  }

  Future<Response> investmentStyle(
          InvestmentStyleQuestionQueryRequest request) async =>
      await LoraGptApiClient().get(
          endpoint: endpointInvestmentStyle, queryParameters: request.toJson());
}
