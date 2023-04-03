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

class BotCreateOrder extends BotStockEvent {
  final BotRecommendationModel botRecommendationModel;
  final double tradeBotStockAmount;

  const BotCreateOrder(
      {required this.botRecommendationModel,
      required this.tradeBotStockAmount});

  @override
  List<Object> get props => [botRecommendationModel, tradeBotStockAmount];
}

class TradeBotStockAmountChanged extends BotStockEvent {
  final double amount;

  const TradeBotStockAmountChanged(this.amount);

  @override
  List<Object> get props => [amount];
}

class FetchBotDetail extends BotStockEvent {
  final String ticker;
  final String botId;

  const FetchBotDetail({required this.ticker, required this.botId});

  @override
  List<Object> get props => [ticker, botId];
}
