import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../../core/presentation/navigation/custom_navigation_widget.dart';
import '../../bloc/question/question_bloc.dart';
import '../../domain/fixture.dart';
import '../../domain/question.dart';
import '../widget/descriptive_question_widget/descriptive_question_widget.dart';
import '../widget/multiple_question_widget/multiple_question_widget.dart';
import '../widget/slider_question_widget/slider_question_widget.dart';
import 'bloc/personalisation_question_bloc.dart';

class PersonalisationQuestionScreen extends StatelessWidget {
  final int initialIndex;

  const PersonalisationQuestionScreen({
    this.initialIndex = 0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomNavigationWidget(
      header: const SizedBox.shrink(),
      child: BlocProvider(
        create: (_) => PersonalisationQuestionBloc(initialIndex: initialIndex)
          ..add(NextPersonalisationQuestion()),
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
                  const PageChanged(QuestionPageStep.personalisationResultEnd));
            }
          },
          builder: (context, state) {
            if (state is OnNextPersonalizationQuestion) {
              QuestionCollection questionCollection = state.question;
              switch (state.questionType) {
                case (QuestionType.choices):

                  //TODO defaultChoiceIndex should be from answered question when endpoint is ready
                  return MultipleChoiceQuestionWidget(
                    key: Key(questionCollection.uid!),
                    questionCollection: questionCollection,
                    defaultChoiceIndex: -1,
                    onSubmitSuccess: () => onSubmitSuccess(context),
                    onCancel: () => onCancel(context),
                  );
                case (QuestionType.descriptive):
                  //TODO defaultAnswer should be from answered question when endpoint is ready
                  return DescriptiveQuestionWidget(
                      defaultAnswer: '',
                      questionCollection: questionCollection,
                      onSubmitSuccess: () => onSubmitSuccess(context),
                      onCancel: () => onCancel(context));
                case (QuestionType.slider):
                  return SliderQuestionWidget(
                    key: Key(questionCollection.uid!),
                    questionCollection: questionCollection,
                    defaultChoiceIndex: -1,
                    onSubmitSuccess: () => onSubmitSuccess(context),
                    onCancel: () => onCancel(context),
                  );
                default:
                  return const SizedBox.shrink();
              }
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }

  void onSubmitSuccess(BuildContext context) {
    context.read<QuestionBloc>().add(const CurrentPageIncremented());
    context
        .read<PersonalisationQuestionBloc>()
        .add(NextPersonalisationQuestion());
  }

  void onCancel(BuildContext context) {
    context.read<QuestionBloc>().add(const CurrentPageDecremented());
    context
        .read<PersonalisationQuestionBloc>()
        .add(PreviousPersonalisationQuestion());
  }
}
