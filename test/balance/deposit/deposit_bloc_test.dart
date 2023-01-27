import 'package:asklora_mobile_app/core/domain/base_response.dart';
import 'package:asklora_mobile_app/feature/balance/deposit/bloc/deposit_bloc.dart';
import 'package:asklora_mobile_app/feature/balance/deposit/domain/deposit_response.dart';
import 'package:asklora_mobile_app/feature/balance/deposit/repository/deposit_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'deposit_bloc_test.mocks.dart';

@GenerateMocks([DepositRepository])
void main() async {
  group('Deposit Bloc Tests', () {
    late DepositBloc depositBloc;
    late DepositRepository depositRepository;
    final BaseResponse<DepositResponse> submitResponse =
        BaseResponse.complete(const DepositResponse(''));

    setUpAll(() async {
      depositRepository = MockDepositRepository();
    });
    setUp(() async {
      depositBloc = DepositBloc(depositRepository: depositRepository);
    });

    test('Deposit Bloc init state should be default one', () {
      expect(depositBloc.state, const DepositState());
    });

    blocTest<DepositBloc, DepositState>(
        'emits `depositAmount = 200` WHEN '
        'changed deposit amount to 200',
        build: () => depositBloc,
        act: (bloc) => bloc.add(const DepositAmountChanged(200)),
        expect: () => {
              const DepositState(depositAmount: 200),
            });

    blocTest<DepositBloc, DepositState>(
        'emits `PlatformFile(name: `test_file`, size: 2000)` WHEN '
        'picking some file',
        build: () => depositBloc,
        act: (bloc) => bloc.add(
              ProofOfRemittanceImagesChanged(
                [
                  PlatformFile(name: 'test_file', size: 2000),
                ],
              ),
            ),
        expect: () => {
              DepositState(proofOfRemittanceImages: [
                PlatformFile(name: 'test_file', size: 2000)
              ]),
            });

    blocTest<DepositBloc, DepositState>(
        'emits `zero proof of remittance images` WHEN '
        'add file and then delete the file',
        build: () => depositBloc,
        act: (bloc) => {
              bloc.add(
                ProofOfRemittanceImagesChanged(
                  [
                    PlatformFile(name: 'test_file', size: 2000),
                  ],
                ),
              ),
              bloc.add(ProofOfRemittanceImageDeleted(
                  PlatformFile(name: 'test_file', size: 2000))),
            },
        expect: () => {
              DepositState(
                proofOfRemittanceImages: [
                  PlatformFile(name: 'test_file', size: 2000),
                ],
              ),
              const DepositState(
                proofOfRemittanceImages: [],
              ),
            });

    blocTest<DepositBloc, DepositState>(
        'emits `BaseResponse.success` WHEN '
        'submit deposit',
        build: () {
          when(depositRepository.submitDeposit(
                  depositAmount: 200,
                  platformFiles: [PlatformFile(name: 'test_file', size: 2000)]))
              .thenAnswer((_) => Future.value(submitResponse));
          return depositBloc;
        },
        act: (bloc) => {
              bloc.add(const DepositAmountChanged(200)),
              bloc.add(ProofOfRemittanceImagesChanged(
                [
                  PlatformFile(name: 'test_file', size: 2000),
                ],
              )),
              bloc.add(SubmitDeposit())
            },
        expect: () => {
              const DepositState(depositAmount: 200),
              DepositState(depositAmount: 200, proofOfRemittanceImages: [
                PlatformFile(name: 'test_file', size: 2000)
              ]),
              DepositState(
                  response: BaseResponse.loading(),
                  depositAmount: 200,
                  proofOfRemittanceImages: [
                    PlatformFile(name: 'test_file', size: 2000)
                  ]),
              DepositState(
                  response: submitResponse,
                  depositAmount: 200,
                  proofOfRemittanceImages: [
                    PlatformFile(name: 'test_file', size: 2000)
                  ]),
            });

    tearDown(() => {depositBloc.close()});
  });
}
