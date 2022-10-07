import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../core/data/remote/asklora_api_client.dart';
import '../../../core/domain/endpoints.dart';
import 'bot_submission_request.dart';
import 'ppi_user_response_request.dart';

class PpiApiClient {
  Future<Response> getQuestions() async =>
      await AskloraApiClient().get(endpoint: question);

  Future<Response> postQuestionAnswer(PpiUserResponseRequest request) async =>
      await AskloraApiClient()
          .post(endpoint: addAnswer, payload: json.encode(request.toJson()));

  Future<Response> postBulkAnswer(List<PpiUserResponseRequest> request) async =>
      await AskloraApiClient()
          .post(endpoint: addAnswer, payload: jsonEncode(request));

  Future<Response> postBotChoice(BotSubmissionRequest request) async =>
      await AskloraApiClient()
          .post(endpoint: addBotChoice, payload: json.encode(request.toJson()));
}
