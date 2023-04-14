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
      {required BuildContext context, required UserJourney target}) {
    ///This function is used to check whether the current journey is already passed the target of UserJourney
    return UserJourney.values.indexWhere(
            (element) => element == context.read<AppBloc>().state.userJourney) >
        UserJourney.values.indexWhere((element) => element == target);
  }

  static void onAlreadyPassed(
      {required BuildContext context,
      required UserJourney target,
      required VoidCallback onTrueCallback,
      VoidCallback? onFalseCallback}) {
    if (UserJourney.values.indexWhere(
            (element) => element == context.read<AppBloc>().state.userJourney) >
        UserJourney.values.indexWhere((element) => element == target)) {
      onTrueCallback();
    } else {
      if (onFalseCallback != null) {
        onFalseCallback();
      }
    }
  }
}

enum AppStatus { unknown, authenticated, unauthenticated }

class AppState extends Equatable {
  final LocaleType locale;
  final AppStatus status;
  final UserJourney userJourney;
  final bool isAllowInAppNotification;
  final bool isAllowPushNotification;
  final bool isAllowEmailNotification;

  const AppState._({
    this.status = AppStatus.unknown,
    this.locale = const LocaleType('en', 'US', 'ENG', 'English', 'Mulish'),
    this.userJourney = UserJourney.privacy,
    this.isAllowInAppNotification = true,
    this.isAllowPushNotification = true,
    this.isAllowEmailNotification = true,
  });

  const AppState.unknown() : this._();

  const AppState.authenticated({UserJourney userJourney = UserJourney.privacy})
      : this._(status: AppStatus.authenticated, userJourney: userJourney);

  const AppState.unauthenticated(
      {localeType = const LocaleType('en', 'US', 'ENG', 'English', 'Mulish'),
      UserJourney userJourney = UserJourney.privacy})
      : this._(
            status: AppStatus.unauthenticated,
            locale: localeType,
            userJourney: userJourney);

  AppState copyWith({
    UserJourney? userJourney,
    bool? isAllowInAppNotification,
    bool? isAllowPushNotification,
    bool? isAllowEmailNotification,
  }) {
    return AppState._(
      status: status,
      locale: locale,
      userJourney: userJourney ?? this.userJourney,
      isAllowInAppNotification:
          isAllowInAppNotification ?? this.isAllowInAppNotification,
      isAllowPushNotification:
          isAllowPushNotification ?? this.isAllowPushNotification,
      isAllowEmailNotification:
          isAllowEmailNotification ?? this.isAllowEmailNotification,
    );
  }

  @override
  List<Object> get props => [
        status,
        locale,
        userJourney,
        isAllowInAppNotification,
        isAllowPushNotification,
        isAllowEmailNotification,
      ];
}
