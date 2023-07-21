part of 'tab_theme_bloc.dart';

enum BackgroundImageType {
  ///TODO : add white bg asset later
  light(imageAsset: 'assets/lora_gpt_background.png'),
  dark(imageAsset: 'assets/lora_gpt_background.png'),
  none;

  final String? imageAsset;

  const BackgroundImageType({this.imageAsset});
}

class TabThemeState extends Equatable {
  final BackgroundImageType backgroundImageType;

  const TabThemeState({
    this.backgroundImageType = BackgroundImageType.none,
  });

  @override
  List<Object> get props => [backgroundImageType];

  TabThemeState copyWith({
    BackgroundImageType? backgroundImageType,
  }) {
    return TabThemeState(
      backgroundImageType: backgroundImageType ?? this.backgroundImageType,
    );
  }
}
