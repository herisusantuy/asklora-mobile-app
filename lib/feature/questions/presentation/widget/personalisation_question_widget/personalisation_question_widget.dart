import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/base_response.dart';
import '../../../../../core/presentation/custom_text.dart';
import '../../../bloc/response/user_response_bloc.dart';
import '../../../domain/question.dart';
import '../../../domain/user_response_request.dart';
import '../../personalisation_question/bloc/personalisation_question_bloc.dart';
import '../question_navigation_button_widget.dart';
import 'bloc/personalisation_question_widget_bloc.dart';

class PersonalisationQuestionWidget extends StatelessWidget {
  final QuestionCollection questionCollection;
  final int defaultChoiceIndex;

  const PersonalisationQuestionWidget({
    required this.questionCollection,
    this.defaultChoiceIndex = 0,
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
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                      'Personalisation Questions',
                      type: FontType.h3,
                      padding: EdgeInsets.only(bottom: 20),
                    ),
                    CustomText(
                      questionCollection.questions!.question!,
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
                        children: questionCollection.questions!.choices!.map(
                          (e) {
                            int index = questionCollection.questions!.choices!
                                .indexOf(e);
                            return Padding(
                              padding: const EdgeInsets.only(
                                  right: 5.0, left: 5, bottom: 12),
                              child: ChoiceChip(
                                labelPadding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 12),
                                label: CustomText(
                                  '${e.point!} - ${e.name!}',
                                  type: FontType.smallText,
                                  color: index == state.defaultChoiceIndex
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                selected: index == state.defaultChoiceIndex,
                                selectedColor: Colors.black,
                                pressElevation: 0,
                                onSelected: (value) => context
                                    .read<PersonalisationQuestionWidgetBloc>()
                                    .add(AnswerOfPersonalisationQuestionChanged(
                                        index)),
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                  ],
                ),
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
                  onNext: () => context.read<UserResponseBloc>().add(
                        SendResponse(UserResponseRequest(
                            email: 'xx@gmail.com',
                            questionId: questionCollection.uid!,
                            section: questionCollection.questions!.section!,
                            types: questionCollection.questions!.types!,
                            points: (state.defaultChoiceIndex + 1).toString())),
                      ),
                  onCancel: () => context
                      .read<PersonalisationQuestionBloc>()
                      .add(PreviousPersonalisationQuestion()),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
