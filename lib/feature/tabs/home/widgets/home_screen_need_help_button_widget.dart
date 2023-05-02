part of '../home_screen_form.dart';

class HomeScreenNeedHelpButtonWidget extends StatelessWidget {
  const HomeScreenNeedHelpButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExtraInfoButton(
      label: 'Need help?',
      onTap: () => TabsScreen.openAndRemoveAllRoute(context,
          initialTabScreenPage: TabScreenPage.loraGpt),
      suffixIcon: const Icon(
        Icons.arrow_forward_rounded,
        color: AskLoraColors.primaryMagenta,
        size: 18,
      ),
    );
  }
}
