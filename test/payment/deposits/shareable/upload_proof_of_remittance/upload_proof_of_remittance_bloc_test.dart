import 'package:asklora_mobile_app/core/domain/base_response.dart';
import 'package:asklora_mobile_app/feature/payment/deposits/shareable/proof_of_remittance/bloc/upload_proof_of_remittance_bloc.dart';
import 'package:asklora_mobile_app/feature/payment/deposits/repository/file_picker_repository.dart';
import 'package:asklora_mobile_app/feature/payment/deposits/shareable/proof_of_remittance/domain/proof_of_remittance_response.dart';
import 'package:asklora_mobile_app/feature/payment/deposits/shareable/proof_of_remittance/repository/proof_of_remittance_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'upload_proof_of_remittance_bloc_test.mocks.dart';

@GenerateMocks([FilePickerRepository])
@GenerateMocks([ProofOfRemittanceRepository])
void main() async {
  group('Deposit Upload Proof of Remittance Bloc Tests', () {
    late UploadProofOfRemittanceBloc uploadProofOfRemittanceBloc;
    late MockFilePickerRepository filePickerRepository;
    late MockProofOfRemittanceRepository proofOfRemittanceRepository;
    final BaseResponse<ProofOfRemittanceResponse> submitResponse =
        BaseResponse.complete(const ProofOfRemittanceResponse(''));

    setUpAll(() async {
      filePickerRepository = MockFilePickerRepository();
      proofOfRemittanceRepository = MockProofOfRemittanceRepository();
    });
    setUp(() async {
      uploadProofOfRemittanceBloc = UploadProofOfRemittanceBloc(
          proofOfRemittanceRepository: proofOfRemittanceRepository,
          filePickerRepository: filePickerRepository);
    });

    test(
        'Deposit Upload Proof of Remittance Bloc init state the documentFile = null',
        () {
      expect(uploadProofOfRemittanceBloc.state,
          const UploadProofofRemittanceState());
    });

    blocTest<UploadProofOfRemittanceBloc, UploadProofofRemittanceState>(
        'emits `depositAmount = 200` WHEN '
        'changed deposit amount to 200',
        build: () => uploadProofOfRemittanceBloc,
        act: (bloc) => bloc.add(const DepositAmountChanged(200)),
        expect: () => {
              const UploadProofofRemittanceState(depositAmount: 200),
            });

    blocTest<UploadProofOfRemittanceBloc, UploadProofofRemittanceState>(
        'emits `PlatformFile(name: `test_file`, size: 2000)` WHEN '
        'picking some file',
        build: () {
          when(filePickerRepository.pickFiles(fileType: FileType.image))
              .thenAnswer((_) =>
                  Future.value([PlatformFile(name: 'test_file', size: 2000)]));
          return uploadProofOfRemittanceBloc;
        },
        act: (bloc) => bloc.add(const PickFile()),
        expect: () => {
              UploadProofofRemittanceState(
                  documentFiles: [PlatformFile(name: 'test_file', size: 2000)]),
            });

    blocTest<UploadProofOfRemittanceBloc, UploadProofofRemittanceState>(
        'emits `BaseResponse.success` WHEN '
        'submit proof of remittance',
        build: () {
          when(filePickerRepository.pickFiles(fileType: FileType.image))
              .thenAnswer((_) =>
                  Future.value([PlatformFile(name: 'test_file', size: 2000)]));
          when(proofOfRemittanceRepository.submitProofOfRemittance(
                  depositAmount: 200,
                  platformFiles: [PlatformFile(name: 'test_file', size: 2000)]))
              .thenAnswer((_) => Future.value(submitResponse));
          return uploadProofOfRemittanceBloc;
        },
        act: (bloc) => {
              bloc.add(const DepositAmountChanged(200)),
              bloc.add(const PickFile()),
              bloc.add(const SubmitProofOfRemittance())
            },
        expect: () => {
              const UploadProofofRemittanceState(depositAmount: 200),
              UploadProofofRemittanceState(
                  depositAmount: 200,
                  documentFiles: [PlatformFile(name: 'test_file', size: 2000)]),
              UploadProofofRemittanceState(
                  response: BaseResponse.loading(),
                  depositAmount: 200,
                  documentFiles: [PlatformFile(name: 'test_file', size: 2000)]),
              UploadProofofRemittanceState(
                  response: submitResponse,
                  depositAmount: 200,
                  documentFiles: [PlatformFile(name: 'test_file', size: 2000)]),
            });

    tearDown(() => {uploadProofOfRemittanceBloc.close()});
  });
}
