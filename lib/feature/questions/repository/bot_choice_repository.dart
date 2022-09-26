import '../domain/bot_submission_request.dart';
import '../domain/endpoint_response.dart';
import '../domain/polyu_project_api_client.dart';

class BotChoiceRepository {
  static BotChoiceRepository? _instance;

  factory BotChoiceRepository() => _instance ??= BotChoiceRepository._();

  BotChoiceRepository._();

  final QuestionApiClient _polyUApiClient = QuestionApiClient();

  Future<EndpointResponse> addAnswer(
      BotSubmissionRequest botSubmissionRequest) async {
    var response = await _polyUApiClient.postBotChoice(botSubmissionRequest);

    return EndpointResponse.fromJson(response.data);
  }
}
