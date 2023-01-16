import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import '../../../../../core/presentation/buttons/primary_button.dart';
import '../../../../../core/values/app_values.dart';
import '../../../../onboarding/ppi/domain/fixture.dart';
import '../../../../onboarding/ppi/presentation/widget/header.dart';
import '../bloc/demonstration_question_bloc.dart';
import '../widgets/multiple_choice_question_widget/multiple_choice_question_widget.dart';
import '../widgets/omni_search_question_widget.dart';

class DemonstrationQuestionScreen extends StatelessWidget {
  static const String route = '/demonstration_question_screen';
  final JustTheController tooltipController;

  const DemonstrationQuestionScreen({required this.tooltipController, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<DemonstrationQuestionBloc>().state.onTapBack(context);
        return false;
      },
      child: Padding(
        padding: AppValues.screenHorizontalPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            QuestionHeader(
              key: const Key('question_header'),
              onTapBack: () => context
                  .read<DemonstrationQuestionBloc>()
                  .state
                  .onTapBack(context),
            ),
            Expanded(
              child: LayoutBuilder(builder: (context, viewportConstraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        minHeight: viewportConstraints.maxHeight),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _getQuestionContent,
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: BlocBuilder<DemonstrationQuestionBloc,
                                  DemonstrationQuestionState>(
                              buildWhen: (previous, current) =>
                                  previous.questionAnsweredList !=
                                      current.questionAnsweredList ||
                                  previous.questionIndex !=
                                      current.questionIndex,
                              builder: (context, state) {
                                if (state.questionAnsweredList.isNotEmpty) {
                                  return PrimaryButton(
                                    key: key,
                                    disabled: !state.questionAnsweredList[
                                        state.questionIndex],
                                    label: 'NEXT',
                                    onTap: () => state.onTapNext(context),
                                  );
                                } else {
                                  return const SizedBox();
                                }
                              }),
                        )
                      ],
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _getQuestionContent => BlocBuilder<DemonstrationQuestionBloc,
          DemonstrationQuestionState>(
      buildWhen: (previous, current) =>
          previous.questionCollection != current.questionCollection ||
          previous.questionIndex != current.questionIndex,
      builder: (context, state) {
        if (state.questionCollection.isNotEmpty) {
          String? questionType =
              state.questionCollection[state.questionIndex].questions?.types;
          if (questionType == QuestionType.omniSearch.value) {
            return OmniSearchQuestionWidget(
                tooltipController: tooltipController,
                questionCollection:
                    state.questionCollection[state.questionIndex]);
          } else if (questionType == QuestionType.choices.value) {
            return MultipleChoiceQuestionWidget(
              tooltipController: tooltipController,
              key:
                  Key('multiple_choice_question_widget_${state.questionIndex}'),
              onAnswered: () => context
                  .read<DemonstrationQuestionBloc>()
                  .add(AnswerQuestion(state.questionIndex)),
              alreadyAnswered: state.questionAnsweredList[state.questionIndex],
              questionCollection: state.questionCollection[state.questionIndex],
            );
          } else {
            return const SizedBox.shrink();
          }
        } else {
          return const SizedBox.shrink();
        }
      });

  static void open(BuildContext context) => Navigator.pushNamed(
        context,
        route,
      );
}
