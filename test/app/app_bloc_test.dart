import 'package:asklora_mobile_app/app/bloc/app_bloc.dart';
import 'package:asklora_mobile_app/app/domain/user_journey_response.dart';
import 'package:asklora_mobile_app/app/repository/user_journey_repository.dart';
import 'package:asklora_mobile_app/core/domain/base_response.dart';
import 'package:asklora_mobile_app/core/domain/token/repository/token_repository.dart';
import 'package:asklora_mobile_app/core/domain/token/token_api_client.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'app_bloc_test.mocks.dart';

class DioAdapterMock extends Mock implements HttpClientAdapter {}

class MockAppBloc extends MockBloc<AppEvent, AppState> implements AppBloc {}

@GenerateMocks([TokenRepository])
@GenerateMocks([UserJourneyRepository])
@GenerateMocks([TokenApiClient])
void main() async {
  group('App Bloc Tests', () {
    late AppBloc appBloc;
    late MockTokenRepository tokenRepository;
    late MockUserJourneyRepository userJourneyRepository;
    BaseResponse<UserJourneyResponse> userJourneyResponse =
        BaseResponse.complete(
            const UserJourneyResponse('uid', 'updated', 'kyc', 'data', 0, ''));

    setUpAll(() async {
      tokenRepository = MockTokenRepository();
      userJourneyRepository = MockUserJourneyRepository();
    });

    setUp(() async {
      appBloc = AppBloc(
          tokenRepository: tokenRepository,
          userJourneyRepository: userJourneyRepository);
    });

    test('App Bloc init state is should be `unknown`', () {
      expect(appBloc.state, const AppState.unknown());
    });

    blocTest<AppBloc, AppState>(
      'emits `AppState.authenticated` and User Journey = kyc WHEN'
      'Token is valid and User Journey = kyc',
      build: () {
        when(tokenRepository.isTokenValid())
            .thenAnswer((_) => Future.value(true));
        when(userJourneyRepository.getUserJourney())
            .thenAnswer((_) => Future.value(userJourneyResponse));
        return appBloc;
      },
      act: (bloc) => bloc.add(AppLaunched()),
      expect: () =>
          {const AppState.authenticated(userJourney: UserJourney.kyc)},
    );

    blocTest<AppBloc, AppState>(
      'emits `AppState.unauthenticated` WHEN '
      'Token is not valid or expired',
      build: () {
        when(tokenRepository.isTokenValid())
            .thenAnswer((_) => Future.value(false));
        when(userJourneyRepository.getUserJourney())
            .thenAnswer((_) => Future.value(userJourneyResponse));
        return appBloc;
      },
      act: (bloc) => bloc.add(AppLaunched()),
      expect: () =>
          {const AppState.unauthenticated(userJourney: UserJourney.privacy)},
    );

    tearDown(() => {appBloc.close()});
  });
}
