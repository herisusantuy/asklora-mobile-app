import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../core/presentation/navigation/custom_navigation_widget.dart';
import '../../bloc/question/question_bloc.dart';
import '../../domain/fixture.dart';
import '../../domain/question.dart';
import '../widget/descriptive_question_widget/descriptive_question_widget.dart';
import '../widget/multiple_question_widget/multiple_question_widget.dart';
import 'bloc/investment_style_question_bloc.dart';

class InvestmentStyleQuestionScreen extends StatelessWidget {
  final int initialIndex;
  final String headerTitle = 'Investment Style';

  const InvestmentStyleQuestionScreen({this.initialIndex = 0, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomNavigationWidget(
        header: const SizedBox.shrink(),
        child: BlocProvider(
            create: (_) =>
                InvestmentStyleQuestionBloc(initialIndex: initialIndex)
                  ..add(NextQuestion()),
            child: BlocConsumer<InvestmentStyleQuestionBloc,
                InvestmentStyleQuestionState>(listener: (context, state) {
              if (state is OnNextQuestion) {
                context.read<QuestionBloc>().add(
                    InvestmentStyleQuestionIndexChanged(
                        state.investmentStyleQuestionIndex));
              } else if (state is OnNextBotRecommendationScreen) {
                context
                    .read<NavigationBloc<QuestionPageStep>>()
                    .add(const PageChanged(QuestionPageStep.botRecommendation));
              } else if (state is OnPreviousPersonalisationScreen) {
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
                          .read<InvestmentStyleQuestionBloc>()
                          .add(NextQuestion()),
                      onCancel: () => context
                          .read<InvestmentStyleQuestionBloc>()
                          .add(PreviousQuestion()),
                    );
                  case (QuestionType.descriptive):
                    //TODO defaultAnswer should be from answered question when endpoint is ready
                    return DescriptiveQuestionWidget(
                        key: Key(questionCollection.uid!),
                        defaultAnswer: '',
                        headerTitle: headerTitle,
                        questionCollection: questionCollection,
                        onCancel: () => context
                            .read<InvestmentStyleQuestionBloc>()
                            .add(PreviousQuestion()),
                        onSubmitSuccess: () => context
                            .read<InvestmentStyleQuestionBloc>()
                            .add(NextQuestion()));
                  default:
                    return const SizedBox.shrink();
                }
              } else {
                return const SizedBox.shrink();
              }
            })));
  }
}
