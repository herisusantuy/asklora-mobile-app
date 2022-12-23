part of 'localization_bloc.dart';

abstract class LocalizationEvent extends Equatable {
  const LocalizationEvent() : super();

  @override
  List<Object?> get props => [];
}

class LocalizationChanged extends LocalizationEvent {
  final LocaleType localeType;

  const LocalizationChanged({required this.localeType});

  @override
  List<Object?> get props => [localeType];
}
