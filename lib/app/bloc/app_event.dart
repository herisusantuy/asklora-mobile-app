part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent() : super();

  @override
  List<Object?> get props => [];
}

class AppLaunched extends AppEvent {}

class AppLanguageChangeEvent extends AppEvent {
  final LocaleType language;

  const AppLanguageChangeEvent(this.language);
}

class SaveUserJourney extends AppEvent {
  final UserJourney userJourney;
  final String? data;

  const SaveUserJourney(this.userJourney, {this.data});
}

class GetUserJourneyFromLocal extends AppEvent {
  const GetUserJourneyFromLocal();
}

class AllowInAppNotification extends AppEvent {
  final bool isAllowInAppNotification;
  const AllowInAppNotification(this.isAllowInAppNotification);

  @override
  List<Object> get props => [isAllowInAppNotification];
}

class AllowPushNotification extends AppEvent {
  final bool isAllowPushNotification;
  const AllowPushNotification(this.isAllowPushNotification);

  @override
  List<Object> get props => [isAllowPushNotification];
}

class AllowEmailNotification extends AppEvent {
  final bool isAllowEmailNotification;
  const AllowEmailNotification(this.isAllowEmailNotification);

  @override
  List<Object> get props => [isAllowEmailNotification];
}
