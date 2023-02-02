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

class FetchBotPortfolio extends PortfolioEvent {
  final BotStockFilter botStockFilter;

  const FetchBotPortfolio({this.botStockFilter = BotStockFilter.all});
}

class FetchChartData extends PortfolioEvent {}
