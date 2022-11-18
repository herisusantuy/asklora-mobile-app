import 'package:asklora_mobile_app/feature/onboarding/ppi/presentation/financial_situation/presentation/financial_situation_question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../../core/presentation/navigation/custom_navigation_widget.dart';
import '../../bloc/question/question_bloc.dart';
import '../../domain/fixture.dart';
import '../../domain/question.dart';
import '../financial_situation/bloc/financial_profile_bloc.dart';
import '../widget/descriptive_question_widget/descriptive_question_widget.dart';
import '../widget/multiple_question_widget/multiple_question_widget.dart';
import 'bloc/privacy_question_bloc.dart';

class PrivacyQuestionScreen extends StatelessWidget {
  final int initialIndex;
  final String headerTitle = 'Privacy';

  const PrivacyQuestionScreen({this.initialIndex = 0, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomNavigationWidget<QuestionPageStep>(
        header: const SizedBox.shrink(),
        child: BlocProvider(
            create: (_) => PrivacyQuestionBloc(initialIndex: initialIndex)
              ..add(NextQuestion()),
            child: BlocConsumer<PrivacyQuestionBloc, PrivacyQuestionState>(
                listener: (context, state) {
              if (state is OnNextQuestion) {
                context.read<QuestionBloc>().add(
                    PrivacyQuestionIndexChanged(state.privacyQuestionIndex));
              } else if (state is OnNextResultSuccessScreen) {
                context.read<NavigationBloc<QuestionPageStep>>().add(
                    const PageChanged(QuestionPageStep.privacyResultSuccess));
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
                  case (QuestionType.unique):
                    return BlocProvider(
                        create: (_) => FinancialProfileBloc(),
                        child: FinancialSituationQuestion(
                          questionCollection: questionCollection,
                          onTapNext: () => context
                              .read<PrivacyQuestionBloc>()
                              .add(NextQuestion()),
                          onCancel: () => context
                              .read<PrivacyQuestionBloc>()
                              .add(PreviousQuestion()),
                        ));
                  default:
                    return const SizedBox.shrink();
                }
              } else {
                return const SizedBox.shrink();
              }
            })));
  }
}
