import 'package:flutter/material.dart';
import '../../../../../core/domain/pair.dart';
import '../../../../../core/presentation/buttons/button_pair.dart';
import '../../../../../core/presentation/custom_scaffold.dart';
import '../../../../../core/presentation/lora_memoji_header.dart';
import '../../../../../core/values/app_values.dart';
import '../../../../../generated/l10n.dart';
import '../../../../onboarding/ppi/bloc/question/question_bloc.dart';
import '../../../../tabs/tabs_screen.dart';
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
          return SingleChildScrollView(
              child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraint.maxHeight),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LoraMemojiHeader(
                    text: S.of(context).investmentStyleWelcomeTitle),
                ButtonPair(
                    primaryButtonOnClick: () {
                      PpiScreen.open(context,
                          arguments: const Pair(
                              QuestionPageType.investmentStyle,
                              QuestionPageStep.investmentStyle));
                    },
                    secondaryButtonOnClick: () =>
                        TabsScreen.openAndRemoveAllRoute(context),
                    primaryButtonLabel:
                        S.of(context).buttonDefineInvestmentStyle,
                    secondaryButtonLabel: S.of(context).buttonMaybeLater)
              ],
            ),
          ));
        }),
      ),
    );
  }

  static void open(BuildContext context) => Navigator.pushNamed(context, route);
}
