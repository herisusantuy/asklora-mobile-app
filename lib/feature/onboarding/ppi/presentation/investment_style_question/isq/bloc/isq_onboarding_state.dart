part of 'isq_onboarding_bloc.dart';

class IsqOnBoardingState extends Equatable {
  final bool aiWelcomeScreenStatus;
  final ResponseState isqOnboardingResponseState;

  const IsqOnBoardingState(
      {this.aiWelcomeScreenStatus = false,
      this.isqOnboardingResponseState = ResponseState.unknown})
      : super();

  IsqOnBoardingState copyWith(
      {bool aiWelcomeScreenStatus = false,
      ResponseState isqOnboardingResponseState = ResponseState.unknown}) {
    return IsqOnBoardingState(
        aiWelcomeScreenStatus: aiWelcomeScreenStatus,
        isqOnboardingResponseState: isqOnboardingResponseState);
  }

  @override
  List<Object> get props => [aiWelcomeScreenStatus, isqOnboardingResponseState];
}
