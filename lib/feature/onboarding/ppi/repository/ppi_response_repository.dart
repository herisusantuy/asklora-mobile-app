import '../domain/ppi_api_repository.dart';
import '../domain/ppi_user_response.dart';
import '../domain/ppi_user_response_request.dart';
import 'bot_recommendation_repository.dart';

class PpiResponseRepository {
  static PpiResponseRepository? _instance;

  factory PpiResponseRepository() => _instance ??= PpiResponseRepository._();

  PpiResponseRepository._();

  final BotRecommendationRepository botRecommendationRepository =
      BotRecommendationRepository();

  final PpiApiRepository _ppiApiRepository = PpiApiRepository();

  Future<PpiUserResponse> addAnswer(
      PpiSelectionRequest ppiUserResponseRequest) async {
    var response =
        await _ppiApiRepository.postQuestionAnswer(ppiUserResponseRequest);

    var ppiUserResponse = PpiUserResponse.fromJson(response.data);

    botRecommendationRepository.recommendedBots =
        ppiUserResponse.snapshot?.botRecommended ?? [];

    return ppiUserResponse;
  }

  Future<PpiUserResponse> addBulkAnswer(
      List<PpiSelectionRequest> ppiUserResponseRequest) async {
    var response =
        await _ppiApiRepository.postBulkAnswer(ppiUserResponseRequest);

    var ppiUserResponse = PpiUserResponse.fromJson(response.data);

    botRecommendationRepository.recommendedBots =
        ppiUserResponse.snapshot?.botRecommended ?? [];

    return ppiUserResponse;
  }

  Future<String> getUserSnapShot(int userId) async {
    var response = await _ppiApiRepository.getUserSnapshot(userId);

    //var ppiUserResponse = PpiUserResponse.fromJson(response.data);

    return response.toString();
  }
}
