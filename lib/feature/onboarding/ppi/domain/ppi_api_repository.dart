import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../core/data/remote/ppi_api_client.dart';
import '../../../../core/domain/endpoints.dart';
import 'bot_submission_request.dart';
import 'ppi_user_response_request.dart';

class PpiApiRepository {
  Future<Response> getQuestions() async =>
      await PpiApiClient().get(endpoint: endpointQuestion);

  Future<Response> postQuestionAnswer(PpiSelectionRequest request) async =>
      await PpiApiClient().post(
          endpoint: endpointAddAnswer, payload: json.encode(request.toJson()));

  Future<Response> postBulkAnswer(List<PpiSelectionRequest> request) async =>
      await PpiApiClient()
          .post(endpoint: endpointAddAnswer, payload: jsonEncode(request));

  Future<Response> postBotChoice(BotSubmissionRequest request) async =>
      await PpiApiClient().post(
          endpoint: endpointAddBotChoice,
          payload: json.encode(request.toJson()));
}
