part of '../home_screen_form.dart';

class HomeScreenMilestoneCompletionWidget extends StatelessWidget {
  const HomeScreenMilestoneCompletionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeScreenHorizontalPaddingWidget(
      child: CustomTextNew(
        'You’ve completed all the steps to opening an account with Asklora! You’ll be able to start trading as soon as your account is approved. It usually takes up to 2 business days.',
        style: AskLoraTextStyles.body2.copyWith(color: AskLoraColors.charcoal),
      ),
    );
  }
}
