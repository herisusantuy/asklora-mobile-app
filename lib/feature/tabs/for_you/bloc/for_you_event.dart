part of 'for_you_bloc.dart';

abstract class ForYouEvent extends Equatable {
  const ForYouEvent();

  @override
  List<Object> get props => [];
}

class GetInvestmentStyleAnswer extends ForYouEvent {}
class SaveInvestmentStyleAnswer extends ForYouEvent {}
