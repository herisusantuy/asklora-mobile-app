import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/presentation/custom_snack_bar.dart';
import '../../../../../../core/presentation/custom_text.dart';
import '../../../../../../core/presentation/custom_text_input.dart';
import '../../../bloc/response/user_response_bloc.dart';
import '../../../domain/question.dart';
import '../../../domain/ppi_user_response_request.dart';
import '../question_title.dart';
import 'bloc/omni_search_question_widget_bloc.dart';
import '../header.dart';
import '../question_navigation_button_widget.dart';

class OmniSearchQuestionWidget extends StatelessWidget {
  final String defaultAnswer;
  final QuestionCollection questionCollection;
  final Function onSubmitSuccess;
  final Function() onCancel;
  final TextInputType textInputType;
  final List<TextInputFormatter>? textInputFormatterList;
  final TextEditingController keywordController = TextEditingController();

  OmniSearchQuestionWidget(
      {this.defaultAnswer = '',
      required this.questionCollection,
      required this.onSubmitSuccess,
      required this.onCancel,
      this.textInputType = TextInputType.text,
      this.textInputFormatterList,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OmniSearchQuestionWidgetBloc(defaultAnswer: const []),
      child: BlocListener<OmniSearchQuestionWidgetBloc,
          OmniSearchQuestionWidgetState>(
        listener: (context, state) {
          if (state.addKeywordError) {
            CustomSnackBar(context)
                .setMessage('Keyword already added to the list')
                .showError();
            keywordController.text = '';
          }
        },
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
                      question: questionCollection.questions!.question!,
                    ),
                    _addKeywordInput(),
                    const SizedBox(
                      height: 32,
                    ),
                    Expanded(
                      child: BlocBuilder<OmniSearchQuestionWidgetBloc,
                              OmniSearchQuestionWidgetState>(
                          buildWhen: (previous, current) =>
                              previous.keywords != current.keywords ||
                              previous.keywordAnswers != current.keywordAnswers,
                          builder: (context, state) => Wrap(
                                key: const Key('omni_search_question_builder'),
                                spacing: 12,
                                children: state.keywords
                                    .asMap()
                                    .map((index, element) {
                                      bool selected = state.keywordAnswers
                                          .contains(state.keywords[index]);
                                      return MapEntry(
                                          index,
                                          ChoiceChip(
                                            key: Key(
                                                '${questionCollection.uid}-$index'),
                                            labelPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 2,
                                                    horizontal: 12.0),
                                            label: CustomText(
                                              state.keywords[index],
                                              color: selected
                                                  ? Colors.white
                                                  : Colors.black,
                                              type: selected
                                                  ? FontType.bodyTextBold
                                                  : FontType.bodyText,
                                            ),
                                            selected: selected,
                                            selectedColor: Colors.black,
                                            shadowColor: Colors.transparent,
                                            backgroundColor: Colors.grey[200],
                                            onSelected: (value) => context
                                                .read<
                                                    OmniSearchQuestionWidgetBloc>()
                                                .add(KeywordSelected(
                                                    state.keywords[index])),
                                            // backgroundColor: color,
                                            elevation: 0,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 0),
                                          ));
                                    })
                                    .values
                                    .toList(),
                              )),
                    ),
                    BlocBuilder<OmniSearchQuestionWidgetBloc,
                            OmniSearchQuestionWidgetState>(
                        buildWhen: (previous, current) =>
                            previous.keywordAnswers != current.keywordAnswers,
                        builder: (context, state) =>
                            QuestionNavigationButtonWidget(
                              disable: state.keywordAnswers.isEmpty,
                              key: const Key(
                                  'question_navigation_button_widget'),
                              onSubmitSuccess: onSubmitSuccess,
                              onNext: () => context
                                  .read<UserResponseBloc>()
                                  .add(SendResponse(PpiUserResponseRequest(
                                    questionId: questionCollection.uid!,
                                    section:
                                        questionCollection.questions!.section!,
                                    types: questionCollection.questions!.types!,
                                    points: context
                                        .read<OmniSearchQuestionWidgetBloc>()
                                        .state
                                        .keywordAnswers
                                        .toString(),
                                  ))),
                              onCancel: onCancel,
                            ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _addKeywordInput() {
    return BlocBuilder<OmniSearchQuestionWidgetBloc,
            OmniSearchQuestionWidgetState>(
        buildWhen: (previous, current) => previous.keywords != current.keywords,
        builder: (context, state) {
          keywordController.text = '';
          return CustomTextInput(
            controller: keywordController,
            contentPadding: const EdgeInsets.fromLTRB(17, 8, 17, 8),
            labelText: '',
            hintText: 'Add keywords',
            suffixIcon: GestureDetector(
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  context
                      .read<OmniSearchQuestionWidgetBloc>()
                      .add(KeywordAdded(keywordController.text));
                },
                child: const Icon(Icons.add)),
            floatingLabelBehavior: FloatingLabelBehavior.always,
          );
        });
  }
}
