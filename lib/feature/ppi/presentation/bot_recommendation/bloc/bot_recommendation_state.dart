part of 'bot_recommendation_bloc.dart';

class BotRecommendationState extends Equatable {
  final BaseResponse response;
  final List<RecommendedBot> botsSelected;

  const BotRecommendationState(
      {this.response = const BaseResponse(), this.botsSelected = const []})
      : super();

  BotRecommendationState copyWith(
      {BaseResponse? response, List<RecommendedBot>? botsSelected}) {
    return BotRecommendationState(
      response: response ?? this.response,
      botsSelected: botsSelected ?? this.botsSelected,
    );
  }

  @override
  List<Object> get props => [response, botsSelected];
}
