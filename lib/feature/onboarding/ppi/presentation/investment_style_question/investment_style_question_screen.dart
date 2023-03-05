import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/bloc/app_bloc.dart';
import '../../../../../core/domain/base_response.dart';
import '../../../../../core/presentation/loading/custom_loading_overlay.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../../core/presentation/navigation/custom_navigation_widget.dart';
import '../../../../bot_stock/presentation/bot_recommendation/bot_recommendation_screen.dart';
import '../../../../bot_stock/presentation/gift/bot_stock_do_screen.dart';
import '../../../../tabs/for_you/bloc/for_you_bloc.dart';
import '../../../../tabs/for_you/for_you_screen_form.dart';
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
          child: MultiBlocListener(
            listeners: [
              BlocListener<UserResponseBloc, UserResponseState>(
                listener: _userResponseListener,
              ),
              BlocListener<InvestmentStyleQuestionBloc,
                  InvestmentStyleQuestionState>(
                listener: _investmentStyleQuestionListener,
              ),
            ],
            child: BlocBuilder<InvestmentStyleQuestionBloc,
                InvestmentStyleQuestionState>(
              buildWhen: (previous, current) {
                debugPrint(
                    'Krishna buildWhen previous ${previous} current ${current}');
                return current is OnNextQuestion;
              },
              builder: (context, state) {
                debugPrint('Krishna main build ${state}');
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
                        enableBackNavigation: !UserJourney.compareUserJourney(
                            context: context, target: UserJourney.freeBotStock),
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
      ),
    );
  }

  void _userResponseListener(BuildContext context, UserResponseState state) {
    if (state.responseState == ResponseState.loading) {
      CustomLoadingOverlay.show(context);
    } else {
      CustomLoadingOverlay.dismiss();
      if (state.ppiResponseState == PpiResponseState.dispatchResponse &&
          state.responseState == ResponseState.success) {
        if (context.read<AppBloc>().state.userJourney ==
            UserJourney.investmentStyle) {
          ///user comes from doing milestone 1.3 after sign up
          context.read<AppBloc>().add(const SaveUserJourney(UserJourney.kyc));
          context.read<NavigationBloc<QuestionPageStep>>().add(
              const PageChanged(QuestionPageStep.investmentStyleResultEnd));
        } else if (context.read<AppBloc>().state.userJourney ==
            UserJourney.freeBotStock) {
          ///user comes from retaking investment style question
          ///after getting zero gift bot recommendation
          BotRecommendationScreen.openAndRemoveUntil(
              context, BotStockDoScreen.route);
        } else if (UserJourney.compareUserJourney(
            context: context, target: UserJourney.freeBotStock)) {
          ///user comes from for you screen
          context.read<ForYouBloc>().add(SaveInvestmentStyleAnswer());
          context
              .read<NavigationBloc<ForYouPage>>()
              .add(const PageChanged(ForYouPage.botRecommendation));
        }
      } else if (state.ppiResponseState == PpiResponseState.dispatchResponse &&
          state.responseState == ResponseState.error) {
        onSubmitSuccess(context);
        debugPrint(
            'Krishna loading failed ${state.ppiResponseState} ${state.responseState}');
        // context.read<QuestionBloc>().add(
        //   InvestmentStyleQuestionIndexChanged(
        //       state.investmentStyleQuestionIndex),
        // );
      }
    }
  }

  void _investmentStyleQuestionListener(
      BuildContext context, InvestmentStyleQuestionState state) {
    if (state is OnNextQuestion) {
      context.read<QuestionBloc>().add(
            InvestmentStyleQuestionIndexChanged(
                state.investmentStyleQuestionIndex),
          );
    } else if (state is OnNextResultScreen) {
      context.read<UserResponseBloc>().add(SendBulkResponse());
    } else if (state is OnPreviousPage) {
      context.read<NavigationBloc<QuestionPageStep>>().add(const PagePop());
    }
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
