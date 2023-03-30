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

class FetchActiveOrders extends PortfolioEvent {
  final BotStockFilter botStockFilter;

  const FetchActiveOrders({this.botStockFilter = BotStockFilter.all});
}

class FetchActiveOrderDetail extends PortfolioEvent {
  final String orderId;

  const FetchActiveOrderDetail({required this.orderId});
}

class CurrencyChanged extends PortfolioEvent {
  final CurrencyType currencyType;

  const CurrencyChanged(this.currencyType) : super();

  @override
  List<Object> get props => [currencyType];
}

class RolloverBotStock extends PortfolioEvent {
  final String botId;

  const RolloverBotStock(this.botId);

  @override
  List<Object> get props => [botId];
}

class EndBotStock extends PortfolioEvent {
  final String orderId;

  const EndBotStock(this.orderId);

  @override
  List<Object> get props => [orderId];
}
