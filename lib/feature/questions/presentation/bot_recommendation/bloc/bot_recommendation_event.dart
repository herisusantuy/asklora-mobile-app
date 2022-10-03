part of 'bot_recommendation_bloc.dart';

abstract class BotRecommendationEvent extends Equatable {
  BotRecommendationEvent() : super();

  final int timeStamp = DateTime.now().millisecondsSinceEpoch;

  @override
  List<Object> get props => [timeStamp];
}

class BotSelected extends BotRecommendationEvent {
  final RecommendedBot recommendedBot;

  BotSelected(this.recommendedBot);
}

class LoadBots extends BotRecommendationEvent {}

class SubmitBots extends BotRecommendationEvent {}
