import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/presentation/custom_text.dart';
import '../../../../../../core/styles/asklora_colors.dart';
import '../../../bloc/response/user_response_bloc.dart';
import '../../../domain/ppi_user_response_request.dart';
import '../../../domain/question.dart';
import '../header.dart';
import '../question_navigation_button_widget.dart';
import 'bloc/multiple_question_widget_bloc.dart';

class MultipleChoiceQuestionWidget extends StatelessWidget {
  final QuestionCollection questionCollection;
  final int defaultChoiceIndex;
  final Function onSubmitSuccess;
  final Function() onCancel;

  const MultipleChoiceQuestionWidget(
      {required this.questionCollection,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            QuestionHeader(
              key: const Key('question_header'),
              onTapBack: onCancel,
              questionText: questionCollection.questions!.question!,
            ),
            const SizedBox(
              height: 45,
            ),
            Expanded(
                child: BlocBuilder<MultipleQuestionWidgetBloc,
                        MultipleQuestionWidgetState>(
                    buildWhen: (previous, current) =>
                        previous.defaultChoiceIndex !=
                        current.defaultChoiceIndex,
                    builder: (context, state) {
                      return ListView.separated(
                          padding: const EdgeInsets.only(bottom: 20),
                          separatorBuilder: (BuildContext context, i) =>
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                              ),
                          itemCount:
                              questionCollection.questions!.choices!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                                decoration: (index == state.defaultChoiceIndex)
                                    ? _greenBorder()
                                    : _grayBorder(),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                      alignment: Alignment.centerLeft,
                                      foregroundColor:
                                          AskLoraColors.primaryGreen,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16, horizontal: 16)),
                                  child: CustomText(
                                    questionCollection
                                        .questions!.choices![index].name!,
                                    color: AskLoraColors.charcoal,
                                    maxLines: 3,
                                    textAlign: TextAlign.left,
                                    type: FontType.smallText,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  onPressed: () {
                                    context
                                        .read<MultipleQuestionWidgetBloc>()
                                        .add(AnswerChanged(index));
                                    debugPrint('Krishna index ${index}');
                                  },
                                ));
                          });
                    })),
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
                          .add(SendResponse(PpiUserResponseRequest(
                            questionId: questionCollection.uid!,
                            section: questionCollection.questions!.section!,
                            types: questionCollection.questions!.types!,
                            points: questionCollection.questions!
                                .choices![state.defaultChoiceIndex].point!,
                          ))),
                      onCancel: onCancel,
                    )),
          ],
        ));
  }

  BoxDecoration _greenBorder() {
    return BoxDecoration(
        color: AskLoraColors.lightGreen,
        border: Border.all(width: 3.0, color: AskLoraColors.primaryGreen),
        borderRadius: const BorderRadius.all(Radius.circular(10.0)));
  }

  BoxDecoration _grayBorder() {
    return BoxDecoration(
        border: Border.all(width: 1.0, color: AskLoraColors.gray),
        borderRadius: const BorderRadius.all(Radius.circular(10.0)));
  }
}
