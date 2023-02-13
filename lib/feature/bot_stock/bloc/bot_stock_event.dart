part of 'bot_stock_bloc.dart';

abstract class BotStockEvent extends Equatable {
  const BotStockEvent();

  @override
  List<Object> get props => [];
}

class FetchBotRecommendation extends BotStockEvent {}

class FetchFreeBotRecommendation extends BotStockEvent {}

class FaqActiveIndexChanged extends BotStockEvent {
  final int faqActiveIndex;

  const FaqActiveIndexChanged(this.faqActiveIndex);
}

class GetFreeBotStock extends BotStockEvent {
  final RecommendedBot recommendedBot;

  const GetFreeBotStock(this.recommendedBot);

  @override
  List<Object> get props => [recommendedBot];
}

class EndBotStock extends BotStockEvent {
  final RecommendedBot recommendedBot;

  const EndBotStock(this.recommendedBot);

  @override
  List<Object> get props => [recommendedBot];
}

class FetchChartData extends BotStockEvent {}
