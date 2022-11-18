import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/presentation/custom_text.dart';
import '../../../bloc/response/user_response_bloc.dart';
import '../../../domain/question.dart';
import '../../../domain/ppi_user_response_request.dart';
import '../header.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                          QuestionHeader(
                            key: const Key('question_header'),
                            onTapBack: onCancel,
                            questionText:
                                questionCollection[index].questions!.question!,
                          ),
                          const CustomText(
                            'Please rate from 1 - 5 for each statement below:',
                            type: FontType.smallText,
                            padding: EdgeInsets.only(bottom: 20),
                          ),
                          Center(
                            child: Wrap(
                                spacing: 12,
                                runSpacing: 10,
                                alignment: WrapAlignment.center,
                                runAlignment: WrapAlignment.center,
                                children: questionCollection[index]
                                    .questions!
                                    .choices!
                                    .asMap()
                                    .map((indexOptions, choice) => MapEntry(
                                        indexOptions,
                                        BlocBuilder<
                                                PersonalisationQuestionWidgetBloc,
                                                PersonalisationQuestionWidgetState>(
                                            buildWhen: (previous, current) =>
                                                previous.defaultChoiceIndex !=
                                                current.defaultChoiceIndex,
                                            builder: (context, state) =>
                                                ChoiceChip(
                                                  key: Key(
                                                      '${questionCollection[index].uid}-$indexOptions'),
                                                  labelPadding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 5,
                                                      horizontal: 12),
                                                  label: CustomText(
                                                    '${choice.point!} - ${choice.name!}',
                                                    type: FontType.smallText,
                                                    color: indexOptions ==
                                                            state.defaultChoiceIndex[
                                                                index]
                                                        ? Colors.white
                                                        : Colors.black,
                                                  ),
                                                  selected: indexOptions ==
                                                      state.defaultChoiceIndex[
                                                          index],
                                                  selectedColor: Colors.black,
                                                  pressElevation: 0,
                                                  onSelected: (value) => context
                                                      .read<
                                                          PersonalisationQuestionWidgetBloc>()
                                                      .add(AnswerOfPersonalisationQuestionChanged(
                                                          _setDefaultIndex(
                                                              state
                                                                  .defaultChoiceIndex,
                                                              indexOptions,
                                                              index))),
                                                ))))
                                    .values
                                    .toList()),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            BlocBuilder<PersonalisationQuestionWidgetBloc,
                    PersonalisationQuestionWidgetState>(
                buildWhen: (previous, current) =>
                    previous.defaultChoiceIndex != current.defaultChoiceIndex,
                builder: (context, state) => QuestionNavigationButtonWidget(
                      key: const Key(
                          'personalisation_question_navigation_button_widget'),
                      onSubmitSuccess: onSubmitSuccess,
                      disable: state.defaultChoiceIndex.contains(-1),
                      onNext: () => context.read<UserResponseBloc>().add(
                          SendBulkResponse(_getppiUserResponseRequest(
                              state.defaultChoiceIndex))),
                      onCancel: onCancel,
                    ))
          ],
        ));
  }

  List<int> _setDefaultIndex(List<int> lists, int answer, int index) =>
      List.from(lists)..[index] = answer;

  List<PpiUserResponseRequest> _getppiUserResponseRequest(
      List<int> defaultChoiceIndex) {
    List<PpiUserResponseRequest> ppiUserResponseRequests = [];
    int index = 0;
    for (var element in questionCollection) {
      ppiUserResponseRequests.add(PpiUserResponseRequest(
        questionId: element.uid!,
        section: element.questions!.section!,
        types: element.questions!.types!,
        points: element.questions!.choices![defaultChoiceIndex[index++]].point!,
      ));
    }
    return ppiUserResponseRequests;
  }
}
