import 'package:asklora_mobile_app/feature/onboarding/ppi/presentation/widget/omni_search_question_widget/bloc/omni_search_question_widget_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  group('Omni Search Question Widget Bloc Tests', () {
    const List<String> keywords = [
      'Covid',
      'Inflation',
      'AAPL',
      'Oil',
      'Elon Musk',
      'Burger',
      'Recycle',
    ];
    late OmniSearchQuestionWidgetBloc omniSearchQuestionWidgetBloc;

    setUp(() async {
      omniSearchQuestionWidgetBloc = OmniSearchQuestionWidgetBloc();
    });

    test('Omni Search Question Widget Bloc init keywordAnswer should be empty',
        () {
      expect(omniSearchQuestionWidgetBloc.state,
          const OmniSearchQuestionWidgetState(keywordAnswers: []));
    });

    blocTest<OmniSearchQuestionWidgetBloc, OmniSearchQuestionWidgetState>(
        'emits keywords with default keywords + `Something` WHEN '
        'add `Something` to the keywords',
        build: () => omniSearchQuestionWidgetBloc,
        act: (bloc) {
          bloc.add(KeywordAdded('Something'));
        },
        expect: () => {
              const OmniSearchQuestionWidgetState(addKeywordError: false),
              const OmniSearchQuestionWidgetState(
                  keywords: [...keywords, 'Something']),
            });

    blocTest<OmniSearchQuestionWidgetBloc, OmniSearchQuestionWidgetState>(
        'emits keywordAnswer `Covid` WHEN '
        'select answer `Covid`',
        build: () => omniSearchQuestionWidgetBloc,
        act: (bloc) {
          bloc.add(KeywordSelected('Covid'));
          bloc.add(KeywordSelected('AAPL'));
        },
        expect: () => {
              const OmniSearchQuestionWidgetState(keywordAnswers: ['Covid']),
              const OmniSearchQuestionWidgetState(
                  keywordAnswers: ['Covid', 'AAPL'])
            });

    blocTest<OmniSearchQuestionWidgetBloc, OmniSearchQuestionWidgetState>(
        'emits keywordAnswer empty WHEN '
        'select tap `Covid` and tap `Covid` again ',
        build: () => omniSearchQuestionWidgetBloc,
        act: (bloc) {
          bloc.add(KeywordSelected('Covid'));
          bloc.add(KeywordSelected('Covid'));
        },
        expect: () => {
              const OmniSearchQuestionWidgetState(keywordAnswers: ['Covid']),
              const OmniSearchQuestionWidgetState(keywordAnswers: [])
            });

    tearDown(() => {omniSearchQuestionWidgetBloc.close()});
  });
}
