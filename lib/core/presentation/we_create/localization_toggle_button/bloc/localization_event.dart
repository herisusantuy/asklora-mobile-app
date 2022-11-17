part of 'localization_bloc.dart';

abstract class LocalizationEvent extends Equatable {
  const LocalizationEvent() : super();

  @override
  List<Object?> get props => [];
}

class LocalizationChanged extends LocalizationEvent {
  final LocalizationType localizationType;
  const LocalizationChanged({required this.localizationType});
}
