import 'package:asklora_mobile_app/core/presentation/tutorial/Utils/tutorial.dart';
import 'package:asklora_mobile_app/feature/tabs/bloc/tab_screen_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Tab Screen Bloc', () {
    late TabScreenBloc tabScreenBloc;

    setUp(() async {
      tabScreenBloc = TabScreenBloc(initialTabPage: TabPage.forYou);
    });
    test('init screen default page should be for you', () {
      expect(
        tabScreenBloc.state,
        TabScreenState(currentTabPage: TabPage.forYou, tutorialKeys: [
          TutorialJourney.botDetails,
          TutorialJourney.botChart,
          TutorialJourney.chatLoraTab
        ]),
      );
    });
    blocTest<TabScreenBloc, TabScreenState>(
      'screen should be in "for you" screen when user clicked first tab',
      build: () => tabScreenBloc,
      act: (bloc) {
        bloc.add(const TabChanged(TabPage.forYou));
      },
      expect: () => {
        TabScreenState(currentTabPage: TabPage.forYou, tutorialKeys: [
          TutorialJourney.botDetails,
          TutorialJourney.botChart,
          TutorialJourney.chatLoraTab
        ])
      },
    );
    blocTest<TabScreenBloc, TabScreenState>(
      'aiPageSelected = true when user clicked middle tab (AI)',
      build: () => tabScreenBloc,
      act: (bloc) {
        bloc.add(const AiButtonSelected());
      },
      expect: () => {
        TabScreenState(
            currentTabPage: TabPage.forYou,
            aiPageSelected: true,
            tutorialKeys: [
              TutorialJourney.botDetails,
              TutorialJourney.botChart,
              TutorialJourney.chatLoraTab
            ])
      },
    );
    blocTest<TabScreenBloc, TabScreenState>(
      'screen should be in "portfolio" screen when user clicked third tab',
      build: () => tabScreenBloc,
      act: (bloc) {
        bloc.add(const TabChanged(TabPage.portfolio));
      },
      expect: () => {
        TabScreenState(currentTabPage: TabPage.portfolio, tutorialKeys: [
          TutorialJourney.botDetails,
          TutorialJourney.botChart,
          TutorialJourney.chatLoraTab
        ])
      },
    );

    tearDown(() => {tabScreenBloc.close()});
  });
}
