import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/base_response.dart';
import '../../../../../core/presentation/buttons/primary_button.dart';
import '../../../../../core/presentation/custom_in_app_notification.dart';
import '../../../../../core/presentation/loading/custom_loading_overlay.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../../core/presentation/navigation/custom_navigation_widget.dart';
import '../../../../auth/sign_up/presentation/sign_up_screen.dart';
import '../../bloc/question/question_bloc.dart';
import '../../bloc/response/user_response_bloc.dart';
import '../investment_style_question/investment_style_welcome_screen.dart';
import '../ppi_result_screen.dart';

class PersonalisationResultEndScreen extends StatelessWidget {
  const PersonalisationResultEndScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomNavigationWidget<QuestionPageStep>(
      onBackPressed: () {
        context
            .read<QuestionBloc>()
            .add(const CurrentPersonalisationPageDecremented());
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
                .add(const CurrentPersonalisationPageDecremented());
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
        if (state.responseState == ResponseState.loading) {
          return const SizedBox.shrink();
        } else {
          return PpiResultScreen(
            memojiText:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vel nunc, egestas pulvinar sed ac semper porta.',
            additionalMessage:
                '(Screen that show some kind of a result to motivate user / user feel like they get a reward after answering the ques)',
            bottomButton: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: PrimaryButton(
                key: const Key('next_button'),
                label: 'GOT IT',
                onTap: () => InvestmentStyleWelcomeScreen.open(context),
              ),
            ),
          );
        }
      }),
    );
  }
}
