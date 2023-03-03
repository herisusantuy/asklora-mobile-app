import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/bloc/app_bloc.dart';
import '../../../../../core/domain/base_response.dart';
import '../../../../../core/presentation/loading/custom_loading_overlay.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../../core/utils/storage/shared_preference.dart';
import '../../../../../core/values/app_values.dart';
import '../../../../onboarding/ppi/bloc/question/question_bloc.dart';
import '../../../../onboarding/ppi/bloc/response/user_response_bloc.dart';
import '../../../../onboarding/ppi/domain/fixture.dart';
import '../../../../onboarding/ppi/domain/question.dart';
import '../../../../onboarding/ppi/presentation/ppi_screen.dart';
import '../../../../onboarding/ppi/presentation/widget/descriptive_question_widget/descriptive_question_widget.dart';
import '../../../../onboarding/ppi/presentation/widget/multiple_question_widget/multiple_question_widget.dart';
import '../../../../onboarding/ppi/presentation/widget/omni_search_question_widget/omni_search_question_widget.dart';
import '../../../../onboarding/ppi/repository/ppi_question_repository.dart';
import '../../../../onboarding/ppi/repository/ppi_response_repository.dart';
import '../../../../onboarding/ppi/utils/ppi_utils.dart';
import '../../../../tabs/for_you/bloc/for_you_bloc.dart';
import '../../../../tabs/for_you/for_you_screen_form.dart';
import '../bloc/investment_style_question_bloc.dart';

class ForYouInvestmentStyleScreen extends StatelessWidget {
  const ForYouInvestmentStyleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => InvestmentStyleQuestionBloc(),
        ),
        BlocProvider(
            create: (_) => UserResponseBloc(
                sharedPreference: SharedPreference(),
                ppiResponseRepository: PpiResponseRepository())),
        BlocProvider(
            create: (_) => QuestionBloc(
                ppiQuestionRepository: PpiQuestionRepository(),
                questionPageType: QuestionPageType.investmentStyle,
                sharedPreference: SharedPreference())
              ..add(const LoadQuestions())),
      ],
      child: Builder(
        builder: (context) => MultiBlocListener(
          listeners: [
            BlocListener<QuestionBloc, QuestionState>(
              listenWhen: (previous, current) =>
                  previous.response.state != current.response.state,
              listener: _questionListener,
            ),
            BlocListener<UserResponseBloc, UserResponseState>(
              listener: _userResponseListener,
            ),
            BlocListener<InvestmentStyleQuestionBloc,
                InvestmentStyleQuestionState>(
              listener: _investmentStyleQuestionListener,
            ),
          ],
          child: Column(
            children: [
              const PpiProgressIndicatorWidget(
                questionPageType: QuestionPageType.investmentStyle,
              ),
              Expanded(
                child: Padding(
                  padding: AppValues.screenHorizontalPadding,
                  child: BlocBuilder<InvestmentStyleQuestionBloc,
                      InvestmentStyleQuestionState>(
                    builder: (context, state) {
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
                                onSubmitSuccess: () =>
                                    onSubmitSuccess(context));
                          case (QuestionType.omniSearch):
                            return OmniSearchQuestionWidget(
                              key: Key(question.questionId!),
                              enableBackNavigation:
                                  !UserJourney.compareUserJourney(
                                      context: context,
                                      target: UserJourney.freeBotStock),
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
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _questionListener(BuildContext context, QuestionState state) {
    if (state.response.state == ResponseState.loading) {
      CustomLoadingOverlay.show(context);
    } else {
      if (state.response.state == ResponseState.success) {
        context.read<InvestmentStyleQuestionBloc>().add(NextQuestion());
      }
      CustomLoadingOverlay.dismiss();
    }
  }

  void _userResponseListener(BuildContext context, UserResponseState state) {
    if (state.responseState == ResponseState.loading) {
      CustomLoadingOverlay.show(context);
    } else {
      CustomLoadingOverlay.dismiss();
      if (state.ppiResponseState == PpiResponseState.dispatchResponse &&
          state.responseState == ResponseState.success) {
        context.read<ForYouBloc>().add(SaveInvestmentStyleAnswer());
        context
            .read<NavigationBloc<ForYouPage>>()
            .add(const PageChanged(ForYouPage.botRecommendation));
      }
    }
  }

  void _investmentStyleQuestionListener(
      BuildContext context, InvestmentStyleQuestionState state) {
    if (state is OnNextResultScreen) {
      context.read<UserResponseBloc>().add(SendBulkResponse());
    }
  }

  void onSubmitSuccess(BuildContext context) {
    context.read<InvestmentStyleQuestionBloc>().add(NextQuestion());
  }

  void onCancel(BuildContext context) {
    context
        .read<QuestionBloc>()
        .add(const CurrentInvestmentStylePageDecremented());
    context.read<InvestmentStyleQuestionBloc>().add(PreviousQuestion());
  }
}
