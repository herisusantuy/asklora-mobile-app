import 'package:asklora_mobile_app/app/bloc/app_bloc.dart';
import 'package:asklora_mobile_app/core/domain/token/token_api_client.dart';
import 'package:asklora_mobile_app/core/utils/token_validator.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'app_bloc_test.mocks.dart';

class DioAdapterMock extends Mock implements HttpClientAdapter {}

class MockAppBloc extends MockBloc<AppEvent, AppState> implements AppBloc {}

@GenerateMocks([TokenValidator])
@GenerateMocks([TokenApiClient])
void main() async {
  group('App Bloc Tests', () {
    late AppBloc appBloc;
    late MockTokenValidator tokenValidator;

    setUpAll(() async {
      tokenValidator = MockTokenValidator();
    });

    setUp(() async {
      appBloc = AppBloc(tokenValidator: tokenValidator);
    });

    test('App Bloc init state is should be `unknown`', () {
      expect(appBloc.state, const AppState.unknown());
    });

    blocTest<AppBloc, AppState>(
      'emits `AppState.unauthenticated` WHEN '
      'Token is not valid or expired',
      build: () {
        when(tokenValidator.isTokenValid())
            .thenAnswer((_) => Future.value(false));
        return appBloc;
      },
      act: (bloc) => bloc.add(AppLaunched()),
      expect: () => {const AppState.unauthenticated()},
    );

    blocTest<AppBloc, AppState>(
      'emits `AppState.authenticated` WHEN '
      'Token is valid',
      build: () {
        when(tokenValidator.isTokenValid())
            .thenAnswer((_) => Future.value(true));
        return appBloc;
      },
      act: (bloc) => bloc.add(AppLaunched()),
      expect: () => {const AppState.authenticated()},
    );

    tearDown(() => {appBloc.close()});
  });
}
