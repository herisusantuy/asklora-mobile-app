part of 'localization_bloc.dart';

enum LocalizationType { eng, hk }

class LocalizationState extends Equatable {
  final LocalizationType localizationType;

  const LocalizationState({this.localizationType = LocalizationType.eng});

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
