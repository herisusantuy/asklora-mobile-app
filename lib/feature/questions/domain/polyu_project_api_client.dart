import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../core/data/remote/asklora_api_client.dart';
import '../../../core/domain/endpoints.dart';
import 'add_user_request.dart';
import 'bot_submission_request.dart';
import 'user_response_request.dart';

class QuestionApiClient {
  Future<Response> getQuestions() async =>
      await AskloraApiClient().get(endpoint: question);

  Future<Response> postQuestionAnswer(UserResponseRequest request) async =>
      await AskloraApiClient()
          .post(endpoint: addAnswer, payload: json.encode(request.toJson()));

  Future<Response> postBulkAnswer(List<UserResponseRequest> request) async =>
      await AskloraApiClient()
          .post(endpoint: addAnswer, payload: jsonEncode(request));

  Future<Response> postUser(AddUserRequest request) async =>
      await AskloraApiClient()
          .post(endpoint: addUser, payload: json.encode(request.toJson()));

  Future<Response> postBotChoice(BotSubmissionRequest request) async =>
      await AskloraApiClient()
          .post(endpoint: addBotChoice, payload: json.encode(request.toJson()));
}
