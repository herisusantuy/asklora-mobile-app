import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../../core/presentation/navigation/custom_navigation_widget.dart';
import '../../bloc/question/question_bloc.dart';
import '../../domain/fixture.dart';
import '../../domain/question.dart';
import '../../utils/ppi_utils.dart';
import '../widget/descriptive_question_widget/descriptive_question_widget.dart';
import '../widget/multiple_question_widget/multiple_question_widget.dart';
import 'bloc/personalisation_question_bloc.dart';

class PersonalisationQuestionScreen extends StatelessWidget {
  final int initialIndex;

  const PersonalisationQuestionScreen({
    this.initialIndex = 0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PersonalisationQuestionBloc(initialIndex: initialIndex)
        ..add(NextPersonalisationQuestion()),
      child: Builder(
          builder: (context) => CustomNavigationWidget<QuestionPageStep>(
                onBackPressed: () => onCancel(context),
                header: const SizedBox.shrink(),
                child: BlocConsumer<PersonalisationQuestionBloc,
                    PersonalisationQuestionState>(
                  listener: (context, state) {
                    if (state is OnNextPersonalizationQuestion) {
                      context.read<QuestionBloc>().add(
                          PersonalisationQuestionIndexChanged(
                              state.personalizationQuestionIndex));
                    } else if (state is OnPreviousToPrivacyQuestionScreen) {
                      context
                          .read<NavigationBloc<QuestionPageStep>>()
                          .add(const PagePop());
                    } else if (state is OnNextResultEndScreen) {
                      context.read<NavigationBloc<QuestionPageStep>>().add(
                          const PageChanged(
                              QuestionPageStep.personalisationResultEnd));
                    }
                  },
                  builder: (context, state) {
                    if (state is OnNextPersonalizationQuestion) {
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
                              defaultAnswer: PpiDefaultAnswer.getString(
                                  context, question.questionId!),
                              question: question,
                              onSubmitSuccess: () => onSubmitSuccess(context),
                              onCancel: () => onCancel(context));
                        default:
                          return const SizedBox.shrink();
                      }
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              )),
    );
  }

  void onSubmitSuccess(BuildContext context) {
    context
        .read<QuestionBloc>()
        .add(const CurrentPersonalisationPageIncremented());
    context
        .read<PersonalisationQuestionBloc>()
        .add(NextPersonalisationQuestion());
  }

  void onCancel(BuildContext context) {
    context
        .read<QuestionBloc>()
        .add(const CurrentPersonalisationPageDecremented());
    context
        .read<PersonalisationQuestionBloc>()
        .add(PreviousPersonalisationQuestion());
  }
}
