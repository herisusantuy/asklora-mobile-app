import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/custom_text.dart';
import '../../../bloc/response/user_response_bloc.dart';
import '../../../domain/question.dart';
import '../../../domain/user_response_request.dart';
import '../../../utils/conversion.dart';
import '../header.dart';
import '../question_navigation_button_widget.dart';
import 'bloc/multiple_question_widget_bloc.dart';

class MultipleChoiceQuestionWidget extends StatelessWidget {
  final QuestionCollection questionCollection;
  final int defaultChoiceIndex;
  final String headerTitle;
  final Function onSubmitSuccess;
  final Function() onCancel;

  const MultipleChoiceQuestionWidget(
      {required this.headerTitle,
      required this.questionCollection,
      this.defaultChoiceIndex = 0,
      required this.onSubmitSuccess,
      required this.onCancel,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) =>
            MultipleQuestionWidgetBloc(defaultChoiceIndex: defaultChoiceIndex),
        child: Column(
          children: [
            Header(
              key: const Key('question_header'),
              header: '$headerTitle Questions',
              questionNumber: questionCollection.questions!.questionIndex!,
              subHeader: questionCollection.questions!.question!,
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: ListView.builder(
                  key: const Key('multiple_choice_question_builder'),
                  itemCount: questionCollection.questions!.choices!.length,
                  itemBuilder: (BuildContext context, int index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BlocBuilder<MultipleQuestionWidgetBloc,
                                MultipleQuestionWidgetState>(
                            buildWhen: (previous, current) =>
                                previous.defaultChoiceIndex !=
                                current.defaultChoiceIndex,
                            builder: (context, state) => ChoiceChip(
                                  key: Key('${questionCollection.uid}-$index'),
                                  labelPadding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 25.0),
                                  label: SizedBox(
                                    width: double.infinity,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          '${indexToStringAlphabet(index)}.',
                                          color:
                                              index == state.defaultChoiceIndex
                                                  ? Colors.white
                                                  : Colors.black,
                                          type:
                                              index == state.defaultChoiceIndex
                                                  ? FontType.bodyTextBold
                                                  : FontType.bodyText,
                                          padding:
                                              const EdgeInsets.only(right: 12),
                                        ),
                                        Expanded(
                                          child: CustomText(
                                            questionCollection.questions!
                                                .choices![index].name!,
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
                                      ],
                                    ),
                                  ),
                                  selected: index == state.defaultChoiceIndex,
                                  selectedColor: Colors.black,
                                  shadowColor: Colors.transparent,
                                  backgroundColor: Colors.grey[200],
                                  onSelected: (value) => context
                                      .read<MultipleQuestionWidgetBloc>()
                                      .add(AnswerChanged(index)),
                                  // backgroundColor: color,
                                  elevation: 0,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 8),
                                )),
                      )),
            ),
            BlocBuilder<MultipleQuestionWidgetBloc,
                    MultipleQuestionWidgetState>(
                buildWhen: (previous, current) =>
                    previous.defaultChoiceIndex != current.defaultChoiceIndex,
                builder: (context, state) => QuestionNavigationButtonWidget(
                      disable: state.defaultChoiceIndex.isNegative,
                      key: const Key('question_navigation_button_widget'),
                      onSubmitSuccess: onSubmitSuccess,
                      onNext: () => context
                          .read<UserResponseBloc>()
                          .add(SendResponse(UserResponseRequest(
                            questionId: questionCollection.uid!,
                            section: questionCollection.questions!.section!,
                            types: questionCollection.questions!.types!,
                            points: (context
                                        .read<MultipleQuestionWidgetBloc>()
                                        .state
                                        .defaultChoiceIndex +
                                    1)
                                .toString(),
                          ))),
                      onCancel: onCancel,
                    )),
          ],
        ));
  }
}
