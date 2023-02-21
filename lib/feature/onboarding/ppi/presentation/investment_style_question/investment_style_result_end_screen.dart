import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/base_response.dart';
import '../../../../../core/presentation/buttons/primary_button.dart';
import '../../../../../core/presentation/custom_in_app_notification.dart';
import '../../../../../core/presentation/loading/custom_loading_overlay.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../../core/presentation/navigation/custom_navigation_widget.dart';
import '../../../../../core/presentation/we_create/custom_text_button.dart';
import '../../../../tabs/tabs_screen.dart';
import '../../../kyc/presentation/kyc_screen.dart';
import '../../bloc/question/question_bloc.dart';
import '../../bloc/response/user_response_bloc.dart';
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
      child: BlocConsumer<UserResponseBloc, UserResponseState>(
          listener: (context, state) {
        if (state.responseState == ResponseState.loading) {
          CustomLoadingOverlay.show(context);
        } else {
          CustomLoadingOverlay.dismiss();
        }
        switch (state.responseState) {
          case ResponseState.success:
            //InvestmentStyleWelcomeScreen.open(context);
            break;
          case ResponseState.error:
            context
                .read<QuestionBloc>()
                .add(const CurrentInvestmentStylePageDecremented());
            context
                .read<NavigationBloc<QuestionPageStep>>()
                .add(const PagePop());
            CustomInAppNotification.show(
                context, 'Error while posting the user request.');
            break;
          default:
        }
      }, builder: (context, state) {
        if (state.ppiResponseState == PpiResponseState.finishAddResponse) {
          context.read<UserResponseBloc>().add(SendBulkResponse());
        }
        debugPrint(
            'Krishna personalisation ${state.responseState} ${state.ppiResponseState}');
        if (state.responseState == ResponseState.success &&
            state.ppiResponseState == PpiResponseState.dispatchResponse) {
          return PpiResultScreen(
            memojiText: 'Your investment style is all set!',
            additionalMessage:
                'Let’s check your personalised recommendations. You are eligible for a FREE AI trade (US\$68.00). But first, you need to create an investment account.',
            bottomButton: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  _openInvestmentAccountButton(context),
                  _maybeLaterButton(context)
                ],
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      }),
    );
  }

  Widget _openInvestmentAccountButton(BuildContext context) => PrimaryButton(
        key: const Key('open_investment_account_button'),
        fontStyle: FontStyle.normal,
        label: 'OPEN INVESTMENT ACCOUNT',
        onTap: () => KycScreen.open(context),
      );

  Widget _maybeLaterButton(BuildContext context) => CustomTextButton(
        key: const Key('maybe_later_button'),
        margin: const EdgeInsets.only(top: 24),
        label: 'MAYBE LATER',
        onTap: () => TabsScreen.openAndRemoveAllRoute(context),
      );
}
