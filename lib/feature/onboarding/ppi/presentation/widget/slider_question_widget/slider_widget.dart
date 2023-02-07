import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/presentation/custom_text.dart';
import '../../../bloc/response/user_response_bloc.dart';
import '../../../domain/question.dart';
import '../../../domain/ppi_user_response_request.dart';
import '../header.dart';
import '../question_navigation_button_widget.dart';
import '../question_title.dart';
import 'bloc/slider_question_widget_bloc.dart';

class SliderQuestionWidget extends StatelessWidget {
  final Question question;
  final int defaultChoiceIndex;
  final Function onSubmitSuccess;
  final Function() onCancel;

  const SliderQuestionWidget(
      {required this.question,
      this.defaultChoiceIndex = 0,
      required this.onSubmitSuccess,
      required this.onCancel,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) =>
            SliderQuestionWidgetBloc(defaultChoiceIndex: defaultChoiceIndex),
        child: Column(
          children: [
            QuestionHeader(
              key: const Key('question_header'),
              onTapBack: onCancel,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    QuestionTitle(
                      question: question.question!,
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: ListView.builder(
                            key: const Key('multiple_choice_question_builder'),
                            itemCount: question.choices!.length,
                            reverse: true,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) =>
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: BlocBuilder<SliderQuestionWidgetBloc,
                                          SliderQuestionWidgetState>(
                                      buildWhen: (previous, current) =>
                                          previous.defaultChoiceIndex !=
                                          current.defaultChoiceIndex,
                                      builder: (context, state) => ChoiceChip(
                                            key: Key(
                                                '${question.questionId}-$index'),
                                            labelPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 5,
                                                    horizontal: 25.0),
                                            label: SizedBox(
                                              width: double.infinity,
                                              child: CustomText(
                                                question.choices![index].score!,
                                                color: index ==
                                                        state.defaultChoiceIndex
                                                    ? Colors.white
                                                    : Colors.black,
                                                type: index ==
                                                        state.defaultChoiceIndex
                                                    ? FontType.bodyTextBold
                                                    : FontType.bodyText,
                                                maxLines: 2,
                                              ),
                                            ),
                                            selected: index ==
                                                state.defaultChoiceIndex,
                                            selectedColor: Colors.black,
                                            shadowColor: Colors.transparent,
                                            backgroundColor: Colors.grey[200],
                                            onSelected: (value) => context
                                                .read<
                                                    SliderQuestionWidgetBloc>()
                                                .add(AnswerChanged(index)),
                                            // backgroundColor: color,
                                            elevation: 0,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 8),
                                          )),
                                )),
                      ),
                    ),
                    BlocBuilder<SliderQuestionWidgetBloc,
                            SliderQuestionWidgetState>(
                        buildWhen: (previous, current) =>
                            previous.defaultChoiceIndex !=
                            current.defaultChoiceIndex,
                        builder: (context, state) =>
                            QuestionNavigationButtonWidget(
                              disable: state.defaultChoiceIndex.isNegative,
                              key: const Key(
                                  'question_navigation_button_widget'),
                              onSubmitSuccess: onSubmitSuccess,
                              onNext: () => context
                                  .read<UserResponseBloc>()
                                  .add(SendResponse(PpiUserResponseRequest(
                                      questionId: question.questionId!,
                                      section: question.section!,
                                      types: question.questionType!,
                                      points: ''
                                      // points: question
                                      //     .choices![state.defaultChoiceIndex]
                                      //     .score!,
                                      ))),
                              onCancel: onCancel,
                            )),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
