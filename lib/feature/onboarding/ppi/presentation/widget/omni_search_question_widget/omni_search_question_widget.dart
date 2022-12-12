import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/presentation/we_create/custom_text_button.dart';
import 'widgets/custom_choice_chips.dart';
import '../../../../../../core/presentation/custom_snack_bar.dart';
import '../../../../../../core/presentation/custom_text_new.dart';
import '../../../../../../core/presentation/text_fields/auto_resized_text_field.dart';
import '../../../../../../core/styles/asklora_colors.dart';
import '../../../../../../core/styles/asklora_text_styles.dart';
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
        child: Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              QuestionHeader(
                key: const Key('question_header'),
                onTapBack: onCancel,
              ),
              Expanded(
                child: ListView(
                  children: [
                    QuestionTitle(
                      question: questionCollection.questions!.question!,
                      paddingBottom: 24,
                    ),
                    _emojiWidget,
                    const SizedBox(
                      height: 52,
                    ),
                    _addKeywordInput,
                    const SizedBox(
                      height: 52,
                    ),
                    BlocBuilder<OmniSearchQuestionWidgetBloc,
                            OmniSearchQuestionWidgetState>(
                        buildWhen: (previous, current) =>
                            previous.keywords != current.keywords ||
                            previous.keywordAnswers != current.keywordAnswers,
                        builder: (context, state) {
                          return Wrap(
                              key: const Key('omni_search_question_builder'),
                              spacing: 12,
                              runSpacing: 12,
                              children: state.keywords
                                  .map((e) => CustomChoiceChips(
                                      active: state.keywordAnswers.contains(e),
                                      enableClosedButton:
                                          !defaultKeywords.contains(e),
                                      label: e,
                                      onClosed: () => context
                                          .read<OmniSearchQuestionWidgetBloc>()
                                          .add(KeywordRemoved(e)),
                                      onTap: () => context
                                          .read<OmniSearchQuestionWidgetBloc>()
                                          .add(KeywordSelected(e))))
                                  .toList());
                        }),
                  ],
                ),
              ),
              BlocBuilder<OmniSearchQuestionWidgetBloc,
                      OmniSearchQuestionWidgetState>(
                  buildWhen: (previous, current) =>
                      previous.keywordAnswers != current.keywordAnswers,
                  builder: (context, state) => QuestionNavigationButtonWidget(
                        disable: state.keywordAnswers.isEmpty,
                        key: const Key('question_navigation_button_widget'),
                        onSubmitSuccess: onSubmitSuccess,
                        padding: EdgeInsets.zero,
                        onNext: () => context
                            .read<UserResponseBloc>()
                            .add(SendResponse(PpiUserResponseRequest(
                              questionId: questionCollection.uid!,
                              section: questionCollection.questions!.section!,
                              types: questionCollection.questions!.types!,
                              points: context
                                  .read<OmniSearchQuestionWidgetBloc>()
                                  .state
                                  .keywordAnswers
                                  .toString(),
                            ))),
                        onCancel: onCancel,
                      )),
              Builder(builder: (context) {
                return CustomTextButton(
                    margin: const EdgeInsets.only(top: 24),
                    label: 'RESET',
                    onTap: () => context
                        .read<OmniSearchQuestionWidgetBloc>()
                        .add(KeywordReset()));
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _addKeywordInput =>
      BlocBuilder<OmniSearchQuestionWidgetBloc, OmniSearchQuestionWidgetState>(
          buildWhen: (previous, current) =>
              previous.keywords != current.keywords,
          builder: (context, state) {
            keywordController.text = '';
            return AutoResizedTextField(
              key: const Key('name_input'),
              controller: keywordController,
              hintText: 'ENTER KEYWORDS',
              textInputType: TextInputType.text,
              onChanged: (value) => context
                  .read<OmniSearchQuestionWidgetBloc>()
                  .add(KeywordChanged(value)),
              suffixIcon: BlocBuilder<OmniSearchQuestionWidgetBloc,
                      OmniSearchQuestionWidgetState>(
                  buildWhen: (previous, current) =>
                      previous.keyword != current.keyword,
                  builder: (context, state) => ElevatedButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        if (state.keyword.isNotEmpty) {
                          context
                              .read<OmniSearchQuestionWidgetBloc>()
                              .add(KeywordAdded(keywordController.text));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: state.keyword.isEmpty
                            ? AskLoraColors.gray
                            : AskLoraColors.charcoal,
                        foregroundColor: state.keyword.isEmpty
                            ? AskLoraColors.darkGray
                            : AskLoraColors.primaryGreen,
                        shape: const CircleBorder(),
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 32,
                      ))),
            );
          });

  Widget get _emojiWidget => Container(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 12),
        decoration: BoxDecoration(
            color: AskLoraColors.lightGreen,
            borderRadius: BorderRadius.circular(18)),
        child: Row(
          children: [
            CustomTextNew(
              '-MEmoji Image-',
              style: AskLoraTextStyles.body4,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: CustomTextNew(
                'Go search for stocks with keywords or phrases, Lora will get you the relevant stocks!',
                style: AskLoraTextStyles.body1,
              ),
            )
          ],
        ),
      );
}
