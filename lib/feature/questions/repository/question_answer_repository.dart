import '../domain/endpoint_response.dart';
import '../domain/polyu_project_api_client.dart';
import '../domain/user_response_request.dart';
import 'bot_recommendation_repository.dart';

class UserResponseRepository {
  static UserResponseRepository? _instance;

  factory UserResponseRepository() => _instance ??= UserResponseRepository._();

  UserResponseRepository._();

  final BotRecommendationRepository botRecommendationRepository =
      BotRecommendationRepository();

  final QuestionApiClient _polyUApiClient = QuestionApiClient();

  Future<EndpointResponse> addAnswer(
      UserResponseRequest answerQuestionRequest) async {
    var response =
        await _polyUApiClient.postQuestionAnswer(answerQuestionRequest);

    var endPointResponse = EndpointResponse.fromJson(response.data);

    botRecommendationRepository.recommendedBots =
        endPointResponse.snapshot?.botRecommended ?? [];

    return endPointResponse;
  }

  Future<EndpointResponse> addBulkAnswer(
      List<UserResponseRequest> answerQuestionRequest) async {
    var response = await _polyUApiClient.postBulkAnswer(answerQuestionRequest);

    var endPointResponse = EndpointResponse.fromJson(response.data);

    botRecommendationRepository.recommendedBots =
        endPointResponse.snapshot?.botRecommended ?? [];

    return endPointResponse;
  }
}
