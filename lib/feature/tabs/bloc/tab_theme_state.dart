part of 'tab_theme_bloc.dart';

enum BackgroundImageType {
  ///TODO : add white bg asset later
  light(
    imageAsset: 'assets/light_lora_gpt_background.png',
    baseBackgroundColor: AskLoraColors.white,
    appBarBackgroundColor: Colors.transparent,
    scaffoldBackgroundColor: Colors.transparent,
    tabAiActiveAsset: 'bottom_nav_asklora_ai_selected_black',
  ),
  dark(
    imageAsset: 'assets/lora_gpt_background.png',
    baseBackgroundColor: AskLoraColors.black,
    appBarBackgroundColor: Colors.transparent,
    scaffoldBackgroundColor: Colors.transparent,
    tabAiActiveAsset: 'bottom_nav_asklora_ai_selected_white',
    tabForYouFilledColor: AskLoraColors.darkGray,
    tabPortfolioFilledColor: AskLoraColors.darkGray,
  ),

  none(
      baseBackgroundColor: AskLoraColors.white,
      appBarBackgroundColor: AskLoraColors.white,
      scaffoldBackgroundColor: AskLoraColors.white,
      tabAiActiveAsset: 'bottom_nav_asklora_ai_selected_black');

  final String? imageAsset;
  final String tabAiActiveAsset;
  final Color? tabForYouFilledColor;
  final Color? tabPortfolioFilledColor;
  final Color baseBackgroundColor;
  final Color appBarBackgroundColor;
  final Color scaffoldBackgroundColor;

  const BackgroundImageType({
    this.imageAsset,
    required this.baseBackgroundColor,
    required this.appBarBackgroundColor,
    required this.scaffoldBackgroundColor,
    required this.tabAiActiveAsset,
    this.tabForYouFilledColor,
    this.tabPortfolioFilledColor,
  });
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
