import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/custom_checkbox.dart';
import '../../../../../core/presentation/custom_text_button.dart';
import '../../bloc/account_bloc.dart';
import '../../bloc/signing_agreement_tax/signing_agreement_tax_bloc.dart';

class SigningAgreementTaxForm extends StatelessWidget {
  final PageController controller;

  const SigningAgreementTaxForm({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: [
              _openFormW8benButton(),
              _checkboxCertifyNotUsCitizen(),
              _checkDeclareCorrectInformation(),
            ],
          ),
        ),
        _nextButton(),
      ],
    );
  }

  Widget _openFormW8benButton() {
    return BlocBuilder<SigningAgreementTaxBloc, SigningAgreementTaxState>(
      buildWhen: (previous, current) =>
          (previous.isFormW8BenOpened != current.isFormW8BenOpened) ||
          (previous.isCheckedCertify != current.isCheckedCertify),
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: CustomTextButton(
            key: const Key('button_open_form_w8ben'),
            disable: !state.isCheckedCertify,
            borderRadius: 30,
            buttonText: 'US TAX Form W-8BEN',
            onClick: () => context
                .read<SigningAgreementTaxBloc>()
                .add(const FormW8BenOpened(true)),
          ),
        );
      },
    );
  }

  Widget _checkboxCertifyNotUsCitizen() =>
      BlocBuilder<SigningAgreementTaxBloc, SigningAgreementTaxState>(
        buildWhen: (previous, current) =>
            previous.isCheckedCertify != current.isCheckedCertify,
        builder: (context, state) {
          return CustomCheckbox(
            checkboxKey: const Key('certify_not_us_citizen_checkbox_key_value'),
            key: const Key('certify_not_us_citizen_checkbox'),
            padding: const EdgeInsets.only(top: 10),
            text:
                'I certify that I am not a US citizen, US resident alien or other US person for US tax purposes, and I am submitting the applicable Form W-8 BEN with this form to certify my foreign status and, if applicable, claim tax treaty benefits.',
            isChecked: state.isCheckedCertify,
            onChanged: (value) => context
                .read<SigningAgreementTaxBloc>()
                .add(CertifyNotUsCitizenChecked(value!)),
            textAlign: TextAlign.justify,
          );
        },
      );

  Widget _checkDeclareCorrectInformation() {
    return BlocBuilder<SigningAgreementTaxBloc, SigningAgreementTaxState>(
      buildWhen: (previous, current) =>
          previous.isFormW8BenOpened != current.isFormW8BenOpened ||
          previous.isCheckedDeclare != current.isCheckedDeclare,
      builder: (context, state) {
        return CustomCheckbox(
          checkboxKey:
              const Key('declare_correct_information_checkbox_key_value'),
          key: const Key('declare_correct_information_checkbox'),
          padding: const EdgeInsets.only(top: 10),
          text:
              'I declare that I have examined the information on this form and to the best of my knowledge and belief it is true, correct, and complete',
          isChecked: state.isCheckedDeclare,
          disabled: state.isFormW8BenOpened ? false : true,
          onChanged: (value) => context
              .read<SigningAgreementTaxBloc>()
              .add(DeclareCorrectInformationChecked(value!)),
          textAlign: TextAlign.justify,
        );
      },
    );
  }

  Widget _nextButton() {
    return BlocBuilder<SigningAgreementTaxBloc, SigningAgreementTaxState>(
      builder: (context, state) {
        return Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: CustomTextButton(
                key: const Key('signing_agreement_tax_next_step_button'),
                borderRadius: 30,
                disable: state.disabledNextButton(),
                buttonText: 'Next',
                onClick: () {
                  context
                      .read<AccountBloc>()
                      .add(const AccountCurrentStepChanged('next'));
                  controller.nextPage(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.ease);
                }));
      },
    );
  }
}
