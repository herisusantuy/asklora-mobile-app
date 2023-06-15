import 'package:asklora_mobile_app/feature/tabs/bloc/tabs_screen_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Tab Screen Bloc', () {
    late TabScreenBloc tabScreenBloc;

    setUp(() async {
      tabScreenBloc = TabScreenBloc();
    });
    test('init screen index default should be 1', () {
      expect(
        tabScreenBloc.state,
        const TabScreenState(
          currentIndexScreen: 0,
          shouldShowExitConfirmation: false,
        ),
      );
    });
    blocTest<TabScreenBloc, TabScreenState>(
      'screen should be in "for you" screen when user clicked tab screen no 2',
      build: () => tabScreenBloc,
      act: (bloc) {
        bloc.add(const TabIndexChanged(1));
      },
      expect: () => {
        const TabScreenState(
          currentIndexScreen: 1,
          shouldShowExitConfirmation: false,
        )
      },
    );
    blocTest<TabScreenBloc, TabScreenState>(
      'screen should be in "portfolio" screen when user clicked tab screen no 3',
      build: () => tabScreenBloc,
      act: (bloc) {
        bloc.add(const TabIndexChanged(2));
      },
      expect: () => {
        const TabScreenState(
          currentIndexScreen: 2,
          shouldShowExitConfirmation: false,
        )
      },
    );
    blocTest<TabScreenBloc, TabScreenState>(
      'screen should be in "Chat Lora" screen when user clicked tab screen no 3',
      build: () => tabScreenBloc,
      act: (bloc) {
        bloc.add(const TabIndexChanged(3));
      },
      expect: () => {
        const TabScreenState(
          currentIndexScreen: 3,
          shouldShowExitConfirmation: false,
        )
      },
    );

    blocTest<TabScreenBloc, TabScreenState>(
      'warning user with showing popup message when user click back button',
      build: () => tabScreenBloc,
      act: (bloc) {
        bloc.add(const TabIndexChanged(1));
        bloc.add(BackButtonClicked());
      },
      expect: () => {
        const TabScreenState(
          currentIndexScreen: 1,
          shouldShowExitConfirmation: false,
        ),
        const TabScreenState(
          currentIndexScreen: 1,
          shouldShowExitConfirmation: true,
        ),
      },
    );
    tearDown(() => {tabScreenBloc.close()});
  });
}
