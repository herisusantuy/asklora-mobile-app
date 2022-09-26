import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../core/presentation/navigation/custom_navigation_widget.dart';
import '../../bloc/question/question_bloc.dart';
import '../../domain/fixture.dart';
import '../../domain/question.dart';
import '../widget/descriptive_question_widget.dart';
import '../widget/multiple_question_widget/multiple_question_widget.dart';
import '../widget/slider_question_widget.dart';
import 'bloc/privacy_question_bloc.dart';

class PrivacyQuestionScreen extends StatelessWidget {
  final int initialIndex;

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
                      key: Key(questionCollection.uid!),
                      questionCollection: questionCollection,
                      defaultChoiceIndex: -1,
                    );
                  case (QuestionType.descriptive):
                    return DescriptiveQuestionWidget(
                        questionCollection: questionCollection);
                  case (QuestionType.slider):
                    return SliderQuestionWidget(
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
