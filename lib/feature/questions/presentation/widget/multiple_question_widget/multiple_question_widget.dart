import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/custom_text.dart';
import '../../../bloc/response/user_response_bloc.dart';
import '../../../domain/question.dart';
import '../../../domain/user_response_request.dart';
import '../../privacy_question/bloc/privacy_question_bloc.dart';
import '../header.dart';
import '../question_navigation_button_widget.dart';
import 'bloc/multiple_question_widget_bloc.dart';

class MultipleChoiceQuestionWidget extends StatelessWidget {
  final QuestionCollection questionCollection;
  final int defaultChoiceIndex;
  final String headerTitle;
  final Function onSubmitSuccess;

  const MultipleChoiceQuestionWidget(
      {required this.headerTitle,
      required this.questionCollection,
      this.defaultChoiceIndex = 0,
      required this.onSubmitSuccess,
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
              header: '$headerTitle Questions',
              questionNumber: questionCollection.questions!.questionIndex!,
              subHeader: questionCollection.questions!.question!,
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: BlocBuilder<MultipleQuestionWidgetBloc,
                  MultipleQuestionWidgetState>(
                builder: (context, state) => ListView.builder(
                    itemCount: questionCollection.questions!.choices!.length,
                    itemBuilder: (BuildContext context, int index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ChoiceChip(
                            labelPadding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 25.0),
                            label: SizedBox(
                              width: double.infinity,
                              child: CustomText(
                                '${questionCollection.questions!.choices![index].point!}. ${questionCollection.questions!.choices![index].name!}',
                                color: index == state.defaultChoiceIndex
                                    ? Colors.white
                                    : Colors.black,
                                type: index == state.defaultChoiceIndex
                                    ? FontType.bodyTextBold
                                    : FontType.bodyText,
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
                          ),
                        )),
              ),
            ),
            Builder(
                builder: (context) => QuestionNavigationButtonWidget(
                      onSubmitSuccess: onSubmitSuccess,
                      onNext: () => context
                          .read<UserResponseBloc>()
                          .add(SendResponse(UserResponseRequest(
                            email: 'xx@gmail.com',
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
                      onCancel: () => context
                          .read<PrivacyQuestionBloc>()
                          .add(PreviousQuestion()),
                    )),
          ],
        ));
  }
}
