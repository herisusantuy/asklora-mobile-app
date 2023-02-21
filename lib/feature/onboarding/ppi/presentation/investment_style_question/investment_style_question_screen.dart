import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/bloc/app_bloc.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../../core/presentation/navigation/custom_navigation_widget.dart';
import '../../bloc/question/question_bloc.dart';
import '../../bloc/response/user_response_bloc.dart';
import '../../domain/fixture.dart';
import '../../domain/question.dart';
import '../../utils/ppi_utils.dart';
import '../widget/descriptive_question_widget/descriptive_question_widget.dart';
import '../widget/multiple_question_widget/multiple_question_widget.dart';
import '../widget/omni_search_question_widget/omni_search_question_widget.dart';
import 'bloc/investment_style_question_bloc.dart';

class InvestmentStyleQuestionScreen extends StatelessWidget {
  final int initialIndex;

  const InvestmentStyleQuestionScreen({this.initialIndex = 0, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => InvestmentStyleQuestionBloc(initialIndex: initialIndex)
        ..add(NextQuestion()),
      child: Builder(
          builder: (context) => CustomNavigationWidget<QuestionPageStep>(
              onBackPressed: () => onCancel(context),
              header: const SizedBox.shrink(),
              child: BlocConsumer<InvestmentStyleQuestionBloc,
                  InvestmentStyleQuestionState>(listener: (context, state) {
                if (state is OnNextQuestion) {
                  context.read<QuestionBloc>().add(
                      InvestmentStyleQuestionIndexChanged(
                          state.investmentStyleQuestionIndex));
                } else if (state is OnNextResultScreen) {
                  context
                      .read<AppBloc>()
                      .add(const SaveUserJourney(UserJourney.kyc));
                  context.read<NavigationBloc<QuestionPageStep>>().add(
                      const PageChanged(
                          QuestionPageStep.investmentStyleResultEnd));

                  debugPrint(
                      'Krishna investment_question_screen OnNextResultEndScreen');
                  // context.read<UserResponseBloc>().add(SendBulkResponse());
                } else if (state is OnPreviousPage) {
                  context
                      .read<NavigationBloc<QuestionPageStep>>()
                      .add(const PagePop());
                }
              }, builder: (context, state) {
                if (state is OnNextQuestion) {
                  Question question = state.question;
                  switch (state.questionType) {
                    case (QuestionType.choices):
                      return MultipleChoiceQuestionWidget(
                        key: Key(question.questionId!),
                        question: question,
                        defaultChoiceIndex: PpiDefaultAnswer.getIndex(
                            context, question.questionId!),
                        onSubmitSuccess: () => onSubmitSuccess(context),
                        onCancel: () => onCancel(context),
                      );
                    case (QuestionType.descriptive):
                      return DescriptiveQuestionWidget(
                          key: Key(question.question!),
                          defaultAnswer: PpiDefaultAnswer.getString(
                              context, question.questionId!),
                          question: question,
                          onCancel: () => onCancel(context),
                          onSubmitSuccess: () => onSubmitSuccess(context));
                    case (QuestionType.omniSearch):
                      return OmniSearchQuestionWidget(
                        key: Key(question.questionId!),
                        defaultOmniSearch: PpiDefaultAnswer.getOmniSearch(
                            context, question.questionId!),
                        question: question,
                        onSubmitSuccess: () => onSubmitSuccess(context),
                        onCancel: () => onCancel(context),
                      );
                    default:
                      return const SizedBox.shrink();
                  }
                } else {
                  return const SizedBox.shrink();
                }
              }))),
    );
  }

  void onSubmitSuccess(BuildContext context) {
    context
        .read<QuestionBloc>()
        .add(const CurrentInvestmentStylePageIncremented());
    context.read<InvestmentStyleQuestionBloc>().add(NextQuestion());
  }

  void onCancel(BuildContext context) {
    context
        .read<QuestionBloc>()
        .add(const CurrentInvestmentStylePageDecremented());
    context.read<InvestmentStyleQuestionBloc>().add(PreviousQuestion());
  }
}
