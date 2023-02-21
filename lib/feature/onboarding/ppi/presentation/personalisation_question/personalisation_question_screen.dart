import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/base_response.dart';
import '../../../../../core/presentation/loading/custom_loading_overlay.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../../core/presentation/navigation/custom_navigation_widget.dart';
import '../../bloc/question/question_bloc.dart';
import '../../bloc/response/user_response_bloc.dart';
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
  Widget build(BuildContext _context) {
    return BlocProvider(
      create: (_) => PersonalisationQuestionBloc(
          initialIndex: initialIndex,
          userResponseBloc: _context.read<UserResponseBloc>())
        ..add(NextPersonalisationQuestion()),
      child: /*Builder(
          builder: (context) =>*/
          CustomNavigationWidget<QuestionPageStep>(
        onBackPressed: () => onCancel(_context),
        header: const SizedBox.shrink(),
        child: BlocConsumer<PersonalisationQuestionBloc,
            PersonalisationQuestionState>(
          buildWhen: (previous, current) =>
              current is OnNextPersonalizationQuestion,
          listener: (context, state) async {
            // debugPrint('Krishna personalisation_question_screen ${state}');
            if (state is OnNextPersonalizationQuestion) {
              context.read<QuestionBloc>().add(
                  PersonalisationQuestionIndexChanged(
                      state.personalizationQuestionIndex));
            } else if (state is OnPreviousToPrivacyQuestionScreen) {
              context
                  .read<NavigationBloc<QuestionPageStep>>()
                  .add(const PagePop());
            } else if (state is OnNextResultEndScreen) {
              // debugPrint(
              //     'Krishna personalisation_question_screen OnNextResultEndScreen');
              // CustomLoadingOverlay.show(context);
              // context.read<UserResponseBloc>().add(SendBulkResponse());
              context.read<NavigationBloc<QuestionPageStep>>().add(
                  const PageChanged(QuestionPageStep.personalisationResultEnd));

              /* context.read<UserResponseBloc>().stream.listen((event) {
                debugPrint(
                    'Krishna from personalisation_question_screen ppiResponseState ${event.ppiResponseState} responseState ${event.responseState}');
                if (event.ppiResponseState ==
                    PpiResponseState.dispatchResponse) {
                  if (event.responseState == ResponseState.loading) {
                    CustomLoadingOverlay.show(context);
                  } else {
                    // context
                    //     .read<NavigationBloc<QuestionPageStep>>()
                    //     .add(const PageChanged(
                    //         QuestionPageStep.personalisationResultEnd));
                  }
                }
              });
*/
              // CustomLoadingOverlay.show(_context);
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
                    onSubmitSuccess: () {
                      onSubmitSuccess(context);
                    },
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
      ),
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
