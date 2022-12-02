part of 'localization_bloc.dart';

enum LocalizationType {
  english('ENG'),
  chinese('中');

  final String value;

  const LocalizationType(this.value);
}

class LocalizationState extends Equatable {
  final LocalizationType localizationType;

  const LocalizationState({this.localizationType = LocalizationType.english});

  @override
  List<Object> get props => [localizationType];

  LocalizationState copyWith({
    LocalizationType? localizationType,
  }) {
    return LocalizationState(
      localizationType: localizationType ?? this.localizationType,
    );
  }
}
