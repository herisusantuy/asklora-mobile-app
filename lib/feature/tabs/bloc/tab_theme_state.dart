part of 'tab_theme_bloc.dart';

enum BackgroundImageType {
  ///TODO : add white bg asset later
  light(
    imageAsset: 'assets/light_lora_gpt_background.png',
    baseBackgroundColor: AskLoraColors.white,
    appBarBackgroundColor: Colors.transparent,
    scaffoldBackgroundColor: Colors.transparent,
  ),
  dark(
    imageAsset: 'assets/lora_gpt_background.png',
    baseBackgroundColor: AskLoraColors.black,
    appBarBackgroundColor: Colors.transparent,
    scaffoldBackgroundColor: Colors.transparent,
  ),
  none(
    baseBackgroundColor: AskLoraColors.white,
    appBarBackgroundColor: AskLoraColors.white,
    scaffoldBackgroundColor: AskLoraColors.white,
  );

  final String? imageAsset;
  final Color baseBackgroundColor;
  final Color appBarBackgroundColor;
  final Color scaffoldBackgroundColor;

  const BackgroundImageType(
      {this.imageAsset,
      required this.baseBackgroundColor,
      required this.appBarBackgroundColor,
      required this.scaffoldBackgroundColor});
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
