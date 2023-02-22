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

class TradeBotStock extends BotStockEvent {
  final RecommendedBot recommendedBot;
  final double tradeBotStockAmount;

  const TradeBotStock(
      {required this.recommendedBot, required this.tradeBotStockAmount});

  @override
  List<Object> get props => [recommendedBot];
}

class TradeBotStockAmountChanged extends BotStockEvent {
  final double amount;

  const TradeBotStockAmountChanged(this.amount);

  @override
  List<Object> get props => [amount];
}

class EndBotStock extends BotStockEvent {
  final RecommendedBot recommendedBot;

  const EndBotStock(this.recommendedBot);

  @override
  List<Object> get props => [recommendedBot];
}

class RolloverBotStock extends BotStockEvent {
  final RecommendedBot recommendedBot;

  const RolloverBotStock(this.recommendedBot);

  @override
  List<Object> get props => [recommendedBot];
}

class FetchChartData extends BotStockEvent {}
