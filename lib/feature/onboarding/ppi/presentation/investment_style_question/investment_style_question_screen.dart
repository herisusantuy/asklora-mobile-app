import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/bloc/app_bloc.dart';
import '../../../../../core/domain/base_response.dart';
import '../../../../../core/presentation/custom_layout_with_blur_pop_up.dart';
import '../../../../../core/presentation/lora_popup_message/model/lora_pop_up_message_model.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../../core/presentation/navigation/custom_navigation_widget.dart';
import '../../../../../generated/l10n.dart';
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
      child: BlocBuilder<UserResponseBloc, UserResponseState>(
        buildWhen: (previous, current) =>
            previous.ppiResponseState != current.ppiResponseState ||
            previous.responseState != current.responseState,
        builder: (context, state) => CustomLayoutWithBlurPopUp(
          loraPopUpMessageModel: _getLoraPopUpMessageModel(
              context: context, errorType: state.errorType),
          showPopUp:
              state.ppiResponseState == PpiResponseState.dispatchResponse &&
                  state.responseState == ResponseState.error,
          content: CustomNavigationWidget<QuestionPageStep>(
            onBackPressed: () => onCancel(context),
            header: const SizedBox.shrink(),
            child: BlocConsumer<InvestmentStyleQuestionBloc,
                InvestmentStyleQuestionState>(
              listener: _investmentStyleQuestionListener,
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
                          onSubmitSuccess: () => onSubmitSuccess(context));
                    case (QuestionType.omniSearch):
                      return OmniSearchQuestionWidget(
                        key: UniqueKey(),
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

  void _investmentStyleQuestionListener(
      BuildContext context, InvestmentStyleQuestionState state) {
    if (state is OnNextQuestion) {
      context.read<QuestionBloc>().add(InvestmentStyleQuestionIndexChanged(
          state.investmentStyleQuestionIndex));
    } else if (state is OnNextResultScreen) {
      context
          .read<NavigationBloc<QuestionPageStep>>()
          .add(const PageChanged(QuestionPageStep.investmentStyleResultEnd));
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

  LoraPopUpMessageModel _getLoraPopUpMessageModel(
      {required BuildContext context, required ErrorType errorType}) {
    switch (errorType) {
      case ErrorType.error400:
        return LoraPopUpMessageModel(
          title: 'No Botstock recommendations',
          subTitle:
              'Oops! Looks like there aren’t enough recommendations that meet your current investment profile - Let’s go through your Investment Style again to find suitable recommendations.',
          primaryButtonLabel: S.of(context).retakeInvestmentStyle,
          secondaryButtonLabel: S.of(context).buttonCancel,
          onSecondaryButtonTap: () => Navigator.pop(context),
          onPrimaryButtonTap: () {
            context.read<QuestionBloc>().add(const ResetInvestmentStylePage());
            context
                .read<UserResponseBloc>()
                .add(const ResetState(wholeState: false));
            context.read<NavigationBloc<QuestionPageStep>>().add(
                const PageChangedRemoveAllRoute(
                    QuestionPageStep.investmentStyle));
          },
        );
      default:
        return LoraPopUpMessageModel(
          title: S.of(context).errorStoringData,
          subTitle: S.of(context).errorStoringDataDetails,
          primaryButtonLabel: S.of(context).retakeInvestmentStyle,
          secondaryButtonLabel: S.of(context).buttonCancel,
          onSecondaryButtonTap: () => context
              .read<UserResponseBloc>()
              .add(const ResetState(wholeState: false)),
          onPrimaryButtonTap: () {
            context.read<QuestionBloc>().add(const ResetInvestmentStylePage());
            context
                .read<UserResponseBloc>()
                .add(const ResetState(wholeState: false));
          },
        );
    }
  }
}
