import 'package:asklora_mobile_app/core/domain/otp/get_otp_client.dart';
import 'package:asklora_mobile_app/core/domain/otp/get_otp_request.dart';
import 'package:asklora_mobile_app/core/domain/otp/verify_otp_request.dart';
import 'package:asklora_mobile_app/feature/auth/otp/bloc/otp_bloc.dart';
import 'package:asklora_mobile_app/feature/auth/otp/repository/otp_repository.dart';
import 'package:asklora_mobile_app/feature/auth/sign_up/domain/response.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'package:mockito/mockito.dart';

import 'otp_bloc_test.mocks.dart';

class DioAdapterMock extends Mock implements HttpClientAdapter {}

class MockCounterBloc extends MockBloc<OtpEvent, OtpState> implements OtpBloc {}

@GenerateMocks([OtpRepository])
@GenerateMocks([GetOtpClient])
void main() async {
  group('Otp Screen Bloc Tests', () {
    late MockOtpRepository otpRepository;
    late OtpBloc otpBloc;

    setUpAll(() async {
      otpRepository = MockOtpRepository();
    });

    setUp(() async {
      otpBloc = OtpBloc(otpRepository: otpRepository);
    });

    test('Otp Bloc init state is should be `unknown`', () {
      expect(
          otpBloc.state,
          const OtpState(
              status: OtpStatus.unknown,
              otp: '',
              responseMessage: '',
              resetTime: 0));
    });

    blocTest<OtpBloc, OtpState>(
        'emits `OtpStatus.unknown` and `resetTime` = [ticking]` WHEN '
        'Tap request otp code',
        build: () {
          when(otpRepository.getOtp(
                  getOtpRequest: GetOtpRequest(
                      'test123@example.com', OtpType.register.value)))
              .thenAnswer((_) =>
                  Future.value(GetOtpResponse('OTP code sent to your email')));
          return otpBloc;
        },
        act: (bloc) => bloc.add(const OtpRequested('test123@example.com')),
        expect: () => {
              const OtpState(status: OtpStatus.loading),
              const OtpState(
                responseMessage: 'OTP code sent to your email',
                status: OtpStatus.unknown,
              ),
            });

    blocTest<OtpBloc, OtpState>(
        'emits `OtpStatus.submitSuccess` and `responseMessage` = Verify OTP Success` WHEN '
        'input correct otp and then Submit Otp',
        build: () {
          when(otpRepository.verifyOtp(
                  verifyOtpRequest: VerifyOtpRequest(
                      'test123@example.com', OtpType.register.value)))
              .thenAnswer(
                  (_) => Future.value(GetOtpResponse('Verify OTP Success')));
          return otpBloc;
        },
        act: (bloc) => bloc.add(
            OtpSubmitted(VerifyOtpRequest('test123@example.com', '112233'))),
        expect: () => {
              const OtpState(status: OtpStatus.unknown, otp: '112233'),
              const OtpState(status: OtpStatus.loading),
              const OtpState(
                  status: OtpStatus.success,
                  responseMessage: 'Verify OTP Success'),
            });

    tearDown(() => {otpBloc.close()});
  });
}
