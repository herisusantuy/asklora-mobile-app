import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/custom_text.dart';
import '../../../../../core/presentation/custom_text_input.dart';
import '../../../../../core/presentation/question_widget.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../bloc/account_bloc.dart';
import '../../bloc/disclosure_affiliation/bloc/disclosure_affiliation_bloc.dart';
import 'affiliated_form.dart';
import 'controlled_person_from.dart';
import 'family_member_form.dart';
import 'widgets/upgrade_account_button.dart';

class DisclosuresAffiliationsForm extends StatelessWidget {
  const DisclosuresAffiliationsForm({
    Key? key,
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
          const String key = 'question_1';
          return Column(
            children: [
              QuestionWidget(
                keyOption: key,
                key: const Key(key),
                questionText:
                    '1. Affiliated or work with a US registered broker-dealer or FINRA?',
                padding: const EdgeInsets.only(top: 10),
                options: const ['Yes', 'No'],
                selectedAnswer: state.isAffiliated != null
                    ? (state.isAffiliated! ? 'Yes' : 'No')
                    : null,
                onSelected: (value) => context
                    .read<DisclosureAffiliationBloc>()
                    .add(QuestionNo1Changed(_isQuestionAnswered(value))),
              ),
              if (state.isAffiliated == true) const AffiliateForm()
            ],
          );
        },
      );

  Widget _questionNo2() =>
      BlocBuilder<DisclosureAffiliationBloc, DisclosureAffiliationState>(
        buildWhen: (previous, current) =>
            previous.isSeniorExecutive != current.isSeniorExecutive,
        builder: (context, state) {
          const String key = 'question_2';
          return Column(
            children: [
              QuestionWidget(
                keyOption: key,
                key: const Key(key),
                questionText:
                    '2. Senior executive at or a 10% or greater shareholder of a publicly traded company?',
                padding: const EdgeInsets.only(top: 10),
                options: const ['Yes', 'No'],
                selectedAnswer: state.isSeniorExecutive != null
                    ? (state.isSeniorExecutive! ? 'Yes' : 'No')
                    : null,
                onSelected: (value) =>
                    context.read<DisclosureAffiliationBloc>().add(
                          QuestionNo2Changed(value == 'Yes'
                              ? true
                              : value == 'No'
                                  ? false
                                  : false),
                        ),
              ),
              if (state.isSeniorExecutive == true) const ControlledPersonForm()
            ],
          );
        },
      );

  Widget _questionNo3() =>
      BlocBuilder<DisclosureAffiliationBloc, DisclosureAffiliationState>(
        buildWhen: (previous, current) =>
            previous.isSeniorPolitical != current.isSeniorPolitical,
        builder: (context, state) {
          const String key = 'question_3';
          return QuestionWidget(
              keyOption: key,
              key: const Key(key),
              questionText: '3. I am a senior political figure?',
              padding: const EdgeInsets.only(top: 10),
              options: const ['Yes', 'No'],
              selectedAnswer: state.isSeniorPolitical != null
                  ? (state.isSeniorPolitical! ? 'Yes' : 'No')
                  : null,
              onSelected: (value) => context
                  .read<DisclosureAffiliationBloc>()
                  .add(QuestionNo3Changed(value == 'Yes'
                      ? true
                      : value == 'No'
                          ? false
                          : false)));
        },
      );

  Widget _questionNo4() =>
      BlocBuilder<DisclosureAffiliationBloc, DisclosureAffiliationState>(
        buildWhen: (previous, current) =>
            previous.isFamilyMember != current.isFamilyMember,
        builder: (context, state) {
          const String key = 'question_4';
          return Column(
            children: [
              QuestionWidget(
                keyOption: key,
                key: const Key(key),
                questionText:
                    '4. I am a family member or relative of senior political figure?',
                padding: const EdgeInsets.only(top: 10),
                options: const ['Yes', 'No'],
                selectedAnswer: state.isFamilyMember != null
                    ? (state.isFamilyMember! ? 'Yes' : 'No')
                    : null,
                onSelected: (value) => context
                    .read<DisclosureAffiliationBloc>()
                    .add(QuestionNo4Changed(_isQuestionAnswered(value))),
              ),
              if (state.isFamilyMember == true) const FamilyMemberForm()
            ],
          );
        },
      );

