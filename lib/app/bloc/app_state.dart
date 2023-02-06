part of 'app_bloc.dart';

enum UserJourney {
  privacy,
  personalisation,
  createAccount,
  investmentStyle,
  kyc,
  freeBotStock,
  deposit,
  learnBotPlank
}

enum AppStatus { unknown, authenticated, unauthenticated }

class AppState extends Equatable {
  final LocaleType locale;
  final AppStatus status;
  final UserJourney userJourney;

  const AppState._(
      {this.status = AppStatus.unknown,
      this.locale = const LocaleType('en', 'US', 'ENG', 'Mulish'),
      this.userJourney = UserJourney.privacy});

  const AppState.unknown() : this._();

  const AppState.authenticated({UserJourney userJourney = UserJourney.privacy})
      : this._(status: AppStatus.authenticated, userJourney: userJourney);

  const AppState.unauthenticated(
      {localeType = const LocaleType('en', 'US', 'ENG', 'Mulish'),
      UserJourney userJourney = UserJourney.privacy})
      : this._(
            status: AppStatus.unauthenticated,
            locale: localeType,
            userJourney: userJourney);

  AppState copyWith({
    UserJourney? userJourney,
  }) {
    return AppState._(
      status: status,
      locale: locale,
      userJourney: userJourney ?? this.userJourney,
    );
  }

  @override
  List<Object> get props => [status, locale, userJourney];
}
