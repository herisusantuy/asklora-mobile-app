import 'package:asklora_mobile_app/core/domain/base_response.dart';
import 'package:asklora_mobile_app/feature/onboarding/ppi/bloc/response/user_response_bloc.dart';
import 'package:asklora_mobile_app/feature/onboarding/ppi/domain/ppi_user_response.dart';
import 'package:asklora_mobile_app/feature/onboarding/ppi/domain/ppi_user_response_request.dart';
import 'package:asklora_mobile_app/feature/onboarding/ppi/repository/ppi_response_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_response_bloc_test.mocks.dart';

@GenerateMocks([PpiResponseRepository])
void main() async {
  group('User Response Bloc Tests', () {
    late PpiResponseRepository ppiResponseRepository;
    late UserResponseBloc userResponseBloc;

    PpiUserResponseRequest ppiUserResponseRequest = PpiUserResponseRequest(
        questionId: 'quid0',
        section: 'investment_style',
        types: 'choices',
        points: '1');
    PpiUserResponse ppiUserResponse =
        const PpiUserResponse(email: 'xx@gmail.com');

    setUpAll(() async {
      ppiResponseRepository = MockPpiResponseRepository();
    });

    setUp(() async {
      userResponseBloc =
          UserResponseBloc(ppiResponseRepository: ppiResponseRepository);
    });

    test('User Response Bloc init state is should be unknown', () {
      expect(userResponseBloc.state,
          const UserResponseState(responseState: ResponseState.unknown));
    });

    blocTest<UserResponseBloc, UserResponseState>(
        'emits ResponseState success and ppiUserResponse(email:xx@gmail.com) WHEN '
        'send answer',
        build: () {
          when(ppiResponseRepository.addAnswer(ppiUserResponseRequest))
              .thenAnswer((_) => Future.value(ppiUserResponse));
          return userResponseBloc;
        },
        act: (bloc) => bloc.add(SendResponse(ppiUserResponseRequest)),
        expect: () => {
              const UserResponseState(
                  responseState: ResponseState.loading,
                  ppiUserResponse: PpiUserResponse()),
              UserResponseState(
                  responseState: ResponseState.success,
                  ppiUserResponse: ppiUserResponse)
            });

    tearDown(() => {userResponseBloc.close()});
  });
}
