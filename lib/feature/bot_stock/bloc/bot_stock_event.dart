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
  final BotRecommendationModel botRecommendationModel;
  final double tradeBotStockAmount;

  const TradeBotStock(
      {required this.botRecommendationModel, required this.tradeBotStockAmount});

  @override
  List<Object> get props => [botRecommendationModel];
}

class TradeBotStockAmountChanged extends BotStockEvent {
  final double amount;

  const TradeBotStockAmountChanged(this.amount);

  @override
  List<Object> get props => [amount];
}

class EndBotStock extends BotStockEvent {
  final BotRecommendationModel botRecommendationModel;

  const EndBotStock(this.botRecommendationModel);

  @override
  List<Object> get props => [botRecommendationModel];
}

class RolloverBotStock extends BotStockEvent {
  final BotRecommendationModel botRecommendationModel;

  const RolloverBotStock(this.botRecommendationModel);

  @override
  List<Object> get props => [botRecommendationModel];
}

class FetchBotDetail extends BotStockEvent {
  final BotRecommendationModel botRecommendationModel;

  const FetchBotDetail(this.botRecommendationModel);

  @override
  List<Object> get props => [botRecommendationModel];
}
