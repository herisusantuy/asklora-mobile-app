import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/presentation/buttons/button_pair.dart';
import '../../../../../../core/presentation/custom_snack_bar.dart';
import '../../../../../../core/presentation/lora_rounded_corner_banner.dart';
import '../../../../../../core/presentation/text_fields/auto_resized_text_field.dart';
import '../../../../../../core/styles/asklora_colors.dart';
import '../../../domain/question.dart';
import '../header.dart';
import '../question_title.dart';
import 'bloc/omni_search_question_widget_bloc.dart';
import 'widgets/custom_choice_chips.dart';

class OmniSearchQuestionWidget extends StatelessWidget {
  final String defaultAnswer;
  final Question question;
  final Function() onSubmitSuccess;
  final Function() onCancel;
  final TextInputType textInputType;
  final List<TextInputFormatter>? textInputFormatterList;
  final TextEditingController keywordController = TextEditingController();

  OmniSearchQuestionWidget(
      {this.defaultAnswer = '',
      required this.question,
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
        listenWhen: (previous, current) =>
            previous.addKeywordError != current.addKeywordError,
        listener: (context, state) {
          if (state.addKeywordError) {
            CustomSnackBar(context)
                .setMessage('Keyword already added to the list')
                .showError();
            keywordController.text = '';
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            QuestionHeader(
              key: const Key('question_header'),
              onTapBack: onCancel,
            ),
            Expanded(
              child: LayoutBuilder(builder: (context, viewportConstraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        minHeight: viewportConstraints.maxHeight),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            QuestionTitle(
                              question: question.question!,
                              paddingBottom: 24,
                            ),
                            const LoraRoundedCornerBanner(
                              text:
                                  'Go search for stocks with keywords or phrases, Lora will get you the relevant stocks!',
                            ),
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
                                    previous.keywordAnswers !=
                                        current.keywordAnswers,
                                builder: (context, state) {
                                  return SizedBox(
                                    width: double.infinity,
                                    child: Wrap(
                                        key: const Key(
                                            'omni_search_question_builder'),
                                        spacing: 12,
                                        runSpacing: 12,
                                        children: state.keywords
                                            .map((e) => CustomChoiceChips(
                                                active: state.keywordAnswers
                                                    .contains(e),
                                                enableClosedButton:
                                                    !defaultKeywords
                                                        .contains(e),
                                                label: e,
                                                onClosed: () => context
                                                    .read<
                                                        OmniSearchQuestionWidgetBloc>()
                                                    .add(KeywordRemoved(e)),
                                                onTap: () => context
                                                    .read<
                                                        OmniSearchQuestionWidgetBloc>()
                                                    .add(KeywordSelected(e))))
                                            .toList()),
                                  );
                                }),
                          ],
                        ),
                        BlocBuilder<OmniSearchQuestionWidgetBloc,
                                OmniSearchQuestionWidgetState>(
                            buildWhen: (previous, current) =>
                                previous.keywordAnswers !=
                                current.keywordAnswers,
                            builder: (context, state) => Padding(
                                  padding: const EdgeInsets.only(top: 24.0),
                                  child: ButtonPair(
                                      primaryButtonOnClick: onSubmitSuccess,
                                      secondaryButtonOnClick: () => context
                                          .read<OmniSearchQuestionWidgetBloc>()
                                          .add(KeywordReset()),
                                      disablePrimaryButton:
                                          state.keywordAnswers.isEmpty,
                                      primaryButtonLabel: 'NEXT',
                                      secondaryButtonLabel: 'RESET'),
                                ))
                      ],
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _addKeywordInput =>
      BlocBuilder<OmniSearchQuestionWidgetBloc, OmniSearchQuestionWidgetState>(
        buildWhen: (previous, current) => previous.keywords != current.keywords,
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
        },
      );
}
