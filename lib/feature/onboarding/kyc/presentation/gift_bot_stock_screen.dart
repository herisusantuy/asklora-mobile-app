import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/buttons/button_pair.dart';
import '../../../../core/presentation/custom_text_new.dart';
import '../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../core/styles/asklora_text_styles.dart';
import '../../../../core/values/app_values.dart';
import '../../../bot_stock/presentation/gift/gift_bot_stock_welcome_screen.dart';
import '../bloc/kyc_bloc.dart';

class GiftBotStockScreen extends StatelessWidget {
  const GiftBotStockScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppValues.screenHorizontalPadding,
        child: LayoutBuilder(builder: (context, viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 54,
                      ),
                      CustomTextNew(
                        'Your application is under review.',
                        key: const Key('sub_title'),
                        style: AskLoraTextStyles.h4,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      CustomTextNew(
                        '-Image-',
                        style: AskLoraTextStyles.body1,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      CustomTextNew(
                        'You will be informed when your application is approved.\n\nPlease remember to collect your gift.',
                        key: const Key('success_sign'),
                        style: AskLoraTextStyles.body1,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  _bottomButton(context)
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _bottomButton(BuildContext context) => ButtonPair(
        primaryButtonOnClick: () => GiftBotStockWelcomeScreen.open(context),
        secondaryButtonOnClick: () =>
            context.read<NavigationBloc<KycPageStep>>().add(const PagePop()),
        primaryButtonLabel: 'GET FREE AI TRADE',
        secondaryButtonLabel: 'MAYBE LATER',
      );
}
