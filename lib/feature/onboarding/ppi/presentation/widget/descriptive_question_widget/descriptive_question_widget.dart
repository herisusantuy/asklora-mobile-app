import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/presentation/we_create/custom_centered_text_input.dart';
import '../../../bloc/response/user_response_bloc.dart';
import '../../../domain/question.dart';
import '../../../domain/ppi_user_response_request.dart';
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionHeader(
            key: const Key('question_header'),
            onTapBack: onCancel,
            questionText: questionCollection.questions!.question!,
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: Builder(
                builder: (context) => CustomCenteredTextInput(
                      initialValue: defaultAnswer,
                      hintText: questionCollection.questions?.hints ?? '',
                      key: const Key('descriptive_question_input'),
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
                        .add(SendResponse(PpiUserResponseRequest(
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
