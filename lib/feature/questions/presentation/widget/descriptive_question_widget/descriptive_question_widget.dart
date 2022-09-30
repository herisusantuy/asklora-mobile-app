import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/custom_text.dart';
import '../../../../../core/presentation/custom_text_input.dart';
import '../../../bloc/response/user_response_bloc.dart';
import '../../../domain/question.dart';
import '../../../domain/user_response_request.dart';
import 'bloc/descriptive_question_widget_bloc.dart';
import '../header.dart';
import '../question_navigation_button_widget.dart';

class DescriptiveQuestionWidget extends StatelessWidget {
  final String headerTitle;
  final String defaultAnswer;
  final QuestionCollection questionCollection;
  final Function onSubmitSuccess;
  final Function() onCancel;

  const DescriptiveQuestionWidget(
      {required this.headerTitle,
      this.defaultAnswer = '',
      required this.questionCollection,
      required this.onSubmitSuccess,
      required this.onCancel,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          DescriptiveQuestionWidgetBloc(defaultAnswer: defaultAnswer),
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
          if (questionCollection.questions!.hints != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: CustomText(
                questionCollection.questions!.hints!,
                type: FontType.bodyTextBold,
              ),
            ),
          Expanded(
            child: Builder(
                builder: (context) => CustomTextInput(
                      key: const Key('descriptive_question_input'),
                      initialValue: defaultAnswer,
                      labelText: '',
                      hintText: questionCollection.questions?.hints ?? '',
                      onChanged: (value) => context
                          .read<DescriptiveQuestionWidgetBloc>()
                          .add(AnswerChanged(value)),
                    )),
          ),
          BlocBuilder<DescriptiveQuestionWidgetBloc,
                  DescriptiveQuestionWidgetState>(
              builder: (context, state) => QuestionNavigationButtonWidget(
                    disable: state.answer.isEmpty,
                    key: const Key('question_navigation_button_widget'),
                    onSubmitSuccess: onSubmitSuccess,
                    onNext: () => context
                        .read<UserResponseBloc>()
                        .add(SendResponse(UserResponseRequest(
                          email: 'xx@gmail.com',
                          questionId: questionCollection.uid!,
                          section: questionCollection.questions!.section!,
                          types: questionCollection.questions!.types!,
                          points: context
                              .read<DescriptiveQuestionWidgetBloc>()
                              .state
                              .answer,
                        ))),
                    onCancel: onCancel,
                  ))
        ],
      ),
    );
  }
}
