part of 'bot_stock_bloc.dart';

abstract class BotStockEvent extends Equatable {
  const BotStockEvent();

  @override
  List<Object> get props => [];
}

class FetchBotRecommendation extends BotStockEvent {}

class FetchBotPortfolio extends BotStockEvent {
  final BotStockFilter botStockFilter;

  const FetchBotPortfolio({this.botStockFilter = BotStockFilter.all});
}

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

class FetchChartData extends BotStockEvent {}
