import 'package:asklora_mobile_app/core/presentation/tutorial/bloc/tutorial_bloc.dart';
import 'package:asklora_mobile_app/core/repository/tutorial_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'tutorial_bloc_test.mocks.dart';

@GenerateMocks([TutorialRepository])
void main() {
  group('Tutorial Bloc', () {
    late TutorialBloc tutorialBloc;
    late MockTutorialRepository tutorialRepository;

    late Future<bool> isBotDetailsTutorial =
        tutorialRepository.isBotDetailsTutorial();

    setUpAll(() async {
      tutorialRepository = MockTutorialRepository();
    });

    setUp(() async {
      tutorialBloc = TutorialBloc(tutorialRepository: tutorialRepository);
    });

    test('init tutorial bloc', () {
      expect(
        tutorialBloc.state,
        const TutorialState(),
      );
    });

    blocTest<TutorialBloc, TutorialState>(
      'init tutorial on the first time user open the apps to be "true"',
      build: () {
        when(tutorialRepository.isBotDetailsTutorial())
            .thenAnswer((_) => Future.value(isBotDetailsTutorial));
        return tutorialBloc;
      },
      act: (bloc) {
        bloc.add(InitTutorial());
      },
      expect: () {
        const TutorialState(isBotDetailsTutorial: false);
        const TutorialState(isBotDetailsTutorial: true);
      },
    );

    blocTest<TutorialBloc, TutorialState>(
      'change value of isBotDetailsTutorial to be "false" when user finished the tutorial of bot recommendation details',
      build: () => tutorialBloc,
      act: (bloc) {
        bloc.add(BotDetailsTutorialFinished());
      },
      expect: () {
        const TutorialState(isBotDetailsTutorial: true);
        const TutorialState(isBotDetailsTutorial: false);
      },
    );

    tearDown(() => {tutorialBloc.close()});
  });
}
