import '../domain/ppi_api_client.dart';
import '../domain/ppi_user_response.dart';
import '../domain/ppi_user_response_request.dart';
import 'bot_recommendation_repository.dart';

class PpiResponseRepository {
  static PpiResponseRepository? _instance;

  factory PpiResponseRepository() => _instance ??= PpiResponseRepository._();

  PpiResponseRepository._();

  final BotRecommendationRepository botRecommendationRepository =
      BotRecommendationRepository();

  final PpiApiClient _ppiApiClient = PpiApiClient();

  Future<PpiUserResponse> addAnswer(
      PpiSelectionRequest ppiUserResponseRequest) async {
    var response =
        await _ppiApiClient.postQuestionAnswer(ppiUserResponseRequest);

    var ppiUserResponse = PpiUserResponse.fromJson(response.data);

    botRecommendationRepository.recommendedBots =
        ppiUserResponse.snapshot?.botRecommended ?? [];

    return ppiUserResponse;
  }

  Future<PpiUserResponse> addBulkAnswer(
      List<PpiSelectionRequest> ppiUserResponseRequest) async {
    var response = await _ppiApiClient.postBulkAnswer(ppiUserResponseRequest);

    var ppiUserResponse = PpiUserResponse.fromJson(response.data);

    botRecommendationRepository.recommendedBots =
        ppiUserResponse.snapshot?.botRecommended ?? [];

    return ppiUserResponse;
  }
}
