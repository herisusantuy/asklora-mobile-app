import 'package:flutter/material.dart';

import '../../../../../core/domain/pair.dart';
import '../../../../../core/presentation/buttons/button_pair.dart';
import '../../../../../core/presentation/custom_scaffold.dart';
import '../../../../../core/presentation/lora_memoji_header.dart';
import '../../../../../core/values/app_values.dart';
import '../../../../onboarding/ppi/bloc/question/question_bloc.dart';
import '../ppi_screen.dart';

class InvestmentStyleWelcomeScreen extends StatelessWidget {
  static const String route = '/investment_style_welcome_screen';

  const InvestmentStyleWelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Padding(
        padding: AppValues.screenHorizontalPadding,
        child: LayoutBuilder(builder: (context, constraint) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const LoraMemojiHeader(
                      text:
                          'Let’s dive into the core of the personalisation experience - defining your investment style.'),
                  ButtonPair(
                      primaryButtonOnClick: () => PpiScreen.open(context,
                          arguments: Pair(QuestionPageType.investmentStyle,
                              QuestionPageStep.investmentStyle)),
                      secondaryButtonOnClick: () => Navigator.pop(context),
                      primaryButtonLabel: 'DEFINE INVESTMENT STYLE',
                      secondaryButtonLabel: 'SIGN UP AGAIN')
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  static void open(BuildContext context) => Navigator.pushNamed(context, route);
}
