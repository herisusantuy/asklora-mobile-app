part of 'app_bloc.dart';

enum UserJourney { privacyPersonalisation, createAccount, investmentStyle, kyc, freeBotStock, deposit, learning}

enum AppStatus { unknown, authenticated, unauthenticated }

class AppState extends Equatable {
  final LocaleType locale;
  final AppStatus status;
  final UserJourney userJourney;

  const AppState._(
      {this.status = AppStatus.unknown,
      this.locale = const LocaleType('en', 'US', 'ENG', 'Mulish'),
      this.userJourney = UserJourney.privacyPersonalisation});

  const AppState.unknown() : this._();

  const AppState.authenticated({required UserJourney userJourney})
      : this._(status: AppStatus.authenticated, userJourney: userJourney);

  const AppState.unauthenticated(
      {localeType = const LocaleType('en', 'US', 'ENG', 'Mulish'),
      required UserJourney userJourney})
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
