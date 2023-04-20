import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/buttons/button_pair.dart';
import '../../../../../core/presentation/buttons/secondary/view_file_button.dart';
import '../../../../../core/presentation/custom_checkbox.dart';
import '../../../../../core/presentation/custom_text.dart';
import '../../../../../core/presentation/custom_text_new.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../../core/presentation/text_fields/master_text_field.dart';
import '../../../../../core/styles/asklora_colors.dart';
import '../../../../../core/styles/asklora_text_styles.dart';
import '../../../welcome/carousel/presentation/carousel_screen.dart';
import '../../bloc/kyc_bloc.dart';
import '../../bloc/personal_info/personal_info_bloc.dart';
import '../../bloc/signing_agreement/signing_agreement_bloc.dart';
import '../financial_profile/widgets/dot_text.dart';
import '../widgets/kyc_base_form.dart';
import '../widgets/kyc_sub_title.dart';

class TaxAgreementScreen extends StatelessWidget {
  final double progress;
  final PersonalInfoBloc personalInfoBloc;

  const TaxAgreementScreen(
      {required this.progress, required this.personalInfoBloc, Key? key})
      : super(key: key);

  final Widget _spaceHeight = const SizedBox(
    height: 8,
  );

  @override
  Widget build(BuildContext context) {
    return KycBaseForm(
      onTapBack: () =>
          context.read<NavigationBloc<KycPageStep>>().add(const PagePop()),
      title: 'Sign Agreements',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const KycSubTitle(
            key: Key('sub_title'),
            subTitle: 'W-8BEN Form',
          ),
          const SizedBox(
            height: 24,
          ),
          ViewFileButton(
              key: const Key('w8_ben_form'),
              label: 'W-8BEN Form',
              onTap: () => context
                  .read<SigningAgreementBloc>()
                  .add(const W8BenFormOpened())),
          const SizedBox(
            height: 24,
          ),
          CustomTextNew(
            'Under penalties of perjury, I declare that I have examined the information in lines 1-7 and to the best of my knowledge and belief it is true, correct, and complete. I further certify under penalties of perjury that:',
            key: const Key('statements'),
            style:
                AskLoraTextStyles.body1.copyWith(color: AskLoraColors.charcoal),
          ),
          _spaceHeight,
          const DotText(
              'I am the individual that is the beneficial owner (or am authorized to sign for the individual that is the beneficial owner) of all the income or proceeds to which this form relates or am using this form to document myself for chapter 4 purposes;'),
          _spaceHeight,
          const DotText(
              'The person named on line 1 of this form is not a U.S. person;'),
          _spaceHeight,
          const DotText('This form relates to:'),
          _spaceHeight,
          _dotTextSlightRight(
              'income not effectively connected with the conduct of a trade or business in the United States;'),
          _spaceHeight,
          _dotTextSlightRight(
              'income effectively connected with the conduct of a trade or business in the United States but is not subject to tax under an applicable income tax treaty;'),
          _spaceHeight,
          _dotTextSlightRight(
              'the partner’s share of a partnership’s effectively connected taxable income; or'),
          _spaceHeight,
          _dotTextSlightRight(
              'the partner’s amount realized from the transfer of a partnership interest subject to withholding under section 1446(f);'),
          _spaceHeight,
          const DotText(
              'The person named on line 1 of this form is a resident of the treaty country listed on line 9 of the form (if any) within the meaning of the income tax treaty between the United States and that country; and'),
          _spaceHeight,
          const DotText(
              'For broker transactions or barter exchanges, the beneficial owner is an exempt foreign person as defined in the instructions to IRS Form W-8BEN.'),
          _spaceHeight,
          CustomTextNew(
            'Furthermore, I authorize this form to be provided to any withholding agent that has control, receipt, or custody of the income of which I am the beneficial owner or any withholding agent that can disburse or make payments of the income of which I am the beneficial owner. I agree that I will submit a new form within 30 days if any certification made on this form becomes incorrect.',
            style:
                AskLoraTextStyles.body1.copyWith(color: AskLoraColors.charcoal),
          ),
          const SizedBox(
            height: 46,
          ),
          CustomTextNew(
            'The US Internal Revenue Service does not require your consent to any provisions of this document other than the certifications required to establish your status as a non-U.S. person, and if applicable, obtain a reduced rate of withholding.',
            style:
                AskLoraTextStyles.body1.copyWith(color: AskLoraColors.charcoal),
          ),
          const SizedBox(
            height: 20,
          ),
          _signatureCheck,
          const SizedBox(
            height: 46,
          ),
          _signatureSection,
          _legalNameInput
        ],
      ),
      bottomButton: _bottomButton(context),
      progress: progress,
    );
  }

  Widget get _signatureCheck =>
      BlocBuilder<SigningAgreementBloc, SigningAgreementState>(
          buildWhen: (previous, current) =>
              previous.isSignatureChecked != current.isSignatureChecked,
          builder: (context, state) => CustomCheckbox(
                checkboxKey: const Key('signature_check_value'),
                key: const Key('signature_check'),
                text:
                    'By checking this box, you consent to the collection and distribution of tax forms in an electronic format in lieu of paper',
                fontHeight: 1.4,
                isChecked: state.isSignatureChecked,
                fontType: FontType.smallText,
                onChanged: (value) => context
                    .read<SigningAgreementBloc>()
                    .add(SignatureChecked(value!)),
              ));

  Widget get _signatureSection => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 28,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextNew('Signature',
                style: AskLoraTextStyles.h5
                    .copyWith(color: AskLoraColors.charcoal)),
            const SizedBox(
              height: 8,
            ),
            CustomTextNew(
              'By typing my signature and clicking ‘Agree’ below, I confirm that:',
              style: AskLoraTextStyles.body2
                  .copyWith(color: AskLoraColors.charcoal),
            ),
            _spaceHeight,
            CustomTextNew(
              '(1) All information and/or documentation provided by me during the account application process is accurate, complete and up-to-date; ',
              style: AskLoraTextStyles.body2
                  .copyWith(color: AskLoraColors.charcoal),
            ),
            _spaceHeight,
            CustomTextNew(
              '(2) I have read and understood all of the information provided to me by LORA Advisors; ',
              style: AskLoraTextStyles.body2
                  .copyWith(color: AskLoraColors.charcoal),
            ),
            _spaceHeight,
            CustomTextNew(
              '(3) I consent and agree to the terms of all the above agreements and disclosures provided to me during the account application process: and ',
              style: AskLoraTextStyles.body2
                  .copyWith(color: AskLoraColors.charcoal),
            ),
            _spaceHeight,
            CustomTextNew(
              '(4) I understand and agree that my electronic signature is the legal equivalent of a manual written signature.',
              style: AskLoraTextStyles.body2
                  .copyWith(color: AskLoraColors.charcoal),
            ),
            const SizedBox(
              height: 46,
            ),
            CustomTextNew(
              'Sign this electronically by typing your name exactly as shown below.',
              style: AskLoraTextStyles.body2.copyWith(
                color: AskLoraColors.charcoal,
              ),
            ),
            _acceptedSignatureNameHint,
          ],
        ),
      );

  Widget get _acceptedSignatureNameHint =>
      BlocBuilder<SigningAgreementBloc, SigningAgreementState>(
          buildWhen: (previous, current) =>
              previous.legalName != current.legalName,
          builder: (context, state) {
            return RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: 'Accepted signature(s): ',
                  style: AskLoraTextStyles.body2
                      .copyWith(color: AskLoraColors.charcoal)),
              TextSpan(
                  text:
                      '${personalInfoBloc.state.firstName} ${personalInfoBloc.state.lastName}',
                  style: AskLoraTextStyles.body2.copyWith(
                      color: AskLoraColors.charcoal,
                      fontWeight: FontWeight.bold)),
            ]));
          });

  Widget get _legalNameInput =>
      BlocBuilder<SigningAgreementBloc, SigningAgreementState>(
          buildWhen: (previous, current) =>
              previous.legalName != current.legalName,
          builder: (context, state) => Padding(
                padding: const EdgeInsets.only(top: 46),
                child: MasterTextField(
                  initialValue: state.legalName,
                  key: const Key('legal_name_input'),
                  onChanged: (value) => context
                      .read<SigningAgreementBloc>()
                      .add(LegalNameSignatureChanged(value)),
                  errorText: state.legalNameErrorText,
                ),
              ));

  Widget _dotTextSlightRight(String text) => Padding(
        padding: const EdgeInsets.only(left: 28.0),
        child: DotText(
          text,
        ),
      );

  Widget _bottomButton(BuildContext context) =>
      BlocBuilder<SigningAgreementBloc, SigningAgreementState>(
        buildWhen: (previous, current) =>
            previous.isSignatureChecked != current.isSignatureChecked ||
            previous.isInputNameValid != current.isInputNameValid,
        builder: (context, state) {
          return ButtonPair(
            primaryButtonOnClick: () => context
                .read<NavigationBloc<KycPageStep>>()
                .add(const PageChanged(KycPageStep.kycSummary)),
            disablePrimaryButton: state.disableAgreeButton(),
            secondaryButtonOnClick: () => CarouselScreen.open(context),
            primaryButtonLabel: 'AGREE',
            secondaryButtonLabel: 'CONTINUE LATER',
          );
        },
      );
}
