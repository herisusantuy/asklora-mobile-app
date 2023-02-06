part of '../home_screen_form.dart';

class HomeScreenMilestoneCompletionReminderWidget extends StatelessWidget {
  const HomeScreenMilestoneCompletionReminderWidget({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeScreenHorizontalPaddingWidget(
      child: CustomTextNew(
        'Complete the 3 milestones in 89 days to redeem your free Botstock, worth more than US\$68!',
        style: AskLoraTextStyles.body1.copyWith(color: AskLoraColors.charcoal),
      ),
    );
  }
}
