import 'package:asklora_mobile_app/feature/questions/presentation/widget/personalisation_question_widget/bloc/personalisation_question_widget_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Personalisation Question Widget', () {
    late PersonalisationQuestionWidgetBloc personalisationQuestionWidgetBloc;

    setUp(() async {
      personalisationQuestionWidgetBloc = PersonalisationQuestionWidgetBloc();
    });

    test(
        'Personalisation Question Widget Bloc init defaultChoiceIndex should be [-1, -1]',
        () {
      expect(
          personalisationQuestionWidgetBloc.state,
          const PersonalisationQuestionWidgetState(
              defaultChoiceIndex: [-1, -1]));
    });

    blocTest<PersonalisationQuestionWidgetBloc,
        PersonalisationQuestionWidgetState>(
      'emits defaultChoiceIndex [1, 2] WHEN "Tap second answer"',
      build: () => personalisationQuestionWidgetBloc,
      act: (bloc) =>
          bloc.add(AnswerOfPersonalisationQuestionChanged(const [1, 2])),
      expect: () => {
        const PersonalisationQuestionWidgetState(defaultChoiceIndex: [1, 2])
      },
    );
    tearDown(() => {personalisationQuestionWidgetBloc.close()});
  });
}
