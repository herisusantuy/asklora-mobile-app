import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/custom_text.dart';
import '../../../../../core/presentation/custom_text_button.dart';
import '../../../../../core/presentation/custom_text_input.dart';
import '../../../../../core/presentation/question_widget.dart';
import '../../bloc/disclosure_affiliation/bloc/disclosure_affiliation_bloc.dart';
import '../widgets/modal_text_input.dart';
import '../widgets/modal_upload_document.dart';

class DisclosuresAffiliationsForm extends StatelessWidget {
  final PageController controller;
  const DisclosuresAffiliationsForm({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(
                  'Do any of the following apply to you or a member of your immediate family?',
                  padding: EdgeInsets.only(top: 20),
                  type: FontType.bodyTextBold,
                ),
                _questionNo1(),
                _questionNo2(),
                _questionNo3(),
                _questionNo4(),
                _questionNo5(),
                _questionNo6(),
                _questionNo7(),
              ],
            ),
          ),
        ),
        _nextButton(),
      ],
    );
  }

  Widget _questionNo1() =>
      BlocBuilder<DisclosureAffiliationBloc, DisclosureAffiliationState>(
        buildWhen: (previous, current) =>
            previous.isAffiliated != current.isAffiliated,
        builder: (context, state) {
          return Column(
            children: [
              QuestionWidget(
                key: const Key('disclosure_affiliation_question_1'),
                questionText:
                    '1. Affiliated or work with a US registered broker-dealer or FINRA?',
                padding: const EdgeInsets.only(top: 10),
                options: const ['Yes', 'No'],
                selectedAnswer: state.isAffiliated != null
                    ? (state.isAffiliated! ? 'Yes' : 'No')
                    : null,
                onSelected: (value) => context
                    .read<DisclosureAffiliationBloc>()
                    .add(QuestionNo1Changed(value == 'Yes' ? true : false)),
              ),
              if (state.isAffiliated!)
                Column(
                  children: [
                    _affiliatedCompanyName(),
                    _affiliateCompanyAddress(),
                    _affiliateCompanyCity(),
                    _affiliateCompanyStreet(),
                    _affiliateCompanyCountry(),
                    _affiliateCompanyEmail(),
                  ],
                )
            ],
          );
        },
      );

  Widget _affiliatedCompanyName() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: CustomTextInput(
          labelText: 'Company Name',
          onChanged: (value) => value,
          hintText: 'Enter Company Name'),
    );
  }

  Widget _affiliateCompanyAddress() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: CustomTextInput(
          labelText: 'Company Street Address',
          onChanged: (value) => value,
          hintText: 'Enter Company Street Address'),
    );
  }

  Widget _affiliateCompanyCity() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: CustomTextInput(
          labelText: 'Company City',
          onChanged: (value) => value,
          hintText: 'Enter Company City'),
    );
  }

  Widget _affiliateCompanyStreet() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: CustomTextInput(
          labelText: 'Company State',
          onChanged: (value) => value,
          hintText: 'Enter Company State'),
    );
  }

  Widget _affiliateCompanyCountry() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: CustomTextInput(
          labelText: 'Company Country',
          onChanged: (value) => value,
          hintText: 'Enter Company Country'),
    );
  }

  Widget _affiliateCompanyEmail() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: CustomTextInput(
          labelText: 'Company Compliance Email',
          onChanged: (value) => value,
          hintText: 'Enter Company Compliance Email'),
    );
  }

  Widget _questionNo2() =>
      BlocConsumer<DisclosureAffiliationBloc, DisclosureAffiliationState>(
        listenWhen: (previous, current) =>
            previous.isSeniorExecutive != current.isSeniorExecutive,
        listener: (context, state) {
          if (state.isSeniorExecutive!) {
            modalUploadDocument(
                title: 'Upload: "Account Approval Letter"',
                context: context,
                onClick: () => '');
          }
        },
        buildWhen: (previous, current) =>
            previous.isSeniorExecutive != current.isSeniorExecutive,
        builder: (context, state) {
          return QuestionWidget(
              key: const Key('disclosure_affiliation_question_2'),
              questionText:
                  '2. Senior executive at or a 10% or greater shareholder of a publicly traded company?',
              padding: const EdgeInsets.only(top: 10),
              options: const ['Yes', 'No'],
              selectedAnswer: state.isSeniorExecutive != null
                  ? (state.isSeniorExecutive! ? 'Yes' : 'No')
                  : null,
              onSelected: (value) => context
                  .read<DisclosureAffiliationBloc>()
                  .add(QuestionNo2Changed(value == 'Yes' ? true : false)));
        },
      );
  Widget _questionNo3() =>
      BlocBuilder<DisclosureAffiliationBloc, DisclosureAffiliationState>(
        buildWhen: (previous, current) =>
            previous.isSeniorPolitical != current.isSeniorPolitical,
        builder: (context, state) {
          return QuestionWidget(
              key: const Key('disclosure_affiliation_question_3'),
              questionText: '3. I am a senior political figure?',
              padding: const EdgeInsets.only(top: 10),
              options: const ['Yes', 'No'],
              selectedAnswer: state.isSeniorPolitical != null
                  ? (state.isSeniorPolitical! ? 'Yes' : 'No')
                  : null,
              onSelected: (value) => context
                  .read<DisclosureAffiliationBloc>()
                  .add(QuestionNo3Changed(value == 'Yes' ? true : false)));
        },
      );
  Widget _questionNo4() =>
      BlocBuilder<DisclosureAffiliationBloc, DisclosureAffiliationState>(
        buildWhen: (previous, current) =>
            previous.isFamilyMember != current.isFamilyMember,
        builder: (context, state) {
          return QuestionWidget(
            key: const Key('disclosure_affiliation_question_4'),
            questionText:
                '4. I am a family member or relative of senior political figure?',
            padding: const EdgeInsets.only(top: 10),
            options: const ['Yes', 'No'],
            selectedAnswer: state.isFamilyMember != null
                ? (state.isFamilyMember! ? 'Yes' : 'No')
                : null,
            onSelected: (value) => context
                .read<DisclosureAffiliationBloc>()
                .add(QuestionNo4Changed(value == 'Yes' ? true : false)),
          );
        },
      );
  Widget _questionNo5() =>
      BlocConsumer<DisclosureAffiliationBloc, DisclosureAffiliationState>(
        listenWhen: (previous, current) =>
            previous.isAssociates != current.isAssociates,
        listener: (context, state) {
          if (state.isAssociates!) {
            showModalTextInput(
                labelTextInput: 'Name of Affiliated Person',
                context: context,
                onChanged: (value) => context
                    .read<DisclosureAffiliationBloc>()
                    .add(NameOfAffiliatedChanged(value)),
                onSubmit: () {
                  context
                      .read<DisclosureAffiliationBloc>()
                      .add(const NameOfAffiliatedSubmitted());
                  Navigator.pop(context);
                });
          }
        },
        buildWhen: (previous, current) =>
            previous.isAssociates != current.isAssociates ||
            current.isNameOfAffiliatedPersonSubmitted == true,
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              QuestionWidget(
                key: const Key('disclosure_affiliation_question_5'),
                questionText:
                    '5. I am affiliated with any director, officer, or employee of LORA Technologies Limited or its associates?',
                padding: const EdgeInsets.only(top: 10),
                options: const ['Yes', 'No'],
                selectedAnswer: state.isAssociates != null
                    ? (state.isAssociates! ? 'Yes' : 'No')
                    : null,
                onSelected: (value) => context
                    .read<DisclosureAffiliationBloc>()
                    .add(QuestionNo5Changed(value == 'Yes' ? true : false)),
              ),
              if (state.isNameOfAffiliatedPersonSubmitted &&
                  state.isAssociates! &&
                  state.nameOfAffiliatedPerson.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(
                        'Name of Joint Account :',
                        type: FontType.formTitle,
                      ),
                      CustomText(state.nameOfAffiliatedPerson),
                    ],
                  ),
                )
            ],
          );
        },
      );
  Widget _questionNo6() =>
      BlocConsumer<DisclosureAffiliationBloc, DisclosureAffiliationState>(
        listenWhen: (previous, current) => previous.isOwner != current.isOwner,
        listener: (context, state) {
          if (state.isOwner!) {
            showModalTextInput(
                labelTextInput: 'Name of Joint Account',
                context: context,
                onChanged: (value) => context
                    .read<DisclosureAffiliationBloc>()
                    .add(NameOfJointAccountChanged(value)),
                onSubmit: () {
                  context
                      .read<DisclosureAffiliationBloc>()
                      .add(const NameOfJointAccountSubmitted());
                  Navigator.pop(context);
                });
          }
        },
        buildWhen: (previous, current) =>
            previous.isOwner != current.isOwner ||
            current.isNameOfJointAccountSubmitted == true,
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              QuestionWidget(
                key: const Key('disclosure_affiliation_question_6'),
                questionText:
                    '6. I am the sole beneficial owner of the account?',
                padding: const EdgeInsets.only(top: 10),
                options: const ['Yes', 'No'],
                selectedAnswer: state.isOwner != null
                    ? (state.isOwner! ? 'Yes' : 'No')
                    : null,
                onSelected: (value) => context
                    .read<DisclosureAffiliationBloc>()
                    .add(QuestionNo6Changed(value == 'Yes' ? true : false)),
              ),
              if (state.isNameOfJointAccountSubmitted &&
                  state.nameOfJointAccount.isNotEmpty &&
                  state.isOwner!)
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(
                        'Name of Joint Account :',
                        type: FontType.formTitle,
                      ),
                      CustomText(state.nameOfJointAccount),
                    ],
                  ),
                )
            ],
          );
        },
      );
  Widget _questionNo7() =>
      BlocConsumer<DisclosureAffiliationBloc, DisclosureAffiliationState>(
        listenWhen: (previous, current) =>
            previous.isEmployee != current.isEmployee,
        listener: (context, state) {
          if (state.isEmployee!) {
            showModalBottomSheet(
                context: context,
                builder: (_) => SafeArea(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        child: const CustomText(
                          'Sorry, you’re not eligible for AskLORA Employee of SFC are ineligible to open brokerage accounts',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ));
          }
        },
        buildWhen: (previous, current) =>
            previous.isEmployee != current.isEmployee,
        builder: (context, state) {
          return QuestionWidget(
            key: const Key('disclosure_affiliation_question_7'),
            questionText:
                '7. I am a director, employee, or licensed person registered with the Hong Kong Securities and Futures Commission?',
            padding: const EdgeInsets.only(top: 10),
            options: const ['Yes', 'No'],
            selectedAnswer: state.isEmployee != null
                ? (state.isEmployee! ? 'Yes' : 'No')
                : null,
            onSelected: (value) {
              context.read<DisclosureAffiliationBloc>().add(
                    QuestionNo7Changed(value == 'Yes' ? true : false),
                  );
            },
          );
        },
      );

  Widget _nextButton() {
    return BlocBuilder<DisclosureAffiliationBloc, DisclosureAffiliationState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: CustomTextButton(
              key: const Key('disclosures_affiliations_next_step_button'),
              borderRadius: 30,
              buttonText: 'Next',
              disable: state.disabledNextButton(),
              onClick: () {
                controller.nextPage(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.ease);
              }),
        );
      },
    );
  }
}
