import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/bloc/app_bloc.dart';
import '../../../../../core/domain/base_response.dart';
import '../../../../../core/presentation/buttons/button_pair.dart';
import '../../../../../core/presentation/loading/custom_loading_overlay.dart';
import '../../../../../core/presentation/lora_memoji_widget.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../../generated/l10n.dart';
import '../../../../bot_stock/presentation/bot_recommendation/free_bot_recommendation_screen.dart';
import '../../../../bot_stock/presentation/gift/bot_stock_do_screen.dart';
import '../../../../tabs/presentation/tab_screen.dart';
import '../../../kyc/presentation/kyc_screen.dart';
import '../../bloc/question/question_bloc.dart';
import '../../bloc/response/user_response_bloc.dart';
import '../ppi_result_screen.dart';

class InvestmentStyleResultEndScreen extends StatelessWidget {
  const InvestmentStyleResultEndScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: BlocConsumer<UserResponseBloc, UserResponseState>(
          listener: (context, state) {
        CustomLoadingOverlay.of(context).show(state.responseState);
        switch (state.responseState) {
          case ResponseState.success:
            UserJourney.onAlreadyPassed(
                context: context,
                target: UserJourney.investmentStyle,
                onTrueCallback: () {
                  FreeBotRecommendationScreen.openAndRemoveUntil(
                      context, BotStockDoScreen.route);
                },
                onFalseCallback: () {
                  context
                      .read<AppBloc>()
                      .add(const SaveUserJourney(UserJourney.kyc));
                });
            break;
          case ResponseState.error:
            context
                .read<NavigationBloc<QuestionPageStep>>()
                .add(const PagePop());
            break;
          default:
        }
      }, builder: (context, state) {
        if (state.ppiResponseState == PpiResponseState.finishAddResponse) {
          context.read<UserResponseBloc>().add(SendBulkResponse());
        }

        if (state.responseState == ResponseState.success &&
            state.ppiResponseState == PpiResponseState.dispatchResponse) {
          return PpiResultScreen(
            ppiResult: PpiResult.success,
            loraMemojiType: LoraMemojiType.lora4,
            memojiText: S.of(context).investmentResultScreenTitle,
            additionalMessage: S.of(context).investmentResultScreenDescription,
            bottomPadding: 0,
            bottomButton: ButtonPair(
              primaryButtonOnClick: () => KycScreen.open(context),
              secondaryButtonOnClick: () =>
                  TabScreen.openAndRemoveAllRoute(context),
              primaryButtonLabel: S.of(context).openInvestmentAccount,
              secondaryButtonLabel: S.of(context).buttonMaybeLater,
            ),
          );
        }
        return const SizedBox.shrink();
      }),
    );
  }
}
