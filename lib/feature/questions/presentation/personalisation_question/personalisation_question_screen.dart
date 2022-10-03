import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../core/presentation/navigation/custom_navigation_widget.dart';
import '../../bloc/question/question_bloc.dart';
import '../../domain/question.dart';
import '../widget/personalisation_question_widget/personalisation_question_widget.dart';
import 'bloc/personalisation_question_bloc.dart';

class PersonalisationQuestionScreen extends StatelessWidget {
  final int initialIndex;

  const PersonalisationQuestionScreen({
    this.initialIndex = 0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomNavigationWidget(
      header: const SizedBox(),
      child: BlocProvider(
        create: (_) => PersonalisationQuestionBloc(initialIndex: initialIndex)
          ..add(NextPersonalisationQuestion()),
        child: BlocConsumer<PersonalisationQuestionBloc,
            PersonalisationQuestionState>(
          listener: (context, state) {
            if (state is OnNextPersonalizationQuestion) {
              context.read<QuestionBloc>().add(
                  PersonalisationQuestionIndexChanged(
                      state.personalizationQuestionIndex));
            } else if (state is OnNextToInvestmentStyleQuestionScreen) {
              context
                  .read<NavigationBloc<QuestionPageStep>>()
                  .add(const PageChanged(QuestionPageStep.investmentStyle));
            } else if (state is OnPerviousToPrivacyQuestionScreen) {
              context
                  .read<NavigationBloc<QuestionPageStep>>()
                  .add(const PagePop());
            }
          },
          builder: (context, state) {
            if (state is OnNextPersonalisationGetTwoQuestion) {
              List questionCollection = state.questions;
              return PersonalisationQuestionWidget(
                key: UniqueKey(),
                questionCollection:
                    questionCollection as List<QuestionCollection>,
                onSubmitSuccess: () => context
                    .read<PersonalisationQuestionBloc>()
                    .add(NextPersonalisationQuestion()),
                onCancel: () => context
                    .read<PersonalisationQuestionBloc>()
                    .add(PreviousPersonalisationQuestion()),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
