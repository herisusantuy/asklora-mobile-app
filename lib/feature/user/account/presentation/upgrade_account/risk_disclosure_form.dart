import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/base_response.dart';
import '../../../../../core/presentation/custom_checkbox.dart';
import '../../../../../core/presentation/custom_text.dart';
import '../../../../../core/presentation/custom_text_button.dart';
import '../../bloc/account_bloc.dart';
import '../../bloc/risk_disclosure/risk_disclosure_bloc.dart';

class RiskDisclosureForm extends StatelessWidget {
  final PageController controller;

  const RiskDisclosureForm({required this.controller, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _spaceHeight(),
        _companyRiskDisclosure(),
        _spaceHeight(),
        _companyRiskDisclosureAgreement(),
        _spaceHeight(),
        _nextButton()
      ],
    );
  }

  Widget _companyRiskDisclosure() => const Expanded(
          child: SingleChildScrollView(
        child: CustomText(
            key: Key('risk_disclosure_information'),
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.'),
      ));

  Widget _companyRiskDisclosureAgreement() => Padding(
        padding: const EdgeInsets.only(top: 10),
        child: BlocBuilder<RiskDisclosureBloc, BaseResponse<bool>>(
          builder: (context, state) => CustomCheckbox(
            checkboxKey: const Key('risk_disclosure_checkbox'),
            onChanged: (value) => context
                .read<RiskDisclosureBloc>()
                .add(CompanyRiskDisclosureChanged(value!)),
            isChecked: state.data!,
            text: 'Company Disclosure Agreement',
          ),
        ),
      );

  Widget _nextButton() => Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: BlocBuilder<RiskDisclosureBloc, BaseResponse<bool>>(
          builder: (context, state) => CustomTextButton(
              key: const Key('risk_disclosure_next_button'),
              borderRadius: 30,
              buttonText: 'Next',
              disable: !state.data!,
              onClick: () {
                context
                    .read<AccountBloc>()
                    .add(const AccountCurrentStepChanged('next'));
                controller.nextPage(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.ease);
              }),
        ),
      );

  SizedBox _spaceHeight() => const SizedBox(
        height: 10,
      );
}
