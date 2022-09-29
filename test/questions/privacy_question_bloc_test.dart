import 'package:asklora_mobile_app/feature/questions/presentation/privacy_question/bloc/privacy_question_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  group('Privacy Question Bloc Tests', () {
    late PrivacyQuestionBloc privacyQuestionBloc;

    setUp(() async {
      privacyQuestionBloc = PrivacyQuestionBloc();
    });

    test('Privacy Question Bloc init state is should be PrivacyQuestionState',
        () {
      expect(privacyQuestionBloc.state, const PrivacyQuestionState());
    });

    blocTest<PrivacyQuestionBloc, PrivacyQuestionState>(
        'emits OnNextPersonalisationQuestionScreen WHEN '
        'Tap next button',
        build: () => privacyQuestionBloc,
        act: (bloc) => bloc.add(NextQuestion()),
        expect: () => {OnNextPersonalisationQuestionScreen()});

    blocTest<PrivacyQuestionBloc, PrivacyQuestionState>(
        'emits OnPreviousSignInSuccessScreen WHEN '
        'Tap next button',
        build: () => privacyQuestionBloc,
        act: (bloc) => bloc.add(PreviousQuestion()),
        expect: () => {OnPreviousSignInSuccessScreen()});

    tearDown(() => {privacyQuestionBloc.close()});
  });
}
