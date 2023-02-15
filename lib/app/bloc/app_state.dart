part of 'app_bloc.dart';

enum UserJourney {
  privacy('privacy'),
  investmentStyle('investment_style'),
  kyc('kyc'),
  freeBotStock('free_bot_stock'),
  deposit('deposit'),
  learnBotPlank('learn_bot_plank');

  final String value;

  const UserJourney(this.value);

  static bool compareUserJourney(
      {required UserJourney source, required UserJourney target}) {
    ///This function is used to check whether the source is already passed the target of UserJourney
    return UserJourney.values.indexWhere((element) => element == source) >
        UserJourney.values.indexWhere((element) => element == target);
  }
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
