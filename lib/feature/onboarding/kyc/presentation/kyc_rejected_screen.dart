import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/custom_text_new.dart';
import '../../../../core/presentation/lora_memoji_widget.dart';
import '../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../core/styles/asklora_colors.dart';
import '../../../../core/styles/asklora_text_styles.dart';
import '../../../../core/values/app_values.dart';
import '../../welcome/carousel/presentation/carousel_screen.dart';
import '../bloc/kyc_bloc.dart';
import '../../../../core/presentation/buttons/button_pair.dart';

class KycRejectedScreen extends StatelessWidget {
  final String rejectedReason;

  const KycRejectedScreen({required this.rejectedReason, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppValues.screenHorizontalPadding,
        child: LayoutBuilder(builder: (context, viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(minHeight: viewportConstraints.maxHeight),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const LoraMemojiWidget(
                          text: 'Sorry ! you’re not eligible for Asklora'),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextNew(
                        rejectedReason,
                        key: const Key('rejected_reason'),
                        style: AskLoraTextStyles.body1
                            .copyWith(color: AskLoraColors.charcoal),
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
        primaryButtonOnClick: () => CarouselScreen.open(context),
        secondaryButtonOnClick: () =>
            context.read<NavigationBloc<KycPageStep>>().add(const PagePop()),
        primaryButtonLabel: 'DONE',
        secondaryButtonLabel: 'GO BACK',
      );
}
