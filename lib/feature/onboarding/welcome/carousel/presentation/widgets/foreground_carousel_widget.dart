part of '../carousel_screen.dart';

class ForegroundCarouselWidget extends StatelessWidget {
  const ForegroundCarouselWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LocalizationToggleButton(
              key: Key('localization_toggle_button'),
            ),
            const Expanded(child: SizedBox()),
            CustomButton(
              key: const Key('begin_on_boarding_button'),
              margin: const EdgeInsets.only(bottom: 32),
              label: "LET'S BEGIN",
              onClick: () => LoraAskNameScreen.open(context),
            ),
            Center(
                child: CustomTextButton(
              key: const Key('sign_in_button'),
              fontStyle: FontStyle.italic,
              fontType: FontType.smallTextBold,
              margin: const EdgeInsets.only(bottom: 16),
              onTap: () => SignInScreen.open(context),
              label: 'HAVE AN ACCOUNT?',
            ))
          ],
        ),
      ),
    );
  }
}
