import '../domain/bot_submission_request.dart';
import '../domain/ppi_api_client.dart';
import '../domain/ppi_user_response.dart';

class BotChoiceRepository {
  static BotChoiceRepository? _instance;

  factory BotChoiceRepository() => _instance ??= BotChoiceRepository._();

  BotChoiceRepository._();

  final PpiApiClient _ppiApiClient = PpiApiClient();

  Future<PpiUserResponse> addAnswer(
      BotSubmissionRequest botSubmissionRequest) async {
    var response = await _ppiApiClient.postBotChoice(botSubmissionRequest);

    return PpiUserResponse.fromJson(response.data);
  }
}
