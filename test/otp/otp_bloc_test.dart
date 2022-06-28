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
  group('Sign Up Screen Bloc Tests', () {
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
              resetTime: 0,
              textInputPosition: 0));
    });

    blocTest<OtpBloc, OtpState>(
        'emits `OtpStatus.unknown` and `otp` = 123456` WHEN '
        'Tap numkey 1 to 6',
        build: () {
          when(OtpRepository().getOtp(
                  getOtpRequest: GetOtpRequest(
                      'test123@example.com', OtpType.register.value)))
              .thenAnswer((_) =>
                  Future.value(GetOtpResponse('OTP Request Successful')));
          return otpBloc;
        },
        act: (bloc) => {
              bloc.add(const OtpInputChanged('1')),
              bloc.add(const OtpInputChanged('2')),
              bloc.add(const OtpInputChanged('3')),
              bloc.add(const OtpInputChanged('4')),
              bloc.add(const OtpInputChanged('5')),
              bloc.add(const OtpInputChanged('6')),
            },
        expect: () => {
              const OtpState(
                status: OtpStatus.unknown,
                otp: '1',
                textInputPosition: 0,
              ),
              const OtpState(
                status: OtpStatus.unknown,
                otp: '12',
                textInputPosition: 1,
              ),
              const OtpState(
                status: OtpStatus.unknown,
                otp: '123',
                textInputPosition: 2,
              ),
              const OtpState(
                status: OtpStatus.unknown,
                otp: '1234',
                textInputPosition: 3,
              ),
              const OtpState(
                status: OtpStatus.unknown,
                otp: '12345',
                textInputPosition: 4,
              ),
              const OtpState(
                status: OtpStatus.unknown,
                otp: '123456',
                textInputPosition: 5,
              ),
            });

    blocTest<OtpBloc, OtpState>(
        'emits `OtpStatus.unknown` and `resetTime` = [ticking]` WHEN '
        'Tap request otp code',
        build: () {
          when(OtpRepository().getOtp(
                  getOtpRequest: GetOtpRequest(
                      'test123@example.com', OtpType.register.value)))
              .thenAnswer((_) =>
                  Future.value(GetOtpResponse('OTP Request Successful')));
          return otpBloc;
        },
        act: (bloc) => bloc.add(OtpRequested(
            GetOtpRequest('test123@example.com', OtpType.register.value))),
        expect: () => {
              const OtpState(status: OtpStatus.requestLoading),
              const OtpState(
                  disableRequest: true,
                  resetTime: 180,
                  status: OtpStatus.requestSuccess),
              const OtpState(
                  disableRequest: true,
                  resetTime: 179,
                  status: OtpStatus.requestSuccess),
              const OtpState(
                  disableRequest: true,
                  resetTime: 178,
                  status: OtpStatus.requestSuccess)
            });

    blocTest<OtpBloc, OtpState>(
        'emits `OtpStatus.submitSuccess` and `responseMessage` = Verify OTP Success` WHEN '
        'input correct otp and then Submit Otp',
        build: () {
          when(OtpRepository().verifyOtp(
                  verifyOtpRequest: VerifyOtpRequest(
                      'test123@example.com', OtpType.register.value)))
              .thenAnswer(
                  (_) => Future.value(GetOtpResponse('Verify OTP Success')));
          return otpBloc;
        },
        act: (bloc) => bloc.add(
            OtpSubmitted(VerifyOtpRequest('test123@example.com', '112233'))),
        expect: () => {
              const OtpState(status: OtpStatus.verifyLoading),
              const OtpState(
                  status: OtpStatus.submitSuccess,
                  responseMessage: 'Verify OTP Success'),
            });

    tearDown(() => {otpBloc.close()});
  });
}
