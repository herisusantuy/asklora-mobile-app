part of 'background_props_bloc.dart';

enum BackgroundImageType {
  white(imageAsset: 'assets/lora_gpt_background.png'),
  black(imageAsset: 'assets/lora_gpt_background.png'),
  none;

  final String? imageAsset;

  const BackgroundImageType({this.imageAsset});
}

class BackgroundPropsState extends Equatable {
  final BackgroundImageType backgroundImageType;

  const BackgroundPropsState({
    this.backgroundImageType = BackgroundImageType.none,
  });

  @override
  List<Object> get props => [backgroundImageType];

  BackgroundPropsState copyWith({
    BackgroundImageType? backgroundImageType,
  }) {
    return BackgroundPropsState(
      backgroundImageType: backgroundImageType ?? this.backgroundImageType,
    );
  }
}
