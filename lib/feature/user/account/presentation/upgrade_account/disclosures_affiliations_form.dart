import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/custom_text.dart';
import '../../../../../core/presentation/custom_text_button.dart';
import '../../../../../core/presentation/question_widget.dart';
import '../../bloc/account_bloc.dart';
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
                _question1(),
                _question2(),
                _question3(),
                _question4(),
                _question5(),
                _question6(),
                _question7(),
              ],
            ),
          ),
        ),
        _nextButton(),
      ],
    );
  }

  Widget _question1() => BlocConsumer<AccountBloc, AccountState>(
        listenWhen: (previous, current) =>
            previous.isAffiliated != current.isAffiliated,
        listener: (context, state) {
          if (state.isAffiliated!) {
            modalUploadDocument(
                title: 'Upload: "Account Approval Letter"',
                context: context,
                onClick: () => '');
          }
        },
        buildWhen: (previous, current) =>
            previous.isAffiliated != current.isAffiliated,
        builder: (context, state) {
          print('question 1 : ${state.isAffiliated}');
          return QuestionWidget(
            key: const Key('disclosure_affiliation_question_1'),
            questionText:
                '1. Affiliated or work with a US registered broker-dealer or FINRA?',
            padding: const EdgeInsets.only(top: 10),
            options: const ['Yes', 'No'],
            selectedAnswer: state.isAffiliated != null
                ? (state.isAffiliated! ? 'Yes' : 'No')
                : null,
            onSelected: (value) => context.read<AccountBloc>().add(
                AccountQuestion1ofAffiliationChanged(
                    value == 'Yes' ? true : false)),
          );
        },
      );
  Widget _question2() => BlocConsumer<AccountBloc, AccountState>(
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
          print('question 2 : ${state.isSeniorExecutive}');
          return QuestionWidget(
              key: const Key('disclosure_affiliation_question_2'),
              questionText:
                  '2. Senior executive at or a 10% or greater shareholder of a publicly traded company?',
              padding: const EdgeInsets.only(top: 10),
              options: const ['Yes', 'No'],
              selectedAnswer: state.isSeniorExecutive != null
                  ? (state.isSeniorExecutive! ? 'Yes' : 'No')
                  : null,
              onSelected: (value) => context.read<AccountBloc>().add(
                  AccountQuestion2ofAffiliationChanged(
                      value == 'Yes' ? true : false)));
        },
      );
  Widget _question3() => BlocBuilder<AccountBloc, AccountState>(
        buildWhen: (previous, current) =>
            previous.isSeniorPolitical != current.isSeniorPolitical,
        builder: (context, state) {
          print('question 3 : ${state.isSeniorPolitical}');
          return QuestionWidget(
              key: const Key('disclosure_affiliation_question_3'),
              questionText: '3. I am a senior political figure?',
              padding: const EdgeInsets.only(top: 10),
              options: const ['Yes', 'No'],
              selectedAnswer: state.isSeniorPolitical != null
                  ? (state.isSeniorPolitical! ? 'Yes' : 'No')
                  : null,
              onSelected: (value) => context.read<AccountBloc>().add(
                  AccountQuestion3ofAffiliationChanged(
                      value == 'Yes' ? true : false)));
        },
      );
  Widget _question4() => BlocBuilder<AccountBloc, AccountState>(
        buildWhen: (previous, current) =>
            previous.isFamilyMember != current.isFamilyMember,
        builder: (context, state) {
          print('question 4 : ${state.isFamilyMember}');
          return QuestionWidget(
            key: const Key('disclosure_affiliation_question_4'),
            questionText:
                '4. I am a family member or relative of senior political figure?',
            padding: const EdgeInsets.only(top: 10),
            options: const ['Yes', 'No'],
            selectedAnswer: state.isFamilyMember != null
                ? (state.isFamilyMember! ? 'Yes' : 'No')
                : null,
            onSelected: (value) => context.read<AccountBloc>().add(
                AccountQuestion4ofAffiliationChanged(
                    value == 'Yes' ? true : false)),
          );
        },
      );
  Widget _question5() => BlocConsumer<AccountBloc, AccountState>(
        listenWhen: (previous, current) =>
            previous.isAssociates != current.isAssociates,
        listener: (context, state) {
          if (state.isAssociates!) {
            showModalTextInput(
                labelTextInput: 'Name of Affiliated Person',
                context: context,
                onChanged: (value) => value,
                onSubmit: () => Navigator.pop(context));
          }
        },
        buildWhen: (previous, current) =>
            previous.isAssociates != current.isAssociates,
        builder: (context, state) {
          print('question 5 : ${state.isAssociates}');
          return QuestionWidget(
            key: const Key('disclosure_affiliation_question_5'),
            questionText:
                '5. I am affiliated with any director, officer, or employee of LORA Technologies Limited or its associates?',
            padding: const EdgeInsets.only(top: 10),
            options: const ['Yes', 'No'],
            selectedAnswer: state.isAssociates != null
                ? (state.isAssociates! ? 'Yes' : 'No')
                : null,
            onSelected: (value) => context.read<AccountBloc>().add(
                AccountQuestion5ofAffiliationChanged(
                    value == 'Yes' ? true : false)),
          );
        },
      );
  Widget _question6() => BlocConsumer<AccountBloc, AccountState>(
        listenWhen: (previous, current) => previous.isOwner != current.isOwner,
        listener: (context, state) {
          if (state.isOwner!) {
            showModalTextInput(
                labelTextInput: 'Name of Joint Account',
                context: context,
                onChanged: (value) => value,
                onSubmit: () => Navigator.pop(context));
          }
        },
        buildWhen: (previous, current) => previous.isOwner != current.isOwner,
        builder: (context, state) {
          print('question 6 : ${state.isOwner}');
          return QuestionWidget(
            key: const Key('disclosure_affiliation_question_6'),
            questionText: '6. I am the sole beneficial owner of the account?',
            padding: const EdgeInsets.only(top: 10),
            options: const ['Yes', 'No'],
            selectedAnswer:
                state.isOwner != null ? (state.isOwner! ? 'Yes' : 'No') : null,
            onSelected: (value) => context.read<AccountBloc>().add(
                AccountQuestion6ofAffiliationChanged(
                    value == 'Yes' ? true : false)),
          );
        },
      );
  Widget _question7() => BlocConsumer<AccountBloc, AccountState>(
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
          print('question 7 : ${state.isEmployee}');
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
              context.read<AccountBloc>().add(
                    AccountQuestion7ofAffiliationChanged(
                        value == 'Yes' ? true : false),
                  );
            },
          );
        },
      );

  Widget _nextButton() {
    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: CustomTextButton(
              key: const Key('disclosures_affiliations_next_step_button'),
              borderRadius: 30,
              buttonText: 'Next',
              disable: _disabledNextButton(state),
              onClick: () {
                context
                    .read<AccountBloc>()
                    .add(const AccountCurrentStepChanged('next'));
                controller.nextPage(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.ease);
              }),
        );
      },
    );
  }

  bool _disabledNextButton(AccountState state) {
    if (state.isAffiliated != null &&
        state.isSeniorExecutive != null &&
        state.isSeniorPolitical != null &&
        state.isFamilyMember != null &&
        state.isAssociates != null &&
        state.isOwner != null &&
        (state.isEmployee != null && state.isEmployee != true)) {
      return false;
    }
    return true;
  }
}
