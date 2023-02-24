import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/base_response.dart';
import '../../../../../core/domain/pair.dart';
import '../../../../../core/presentation/buttons/button_pair.dart';
import '../../../../../core/presentation/custom_in_app_notification.dart';
import '../../../../../core/presentation/custom_scaffold.dart';
import '../../../../../core/presentation/loading/custom_loading_overlay.dart';
import '../../../../../core/presentation/lora_memoji_header.dart';
import '../../../../../core/utils/storage/shared_preference.dart';
import '../../../../../core/utils/storage/storage_keys.dart';
import '../../../../../core/values/app_values.dart';
import '../../../../onboarding/ppi/bloc/question/question_bloc.dart';
import '../../../../tabs/tabs_screen.dart';
import '../../repository/ppi_question_repository.dart';
import '../ppi_screen.dart';

class InvestmentStyleWelcomeScreen extends StatelessWidget {
  static const String route = '/investment_style_welcome_screen';

  const InvestmentStyleWelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      enableBackNavigation: false,
      body: Padding(
        padding: AppValues.screenHorizontalPadding,
        child: LayoutBuilder(builder: (_, constraint) {
          return BlocProvider(
            create: (_) {
              return QuestionBloc(
                  ppiQuestionRepository: PpiQuestionRepository(),
                  questionPageType: QuestionPageType.investmentStyle,
                  sharedPreference: SharedPreference());
            },
            child: BlocConsumer<QuestionBloc, QuestionState>(
              listenWhen: (previous, current) =>
                  previous.response.state != current.response.state,
              listener: (context, state) {
                if (state.response.state == ResponseState.loading) {
                  CustomLoadingOverlay.show(context);
                } else {
                  CustomLoadingOverlay.dismiss();
                }
                if (state.response.state == ResponseState.success) {
                  PpiScreen.open(context,
                      arguments: Pair(QuestionPageType.investmentStyle,
                          QuestionPageStep.investmentStyle));
                } else if (state.response.state == ResponseState.error) {
                  CustomInAppNotification.show(context, state.response.message);
                }
              },
              builder: (context, state) => SingleChildScrollView(
                  child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const LoraMemojiHeader(
                        text:
                            'Let\'s dive into the core of the personalisation experience - defining your investment style.'),
                    ButtonPair(
                        primaryButtonOnClick: () {
                          context
                              .read<QuestionBloc>()
                              .add(const LoadInvestmentStyleQuestions());
                        },
                        secondaryButtonOnClick: () =>
                            TabsScreen.openAndRemoveAllRoute(context),
                        primaryButtonLabel: 'DEFINE INVESTMENT STYLE',
                        secondaryButtonLabel: 'MAYBE LATER')
                  ],
                ),
              )),
            ),
          );
        }),
      ),
    );
  }

  static void open(BuildContext context) => Navigator.pushNamed(context, route);
}
