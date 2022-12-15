part of '../carousel_screen.dart';

class ForegroundCarouselWidget extends StatelessWidget {
  const ForegroundCarouselWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const LocalizationToggleButton(),
            const Expanded(child: SizedBox()),
            PrimaryButton(
              key: const Key('begin_on_boarding_button'),
              label: "LET'S BEGIN",
              onTap: () => AskNameScreen.open(context),
            ),
            Center(
                child: CustomTextButton(
              key: const Key('sign_in_button'),
              padding: const EdgeInsets.all(16),
              fontStyle: FontStyle.italic,
              onTap: () => SignInScreen.open(context),
              label: 'HAVE AN ACCOUNT?',
            )),
            const SizedBox(height: 5)
          ],
        ),
      ),
    );
  }
}
