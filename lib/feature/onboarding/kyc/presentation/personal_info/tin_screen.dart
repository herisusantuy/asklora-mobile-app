import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/presentation/custom_text.dart';
import '../../../../../core/presentation/custom_text_input.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../../core/utils/formatters/custom_formatters.dart';
import '../../../../../core/utils/formatters/upper_case_text_formatter.dart';
import '../../../../../core/values/app_values.dart';
import '../../../welcome/carousel/presentation/carousel_screen.dart';
import '../../bloc/country_of_tax_residence/country_of_tax_residence_bloc.dart';
import '../../bloc/kyc_bloc.dart';
import '../widgets/kyc_base_form.dart';
import '../widgets/kyc_button_pair.dart';

class TinScreen extends StatelessWidget {
  final double progress;

  const TinScreen({required this.progress, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KycBaseForm(
      onTapBack: () =>
          context.read<NavigationBloc<KycPageStep>>().add(const PagePop()),
      title: 'Set Up Personal Info',
      content: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24),
        children: [
          const CustomText(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit OTP is sent to your SMS.',
            type: FontType.smallText,
            padding: AppValues.screenHorizontalPadding,
          ),
          _tinInput
        ],
      ),
      bottomButton: _bottomButton,
      progress: progress,
    );
  }

  Widget get _tinInput => Padding(
        padding: AppValues.screenHorizontalPadding.copyWith(top: 32),
        child:
            BlocBuilder<CountryOfTaxResidenceBloc, CountryOfTaxResidenceState>(
                buildWhen: (previous, current) =>
                    previous.tinNumber != current.tinNumber ||
                    previous.countryNameOfTaxResidence !=
                        current.countryNameOfTaxResidence,
                builder: (context, state) => CustomTextInput(
                    labelText: 'TIN Number',
                    textInputType: TextInputType.number,
                    hintText:
                        'If your HKID is P123456(7), your TIN is P1234567.',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    textInputFormatterList: [
                      lettersAndNumberFormatter(),
                      UpperCaseTextFormatter(),
                      LengthLimitingTextInputFormatter(
                          state.countryOfTaxResidence == 'HKG' ? 9 : 15)
                    ],
                    errorText: state.isHkIdValid
                        ? ''
                        : 'Please enter a valid TIN number',
                    onChanged: (value) => context
                        .read<CountryOfTaxResidenceBloc>()
                        .add(TinNumberChanged(value)))),
      );

  Widget get _bottomButton =>
      BlocBuilder<CountryOfTaxResidenceBloc, CountryOfTaxResidenceState>(
          buildWhen: (previous, current) =>
              previous.isHkIdValid != current.isHkIdValid,
          builder: (context, state) => KycButtonPair(
                disablePrimaryButton: !state.isHkIdValid,
                primaryButtonOnClick: () => context
                    .read<NavigationBloc<KycPageStep>>()
                    .add(const PageChanged(KycPageStep.addressProof)),
                secondaryButtonOnClick: () => CarouselScreen.open(context),
                primaryButtonLabel: 'NEXT',
                secondaryButtonLabel: 'SAVE FOR LATER',
              ));
}
