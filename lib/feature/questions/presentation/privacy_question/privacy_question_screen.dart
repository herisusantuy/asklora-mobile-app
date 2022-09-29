import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../core/presentation/navigation/custom_navigation_widget.dart';
import '../../bloc/question/question_bloc.dart';
import '../../domain/fixture.dart';
import '../../domain/question.dart';
import '../personalisation_question/bloc/personalisation_question_bloc.dart';
import '../widget/descriptive_question_widget/descriptive_question_widget.dart';
import '../widget/multiple_question_widget/multiple_question_widget.dart';
import '../widget/personalisation_question_widget/personalisation_question_widget.dart';
import 'bloc/privacy_question_bloc.dart';

class PrivacyQuestionScreen extends StatelessWidget {
  final int initialIndex;
  final String headerTitle = 'Privacy';

  const PrivacyQuestionScreen({this.initialIndex = 0, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomNavigationWidget(
        header: const SizedBox.shrink(),
        child: BlocProvider(
            create: (_) => PrivacyQuestionBloc(initialIndex: initialIndex)
              ..add(NextQuestion()),
            child: BlocConsumer<PrivacyQuestionBloc, PrivacyQuestionState>(
                listener: (context, state) {
              if (state is OnNextQuestion) {
                context.read<QuestionBloc>().add(
                    PrivacyQuestionIndexChanged(state.privacyQuestionIndex));
              } else if (state is OnNextPersonalisationQuestionScreen) {
                context
                    .read<NavigationBloc<QuestionPageStep>>()
                    .add(const PageChanged(QuestionPageStep.personalisation));
              } else if (state is OnPreviousSignInSuccessScreen) {
                context
                    .read<NavigationBloc<QuestionPageStep>>()
                    .add(const PagePop());
              }
            }, builder: (context, state) {
              if (state is OnNextQuestion) {
                QuestionCollection questionCollection = state.question;
                switch (state.questionType) {
                  case (QuestionType.choices):
                    //TODO defaultChoiceIndex should be from answered question when endpoint is ready
                    return MultipleChoiceQuestionWidget(
                      headerTitle: headerTitle,
                      key: Key(questionCollection.uid!),
                      questionCollection: questionCollection,
                      defaultChoiceIndex: -1,
                      onSubmitSuccess: () => context
                          .read<PrivacyQuestionBloc>()
                          .add(NextQuestion()),
                      onCancel: () => context
                          .read<PrivacyQuestionBloc>()
                          .add(PreviousQuestion()),
                    );
                  case (QuestionType.descriptive):
                    //TODO defaultAnswer should be from answered question when endpoint is ready
                    return DescriptiveQuestionWidget(
                        defaultAnswer: '',
                        headerTitle: headerTitle,
                        questionCollection: questionCollection,
                        onCancel: () => context
                            .read<PrivacyQuestionBloc>()
                            .add(PreviousQuestion()),
                        onSubmitSuccess: () => context
                            .read<PrivacyQuestionBloc>()
                            .add(NextQuestion()));
                  case (QuestionType.slider):
                    return PersonalisationQuestionWidget(
                        onSubmitSuccess: () => context
                            .read<PersonalisationQuestionBloc>()
                            .add(NextPersonalisationQuestion()),
                        onCancel: () => context
                            .read<PersonalisationQuestionBloc>()
                            .add(PreviousPersonalisationQuestion()),
                        questionCollection: questionCollection);
                  default:
                    return const SizedBox.shrink();
                }
              } else {
                return const SizedBox.shrink();
              }
            })));
  }
}
