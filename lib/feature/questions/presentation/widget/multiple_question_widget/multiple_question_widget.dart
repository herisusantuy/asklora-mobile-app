import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/base_response.dart';
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

  const MultipleChoiceQuestionWidget(
      {required this.questionCollection, this.defaultChoiceIndex = 0, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('rebuild multi');
    return BlocProvider(
        create: (_) =>
            MultipleQuestionWidgetBloc(defaultChoiceIndex: defaultChoiceIndex),
        child: Column(
          children: [
            Header(
              header: 'Privacy Questions',
              questionNumber: questionCollection.questions!.questionIndex!,
              subHeader: questionCollection.questions!.question!,
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: BlocBuilder<MultipleQuestionWidgetBloc,
                  MultipleQuestionWidgetState>(
                builder: (context, state) => Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount:
                              questionCollection.questions!.choices!.length,
                          itemBuilder: (BuildContext context, int index) =>
                              Padding(
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
                    BlocListener<UserResponseBloc, UserResponseState>(
                      listenWhen: (previous, current) =>
                          previous.responseState != current.responseState,
                      listener: (context, state) {
                        if (state.responseState == ResponseState.success) {
                          context
                              .read<PrivacyQuestionBloc>()
                              .add(NextQuestion());
                        } else if (state.responseState == ResponseState.error) {
                          //TODO change error handling whenever endpoint is available
                          context
                              .read<PrivacyQuestionBloc>()
                              .add(NextQuestion());
                        }
                      },
                      child: QuestionNavigationButtonWidget(
                        onNext: () => context
                            .read<UserResponseBloc>()
                            .add(SendResponse(UserResponseRequest(
                              email: 'xx@gmail.com',
                              questionId: questionCollection.uid!,
                              section: questionCollection.questions!.section!,
                              types: questionCollection.questions!.types!,
                              points: (state.defaultChoiceIndex + 1).toString(),
                            ))),
                        onCancel: () => context
                            .read<PrivacyQuestionBloc>()
                            .add(PreviousQuestion()),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