  Widget _questionNo5() =>
      BlocBuilder<DisclosureAffiliationBloc, DisclosureAffiliationState>(
        buildWhen: (previous, current) =>
            previous.isAssociates != current.isAssociates ||
            previous.nameOfAffiliatedPerson != current.nameOfAffiliatedPerson,
        builder: (context, state) {
          const String key = 'question_5';
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              QuestionWidget(
                keyOption: key,
                key: const Key(key),
                questionText:
                    '5. I am affiliated with any director, officer, or employee of LORA Technologies Limited or its associates?',
                padding: const EdgeInsets.only(top: 10),
                options: const ['Yes', 'No'],
                selectedAnswer: state.isAssociates != null
                    ? (state.isAssociates! ? 'Yes' : 'No')
                    : null,
                onSelected: (value) => context
                    .read<DisclosureAffiliationBloc>()
                    .add(QuestionNo5Changed(_isQuestionAnswered(value))),
              ),
              if (state.isAssociates == true)
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                  child: CustomTextInput(
                      initialValue: state.nameOfAffiliatedPerson,
                      key: const Key('name_of_affiliated_person_input'),
                      labelText: 'Name of Affiliated Person',
                      onChanged: (value) => context
                          .read<DisclosureAffiliationBloc>()
                          .add(NameOfAffiliatedChanged(value)),
                      hintText: 'Enter field'),
                )
            ],
          );
        },
      );

  Widget _questionNo6() =>
      BlocBuilder<DisclosureAffiliationBloc, DisclosureAffiliationState>(
        buildWhen: (previous, current) =>
            previous.isOwner != current.isOwner ||
            previous.nameOfJointAccount != current.nameOfJointAccount,
        builder: (context, state) {
          const String key = 'question_6';
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              QuestionWidget(
                keyOption: key,
                key: const Key(key),
                questionText:
                    '6. I am the sole beneficial owner of the account?',
                padding: const EdgeInsets.only(top: 10),
                options: const ['Yes', 'No'],
                selectedAnswer: state.isOwner != null
                    ? (state.isOwner! ? 'Yes' : 'No')
                    : null,
                onSelected: (value) => context
                    .read<DisclosureAffiliationBloc>()
                    .add(QuestionNo6Changed(_isQuestionAnswered(value))),
              ),
              if (state.isOwner == false)
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                  child: CustomTextInput(
                      initialValue: state.nameOfJointAccount,
                      key: const Key('name_of_joint_account_input'),
                      labelText: 'Name of Joint Account',
                      onChanged: (value) => context
                          .read<DisclosureAffiliationBloc>()
                          .add(NameOfJointAccountChanged(value)),
                      hintText: 'Enter field'),
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
          const String key = 'question_7';
          return QuestionWidget(
            keyOption: key,
            key: const Key(key),
            questionText:
                '7. I am a director, employee, or licensed person registered with the Hong Kong Securities and Futures Commission?',
            padding: const EdgeInsets.only(top: 10),
            options: const ['Yes', 'No'],
            selectedAnswer: state.isEmployee != null
                ? (state.isEmployee! ? 'Yes' : 'No')
                : null,
            onSelected: (value) {
              context.read<DisclosureAffiliationBloc>().add(
                    QuestionNo7Changed(_isQuestionAnswered(value)),
                  );
            },
          );
        },
      );

  Widget _nextButton() {
    return BlocBuilder<DisclosureAffiliationBloc, DisclosureAffiliationState>(
      builder: (context, state) {
        return UpgradeAccountButton(
            key: const Key('disclosures_affiliations_next_step_button'),
            disable: state.disabledNextButton(),
            onClick: () => context
                .read<NavigationBloc<UpgradeAccountPageStep>>()
                .add(const PageChanged(
                    UpgradeAccountPageStep.signingTaxAgreement)));
      },
    );
  }

  bool _isQuestionAnswered(value) => value == 'Yes' ? true : false;
}
