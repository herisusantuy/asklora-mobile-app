part of 'app_bloc.dart';

enum AppStatus { unknown, authenticated, unauthenticated }

class AppState extends Equatable {
  final LocaleType locale;
  final AppStatus status;

  const AppState._(
      {this.status = AppStatus.unknown,
      this.locale = const LocaleType('en', 'US', 'ENG', 'Mulish')});

  const AppState.unknown() : this._();

  const AppState.authenticated()
      : this._(
          status: AppStatus.authenticated,
        );

  const AppState.unauthenticated(
      {localeType = const LocaleType('en', 'US', 'ENG', 'Mulish')})
      : this._(status: AppStatus.unauthenticated, locale: localeType);

  @override
  List<Object> get props => [status, locale];
}
