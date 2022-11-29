import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/presentation/custom_text.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../../core/values/app_values.dart';
import '../../../welcome/carousel/presentation/carousel_screen.dart';
import '../../bloc/kyc_bloc.dart';
import '../widgets/kyc_base_form.dart';
import '../widgets/kyc_button_pair.dart';

class SignAgreementsScreen extends StatelessWidget {
  final double progress;

  const SignAgreementsScreen({required this.progress, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KycBaseForm(
      onTapBack: () =>
          context.read<NavigationBloc<KycPageStep>>().add(const PagePop()),
      title: 'Set Up Financial Profile',
      content: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24),
        children: [
          const CustomText(
            'Please read the 2 agreements pdf files.',
            type: FontType.smallText,
            padding: AppValues.screenHorizontalPadding,
            height: 2,
          ),
          _agreementCard(title: 'Alpaca Customer Agreement.pdf', url: '/'),
          _agreementCard(title: 'Alpaca Customer Agreement.pdf', url: '/'),
        ],
      ),
      bottomButton: _bottomButton(context),
      progress: progress,
    );
  }

  Widget _agreementCard({required String title, required String url}) =>
      Container(
        margin: AppValues.screenHorizontalPadding.copyWith(top: 20),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(
          children: [
            const Icon(
              Icons.picture_as_pdf_outlined,
              color: Colors.grey,
            ),
            Expanded(
                child: CustomText(
              title,
              padding: const EdgeInsets.only(left: 14),
            ))
          ],
        ),
      );

  Widget _bottomButton(BuildContext context) => KycButtonPair(
        primaryButtonOnClick: () => context
            .read<NavigationBloc<KycPageStep>>()
            .add(const PageChanged(KycPageStep.verifyIdentity)),
        secondaryButtonOnClick: () => CarouselScreen.open(context),
        primaryButtonLabel: 'CONFIRM & CONTINUE',
        secondaryButtonLabel: 'SAVE FOR LATER',
      );
}
