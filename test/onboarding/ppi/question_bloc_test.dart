import 'package:asklora_mobile_app/core/domain/base_response.dart';
import 'package:asklora_mobile_app/feature/ppi/bloc/question/question_bloc.dart';
import 'package:asklora_mobile_app/feature/ppi/domain/fixture.dart';
import 'package:asklora_mobile_app/feature/ppi/repository/ppi_question_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'question_bloc_test.mocks.dart';

@GenerateMocks([PpiQuestionRepository])
void main() async {
  group('Question Bloc Tests', () {
    late PpiQuestionRepository ppiQuestionRepository;
    late QuestionBloc questionBloc;

    setUpAll(() async {
      ppiQuestionRepository = MockPpiQuestionRepository();
    });

    setUp(() async {
      questionBloc = QuestionBloc(ppiQuestionRepository: ppiQuestionRepository);
    });

    test('Question Bloc init response should be BaseResponse', () {
      expect(questionBloc.state, const QuestionState(response: BaseResponse()));
    });

    blocTest<QuestionBloc, QuestionState>(
        'emits Fixture WHEN '
        'fetch question',
        build: () {
          when(ppiQuestionRepository.fetchQuestions())
              .thenAnswer((_) => Future.value(Fixture()));
          return questionBloc;
        },
        act: (bloc) => bloc.add(const LoadQuestions()),
        expect: () => {
              QuestionState(response: BaseResponse.loading()),
              QuestionState(response: BaseResponse.complete(Fixture())),
            });

    blocTest<QuestionBloc, QuestionState>(
        'emits privacyQuestionIndex 2 WHEN '
        'changed the privacy question index to 2',
        build: () => questionBloc,
        act: (bloc) => bloc.add(const PrivacyQuestionIndexChanged(2)),
        expect: () => {
              const QuestionState(privacyQuestionIndex: 2),
            });

    blocTest<QuestionBloc, QuestionState>(
        'emits investmentStyleQuestionIndex 3 WHEN '
        'changed the investment question index to 3',
        build: () => questionBloc,
        act: (bloc) => bloc.add(const InvestmentStyleQuestionIndexChanged(3)),
        expect: () => {
              const QuestionState(investmentStyleQuestionIndex: 3),
            });

    tearDown(() => {questionBloc.close()});
  });
}
