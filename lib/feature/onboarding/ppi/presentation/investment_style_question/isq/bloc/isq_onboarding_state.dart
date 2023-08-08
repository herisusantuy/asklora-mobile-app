part of 'isq_onboarding_bloc.dart';

class IsqOnBoardingState extends Equatable {
  final bool aiWelcomeScreenStatus;

  const IsqOnBoardingState({
    this.aiWelcomeScreenStatus = false,
  }) : super();

  IsqOnBoardingState copyWith({bool aiWelcomeScreenStatus = false}) {
    return IsqOnBoardingState(aiWelcomeScreenStatus: aiWelcomeScreenStatus);
  }

  @override
  List<Object> get props => [aiWelcomeScreenStatus];
}
