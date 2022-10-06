import 'package:asklora_mobile_app/core/domain/base_response.dart';
import 'package:asklora_mobile_app/feature/ppi/bloc/response/user_response_bloc.dart';
import 'package:asklora_mobile_app/feature/ppi/domain/endpoint_response.dart';
import 'package:asklora_mobile_app/feature/ppi/domain/user_response_request.dart';
import 'package:asklora_mobile_app/feature/ppi/repository/question_answer_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_response_bloc_test.mocks.dart';

@GenerateMocks([UserResponseRepository])
void main() async {
  group('User Response Bloc Tests', () {
    late UserResponseRepository userResponseRepository;
    late UserResponseBloc userResponseBloc;

    UserResponseRequest userResponseRequest = UserResponseRequest(
        questionId: 'quid0',
        section: 'investment_style',
        types: 'choices',
        points: '1');
    EndpointResponse endpointResponse =
        const EndpointResponse(email: 'xx@gmail.com');

    setUpAll(() async {
      userResponseRepository = MockUserResponseRepository();
    });

    setUp(() async {
      userResponseBloc =
          UserResponseBloc(userResponseRepository: userResponseRepository);
    });

    test('User Response Bloc init state is should be unknown', () {
      expect(userResponseBloc.state,
          const UserResponseState(responseState: ResponseState.unknown));
    });

    blocTest<UserResponseBloc, UserResponseState>(
        'emits ResponseState success and EndpointResponse(email:xx@gmail.com) WHEN '
        'send answer',
        build: () {
          when(userResponseRepository.addAnswer(userResponseRequest))
              .thenAnswer((_) => Future.value(endpointResponse));
          return userResponseBloc;
        },
        act: (bloc) => bloc.add(SendResponse(userResponseRequest)),
        expect: () => {
              const UserResponseState(
                  responseState: ResponseState.loading,
                  endpointResponse: EndpointResponse()),
              UserResponseState(
                  responseState: ResponseState.success,
                  endpointResponse: endpointResponse)
            });

    tearDown(() => {userResponseBloc.close()});
  });
}
