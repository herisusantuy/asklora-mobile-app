part of 'lora_gpt_bloc.dart';

abstract class LoraGptEvent extends Equatable {
  const LoraGptEvent();
}

class OnEditQuery extends LoraGptEvent {
  final String query;

  const OnEditQuery(this.query);

  @override
  List<Object?> get props => [query];
}

class OnSearchQuery extends LoraGptEvent {
  const OnSearchQuery();

  @override
  List<Object?> get props => [];
}

class OnPromptTap extends LoraGptEvent {
  final String query;
  const OnPromptTap(this.query);

  @override
  List<Object?> get props => [query];
}

class OnScreenLaunch extends LoraGptEvent {
  const OnScreenLaunch();

  @override
  List<Object?> get props => [];
}

class OnResetSession extends LoraGptEvent {
  const OnResetSession();

  @override
  List<Object?> get props => [];
}

class OnFinishTyping extends LoraGptEvent {
  const OnFinishTyping();

  @override
  List<Object?> get props => [];
}

class ShowOverLayScreen extends LoraGptEvent {
  final bool shouldShowOverlayScreen;

  const ShowOverLayScreen({this.shouldShowOverlayScreen = true});

  @override
  List<Object?> get props => [];
}

class StorePortfolioBotStocks extends LoraGptEvent {
  final List<Botstock> botstocks;

  const StorePortfolioBotStocks({required this.botstocks});

  @override
  List<Object?> get props => [botstocks];
}

class StorePortfolioDetails extends LoraGptEvent {
  final double totalPortfolioPnl;

  const StorePortfolioDetails({required this.totalPortfolioPnl});

  @override
  List<Object?> get props => [totalPortfolioPnl];
}

class StoreTabPageState extends LoraGptEvent {
  final TabPage tabPage;

  const StoreTabPageState({required this.tabPage});

  @override
  List<Object?> get props => [tabPage];
}
