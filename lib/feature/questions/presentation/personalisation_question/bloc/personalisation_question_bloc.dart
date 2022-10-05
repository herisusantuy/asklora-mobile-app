import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/fixture.dart';
import '../../../domain/question.dart';

part 'personalisation_question_event.dart';
part 'personalisation_question_state.dart';

class PersonalisationQuestionBloc
    extends Bloc<PersonalisationQuestionEvent, PersonalisationQuestionState> {
  PersonalisationQuestionBloc({int initialIndex = 0})
      : _personalizationIndex = initialIndex - 1,
        super(const PersonalisationQuestionState()) {
    on<NextPersonalisationQuestion>(_onNavigationStepChanged);
    on<PreviousPersonalisationQuestion>(_onNavigationPop);
  }
  int _personalizationIndex;
  List<QuestionCollection> personalizationQuestions =
      Fixture().personalisedQuestion;

  void _onNavigationStepChanged(NextPersonalisationQuestion event,
      Emitter<PersonalisationQuestionState> emit) {
    ++_personalizationIndex;
    if (_personalizationIndex < personalizationQuestions.length) {
      QuestionCollection question =
          personalizationQuestions[_personalizationIndex];
      if (question.questions!.types == QuestionType.slider.value) {
        int personalisationQuestionLastIndex = _personalizationIndex;
        List<QuestionCollection> questionCollection = [question];
        QuestionCollection questionTwo =
            personalizationQuestions[_personalizationIndex + 1];
        if (questionTwo.questions!.types == QuestionType.slider.value) {
          ++_personalizationIndex;
          questionCollection.add(questionTwo);
          ++personalisationQuestionLastIndex;
          emit(OnNextPersonalisationGetTwoQuestion<QuestionCollection>(
              QuestionType.slider, questionCollection,
              personalisationQuestionLastIndex:
                  personalisationQuestionLastIndex));
        }
      }
    } else {
      emit(OnNextToInvestmentStyleQuestionScreen());
    }
  }

  void _onNavigationPop(PreviousPersonalisationQuestion event,
      Emitter<PersonalisationQuestionState> emit) {
    --_personalizationIndex;

    if (_personalizationIndex > 0) {
      QuestionCollection question =
          personalizationQuestions[--_personalizationIndex];
      if (question.questions!.types == QuestionType.slider.value) {
        int personalisationQuestionLastIndex = _personalizationIndex;
        List<QuestionCollection> questionCollection = [question];
        QuestionCollection questionTwo =
            personalizationQuestions[_personalizationIndex + 1];
        if (questionTwo.questions!.types == QuestionType.slider.value) {
          --_personalizationIndex;
          questionCollection.add(questionTwo);
          --personalisationQuestionLastIndex;
          emit(OnNextPersonalisationGetTwoQuestion<QuestionCollection>(
              QuestionType.slider, questionCollection,
              personalisationQuestionLastIndex:
                  personalisationQuestionLastIndex));
        }
      }
    } else if (_personalizationIndex <= 0) {
      emit(OnPerviousToPrivacyQuestionScreen());
    }
  }
}
