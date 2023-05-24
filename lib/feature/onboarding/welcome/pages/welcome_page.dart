part of '../welcome_screen.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppValues.screenHorizontalPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextNew(
            S.of(context).welcomeScreenTitle,
            style: AskLoraTextStyles.h2,
          ),
          const SizedBox(
            height: 25,
          ),
          CustomTextNew(
            S.of(context).welcomeScreenSubTitle,
            style: AskLoraTextStyles.subtitle2,
          ),
          const SizedBox(
            height: 43,
          ),
          _welcomeCard(
              'welcome_icon_cannon', S.of(context).welcomeScreenFirstBenefit),
          const SizedBox(
            height: 28,
          ),
          _welcomeCard(
              'welcome_icon_setting', S.of(context).welcomeScreenSecondBenefit),
          const SizedBox(
            height: 28,
          ),
          _welcomeCard(
              'welcome_icon_chess', S.of(context).welcomeScreenThirdBenefit),
          const SizedBox(
            height: 28,
          ),
        ],
      ),
    );
  }

  Widget _welcomeCard(String iconAssetName, String text) => RoundColoredBox(
        padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 21),
        content: Row(
          children: [
            getSvgIcon(iconAssetName),
            const SizedBox(
              width: 22,
            ),
            Expanded(
              child: CustomTextNew(
                text,
                style: AskLoraTextStyles.h5,
              ),
            )
          ],
        ),
      );
}
