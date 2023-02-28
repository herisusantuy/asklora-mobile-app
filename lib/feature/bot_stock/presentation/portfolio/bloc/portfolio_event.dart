part of 'portfolio_bloc.dart';

abstract class PortfolioEvent extends Equatable {
  const PortfolioEvent();

  @override
  List<Object> get props => [];
}

class BotStockFilterChanged extends PortfolioEvent {
  final BotStockFilter botStockFilter;

  const BotStockFilterChanged(this.botStockFilter);
}

class FetchPortfolio extends PortfolioEvent {}

class FetchBotPortfolio extends PortfolioEvent {
  final BotStockFilter botStockFilter;

  const FetchBotPortfolio({this.botStockFilter = BotStockFilter.all});
}

class FetchBotPortfolioDetail extends PortfolioEvent {
  final String ticker;
  final String botId;

  const FetchBotPortfolioDetail({required this.ticker, required this.botId});
}

class CurrencyChanged extends PortfolioEvent {
  final CurrencyType currencyType;

  const CurrencyChanged(this.currencyType) : super();

  @override
  List<Object> get props => [currencyType];
}

class RolloverBotStock extends PortfolioEvent {
  final PortfolioBotModel portfolioBotModel;

  const RolloverBotStock(this.portfolioBotModel);

  @override
  List<Object> get props => [portfolioBotModel];
}

class EndBotStock extends PortfolioEvent {
  final PortfolioBotModel portfolioBotModel;

  const EndBotStock(this.portfolioBotModel);

  @override
  List<Object> get props => [portfolioBotModel];
}
