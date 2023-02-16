import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/bloc/app_bloc.dart';
import '../../../../../core/domain/pair.dart';
import '../../../../../core/presentation/buttons/button_pair.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../../core/presentation/navigation/custom_navigation_widget.dart';
import '../../../../tabs/for_you/for_you_screen_form.dart';
import '../../../../tabs/tabs_screen.dart';
import '../../../kyc/presentation/kyc_screen.dart';
import '../../bloc/question/question_bloc.dart';
import '../ppi_result_screen.dart';

class InvestmentStyleResultEndScreen extends StatelessWidget {
  const InvestmentStyleResultEndScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomNavigationWidget<QuestionPageStep>(
      onBackPressed: () {
        context
            .read<QuestionBloc>()
            .add(const CurrentInvestmentStylePageDecremented());
        context.read<NavigationBloc<QuestionPageStep>>().add(const PagePop());
      },
      header: const SizedBox.shrink(),
      child: PpiResultScreen(
        memojiText: 'Your investment style is all set!',
        additionalMessage:
            'Let’s check your personalised recommendations. You are eligible for a FREE AI trade (US\$68.00). But first, you need to create an investment account.',
        bottomButton: _bottomButton(context),
      ),
    );
  }

  Widget _bottomButton(BuildContext context) {
    Pair<String, VoidCallback> bottomButtonProps =
        _getBottomButtonProps(context);
    return ButtonPair(
        primaryButtonOnClick: bottomButtonProps.right,
        secondaryButtonOnClick: () => TabsScreen.openAndRemoveAllRoute(context),
        primaryButtonLabel: bottomButtonProps.left,
        secondaryButtonLabel: 'MAYBE LATER');
  }

  Pair<String, VoidCallback> _getBottomButtonProps(BuildContext context) {
    if (UserJourney.compareUserJourney(
        source: context.read<AppBloc>().state.userJourney,
        target: UserJourney.kyc)) {
      return Pair(
          'VIEW BOTSTOCK RECOMMENDATION',
          () => context
              .read<NavigationBloc<ForYouPage>>()
              .add(const PageChanged(ForYouPage.botRecommendation)));
    } else {
      return Pair('OPEN INVESTMENT ACCOUNT', () => KycScreen.open(context));
    }
  }
}
