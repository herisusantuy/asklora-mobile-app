import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/custom_text_input.dart';
import '../../bloc/response/user_response_bloc.dart';
import '../../domain/question.dart';
import '../../domain/user_response_request.dart';
import '../privacy_question/bloc/privacy_question_bloc.dart';
import 'descriptive_question_widget/bloc/descriptive_question_widget_bloc.dart';
import 'header.dart';
import 'question_navigation_button_widget.dart';

class DescriptiveQuestionWidget extends StatelessWidget {
  final String headerTitle;
  final String defaultAnswer;
  final QuestionCollection questionCollection;
  final Function onSubmitSuccess;

  const DescriptiveQuestionWidget(
      {required this.headerTitle,
      this.defaultAnswer = '',
      required this.questionCollection,
      required this.onSubmitSuccess,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          DescriptiveQuestionWidgetBloc(defaultAnswer: defaultAnswer),
      child: Builder(
          builder: (context) => Column(
                children: [
                  Header(
                    header: '$headerTitle Questions',
                    questionNumber:
                        questionCollection.questions!.questionIndex!,
                    subHeader: questionCollection.questions!.question!,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Expanded(
                    child: CustomTextInput(
                      initialValue: defaultAnswer,
                      labelText: '',
                      hintText: questionCollection.questions?.hints ?? '',
                      onChanged: (value) => context
                          .read<DescriptiveQuestionWidgetBloc>()
                          .add(AnswerChanged(value)),
                    ),
                  ),
                  QuestionNavigationButtonWidget(
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
                    onCancel: () => context
                        .read<PrivacyQuestionBloc>()
                        .add(PreviousQuestion()),
                  )
                ],
              )),
    );
  }
}
