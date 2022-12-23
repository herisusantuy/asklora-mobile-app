part of 'localization_bloc.dart';

class LocaleType {
  final String languageCode;
  final String countryCode;
  final String label;

  const LocaleType(this.languageCode, this.countryCode, this.label);

  static List<LocaleType> supportedLocales() =>
      [const LocaleType('en', 'US', 'ENG'), const LocaleType('zh', 'HK', '中')];
}

class LocalizationState extends Equatable {
  final LocaleType localeType;

  const LocalizationState(
      {this.localeType = const LocaleType('en', 'US', 'ENG')});

  @override
  List<Object> get props => [localeType];

  LocalizationState copyWith({
    LocaleType? localeType,
  }) {
    return LocalizationState(
      localeType: localeType ?? this.localeType,
    );
  }
}
