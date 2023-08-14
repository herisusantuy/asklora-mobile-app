part of 'isq_onboarding_bloc.dart';

enum IsqOnBoardingBackState { none, openConfirmation, closeApp }

class IsqOnBoardingState extends Equatable {
  final bool aiWelcomeScreenStatus;
  final ResponseState isqOnboardingResponseState;
  final IsqOnBoardingBackState isqOnBoardingBackState;

  const IsqOnBoardingState(
      {this.aiWelcomeScreenStatus = false,
      this.isqOnboardingResponseState = ResponseState.unknown,
      this.isqOnBoardingBackState = IsqOnBoardingBackState.none})
      : super();

  IsqOnBoardingState copyWith(
      {bool aiWelcomeScreenStatus = false,
      ResponseState isqOnboardingResponseState = ResponseState.unknown,
      IsqOnBoardingBackState isqOnBoardingBackState =
          IsqOnBoardingBackState.none}) {
    return IsqOnBoardingState(
        aiWelcomeScreenStatus: aiWelcomeScreenStatus,
        isqOnboardingResponseState: isqOnboardingResponseState,
        isqOnBoardingBackState: isqOnBoardingBackState);
  }

  @override
  List<Object> get props => [
        aiWelcomeScreenStatus,
        isqOnboardingResponseState,
        isqOnBoardingBackState
      ];
}
