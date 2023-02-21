import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../../core/presentation/navigation/custom_navigation_widget.dart';
import '../../bloc/question/question_bloc.dart';
import '../../domain/fixture.dart';
import '../../domain/question.dart';
import '../../utils/ppi_utils.dart';
import '../financial_situation/bloc/financial_profile_bloc.dart';
import '../financial_situation/presentation/financial_situation_question.dart';
import '../widget/descriptive_question_widget/descriptive_question_widget.dart';
import '../widget/multiple_question_widget/multiple_question_widget.dart';
import 'bloc/privacy_question_bloc.dart';

class PrivacyQuestionScreen extends StatelessWidget {
  final int initialIndex;

  const PrivacyQuestionScreen({this.initialIndex = 0, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => PrivacyQuestionBloc(initialIndex: initialIndex)
          ..add(NextQuestion()),
        child: Builder(
            builder: (context) => CustomNavigationWidget<QuestionPageStep>(
                  onBackPressed: () => onCancel(context),
                  header: const SizedBox.shrink(),
                  child:
                      BlocConsumer<PrivacyQuestionBloc, PrivacyQuestionState>(
                          listener: (context, state) {
                    if (state is OnNextQuestion) {
                      context.read<QuestionBloc>().add(
                          PrivacyQuestionIndexChanged(
                              state.privacyQuestionIndex));
                    } else if (state is OnNextResultSuccessScreen) {
                      debugPrint(
                          'Krishna privacy_question_screen OnNextResultSuccessScreen');
                      context.read<NavigationBloc<QuestionPageStep>>().add(
                          const PageChanged(
                              QuestionPageStep.privacyResultSuccess));
                    } else if (state is OnPreviousSignInSuccessScreen) {
                      debugPrint(
                          'Krishna privacy_question_screen OnPreviousSignInSuccessScreen');
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
                              onCancel: () => onCancel(context),
                              onSubmitSuccess: () => onSubmitSuccess(context));
                        case (QuestionType.descriptive):
                          return DescriptiveQuestionWidget(
                            defaultAnswer: PpiDefaultAnswer.getString(
                                context, question.questionId!),
                            question: question,
                            onCancel: () => onCancel(context),
                            onSubmitSuccess: () => onSubmitSuccess(context),
                          );
                        case (QuestionType.unique):
                          return BlocProvider(
                              create: (_) => FinancialProfileBloc(),
                              child: FinancialSituationQuestion(
                                question: question,
                                onTapNext: () => onSubmitSuccess(context),
                                onCancel: () => onCancel(context),
                              ));
                        default:
                          return const SizedBox.shrink();
                      }
                    } else {
                      return const SizedBox.shrink();
                    }
                  }),
                )));
  }

  void onSubmitSuccess(BuildContext context) {
    context.read<QuestionBloc>().add(const CurrentPrivacyPageIncremented());
    context.read<PrivacyQuestionBloc>().add(NextQuestion());
  }

  void onCancel(BuildContext context) {
    context.read<QuestionBloc>().add(const CurrentPrivacyPageDecremented());
    context.read<PrivacyQuestionBloc>().add(PreviousQuestion());
  }
}
