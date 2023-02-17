import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/bloc/app_bloc.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../../core/presentation/navigation/custom_navigation_widget.dart';
import '../../../../tabs/for_you/bloc/for_you_bloc.dart';
import '../../../../tabs/for_you/for_you_screen_form.dart';
import '../../bloc/question/question_bloc.dart';
import '../../domain/fixture.dart';
import '../../domain/question.dart';
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
      child: CustomNavigationWidget<QuestionPageStep>(
          onBackPressed: () => onCancel(context),
          header: const SizedBox.shrink(),
          child: BlocConsumer<InvestmentStyleQuestionBloc,
              InvestmentStyleQuestionState>(
            listener: _investmentStyleQuestionListener,
            builder: _investmentStyleQuestionBuilder,
          )),
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

  void _investmentStyleQuestionListener(
      BuildContext context, InvestmentStyleQuestionState state) {
    if (state is OnNextQuestion) {
      _onNextQuestionCallback(context, state.investmentStyleQuestionIndex);
    } else if (state is OnNextResultScreen) {
      _onNextResultScreenCallback(context);
    } else if (state is OnPreviousPage) {
      _onOnPreviousPageCallback(context);
    }
  }

  Widget _investmentStyleQuestionBuilder(
      BuildContext context, InvestmentStyleQuestionState state) {
    if (state is OnNextQuestion) {
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
              key: Key(questionCollection.uid!),
              defaultAnswer: '',
              questionCollection: questionCollection,
              onCancel: () => onCancel(context),
              onSubmitSuccess: () => onSubmitSuccess(context));
        case (QuestionType.omniSearch):
          return OmniSearchQuestionWidget(
            key: Key(questionCollection.uid!),
            enableBackNavigation: !UserJourney.compareUserJourney(
                source: context.read<AppBloc>().state.userJourney,
                target: UserJourney.freeBotStock),
            questionCollection: questionCollection,
            onSubmitSuccess: () => onSubmitSuccess(context),
            onCancel: () => onCancel(context),
          );

        default:
          return const SizedBox.shrink();
      }
    } else {
      return const SizedBox.shrink();
    }
  }

  void _onNextResultScreenCallback(BuildContext context) {
    UserJourney.onAlreadyPassed(
        context: context,
        target: UserJourney.investmentStyle,
        onTrueCallback: () =>
            context.read<ForYouBloc>().add(SaveInvestmentStyleAnswer()),
        onFalseCallback: () => context
            .read<AppBloc>()
            .add(const SaveUserJourney(UserJourney.kyc)));
    context
        .read<NavigationBloc<QuestionPageStep>>()
        .add(const PageChanged(QuestionPageStep.investmentStyleResultEnd));
  }

  void _onOnPreviousPageCallback(BuildContext context) {
    UserJourney.onAlreadyPassed(
        context: context,
        target: UserJourney.freeBotStock,
        onTrueCallback: () =>
            context.read<NavigationBloc<ForYouPage>>().add(const PagePop()),
        onFalseCallback: () => context
            .read<NavigationBloc<QuestionPageStep>>()
            .add(const PagePop()));
  }

  void _onNextQuestionCallback(
          BuildContext context, int investmentStyleQuestionIndex) =>
      context.read<QuestionBloc>().add(
          InvestmentStyleQuestionIndexChanged(investmentStyleQuestionIndex));
}
