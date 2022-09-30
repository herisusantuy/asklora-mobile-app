import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/base_response.dart';
import '../../../../../core/presentation/custom_text.dart';
import '../../../bloc/response/user_response_bloc.dart';
import '../../../domain/question.dart';
import '../../personalisation_question/bloc/personalisation_question_bloc.dart';
import '../question_navigation_button_widget.dart';
import 'bloc/personalisation_question_widget_bloc.dart';

class PersonalisationQuestionWidget extends StatelessWidget {
  final List<QuestionCollection> questionCollection;
  final List<int> defaultChoiceIndex;
  final Function onSubmitSuccess;
  final Function() onCancel;

  const PersonalisationQuestionWidget({
    required this.questionCollection,
    required this.onSubmitSuccess,
    required this.onCancel,
    this.defaultChoiceIndex = const [-1, -1],
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PersonalisationQuestionWidgetBloc(
          defaultChoiceIndex: defaultChoiceIndex),
      child: BlocBuilder<PersonalisationQuestionWidgetBloc,
          PersonalisationQuestionWidgetState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                'Personalisation Question',
                type: FontType.h3,
                padding: EdgeInsets.only(bottom: 16),
              ),
              Expanded(
                child: ListView.builder(
                    key: const Key('personalisation_question_widget'),
                    physics: const ScrollPhysics(),
                    itemCount: questionCollection.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              questionCollection[index].questions!.question!,
                              type: FontType.h4SemiBold,
                              padding: const EdgeInsets.only(bottom: 15),
                            ),
                            const CustomText(
                              'Please rate from 1 - 5 for each statement below:',
                              type: FontType.smallText,
                              padding: EdgeInsets.only(bottom: 20),
                            ),
                            Center(
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                runAlignment: WrapAlignment.center,
                                children: questionCollection[index]
                                    .questions!
                                    .choices!
                                    .map(
                                  (e) {
                                    int indexOptions = questionCollection[index]
                                        .questions!
                                        .choices!
                                        .indexOf(e);

                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          right: 5.0, left: 5, bottom: 12),
                                      child: ChoiceChip(
                                        key:
                                            Key(questionCollection[index].uid!),
                                        labelPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 12),
                                        label: CustomText(
                                          '${e.point!} - ${e.name!}',
                                          type: FontType.smallText,
                                          color: indexOptions ==
                                                  state
                                                      .defaultChoiceIndex[index]
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                        selected: indexOptions ==
                                            state.defaultChoiceIndex[index],
                                        selectedColor: Colors.black,
                                        pressElevation: 0,
                                        onSelected: (value) => context
                                            .read<
                                                PersonalisationQuestionWidgetBloc>()
                                            .add(
                                                AnswerOfPersonalisationQuestionChanged(
                                                    setDefaultIndex(
                                                        state
                                                            .defaultChoiceIndex,
                                                        indexOptions,
                                                        index))),
                                      ),
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              BlocListener<UserResponseBloc, UserResponseState>(
                listenWhen: (previous, current) =>
                    previous.responseState != current.responseState,
                listener: (context, state) {
                  switch (state.responseState) {
                    case ResponseState.success:
                      context
                          .read<PersonalisationQuestionBloc>()
                          .add(NextPersonalisationQuestion());
                      break;
                    case ResponseState.error:
                      context
                          .read<PersonalisationQuestionBloc>()
                          .add(NextPersonalisationQuestion());
                      break;
                    default:
                  }
                },
                child: QuestionNavigationButtonWidget(
                  key: const Key(
                      'personalisation_question_navigation_button_widget'),
                  onSubmitSuccess: onSubmitSuccess,
                  onNext: () => context
                      .read<PersonalisationQuestionBloc>()
                      .add(NextPersonalisationQuestion()),
                  onCancel: onCancel,
                ),
              )
            ],
          );
        },
      ),
    );
  }

  List<int> setDefaultIndex(List<int> lists, int answer, int index) {
    List<int> value = List.from(lists);
    value[index] = answer;
    return value;
  }
}
