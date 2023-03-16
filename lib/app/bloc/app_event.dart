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
