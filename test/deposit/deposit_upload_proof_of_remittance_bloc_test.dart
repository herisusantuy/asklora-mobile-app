import 'package:asklora_mobile_app/feature/deposit/deposit_upload_proof_of_remittance/bloc/deposit_upload_proof_of_remittance_bloc.dart';
import 'package:asklora_mobile_app/feature/deposit/deposit_upload_proof_of_remittance/repository/FilePickerRepository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'deposit_upload_proof_of_remittance_bloc_test.mocks.dart';

@GenerateMocks([FilePickerRepository])
void main() async {
  group('Deposit Upload Proof of Remittance Bloc Tests', () {
    late DepositUploadProofOfRemittanceBloc depositUploadProofOfRemittanceBloc;
    late MockFilePickerRepository filePickerRepository;

    setUpAll(() async {
      filePickerRepository = MockFilePickerRepository();
    });
    setUp(() async {
      depositUploadProofOfRemittanceBloc = DepositUploadProofOfRemittanceBloc(
          filePickerRepository: filePickerRepository);
    });

    test(
        'Deposit Upload Proof of Remittance Bloc init state the documentFile = null',
        () {
      expect(depositUploadProofOfRemittanceBloc.state,
          const DepositUploadProofofRemittanceState(documentFile: null));
    });

    blocTest<DepositUploadProofOfRemittanceBloc,
            DepositUploadProofofRemittanceState>(
        'emits `withdrawalUSDAmount` = 1 and `withdrawalHKDAmount` = 7.8476` WHEN '
        'input amount 1',
        build: () {
          when(filePickerRepository.pickFile(fileType: FileType.image))
              .thenAnswer((_) =>
                  Future.value(PlatformFile(name: 'test_file', size: 2000)));
          return depositUploadProofOfRemittanceBloc;
        },
        act: (bloc) => bloc.add(const PickDocumentFile()),
        expect: () => {
              DepositUploadProofofRemittanceState(
                  documentFile: PlatformFile(name: 'test_file', size: 2000)),
            });

    tearDown(() => {depositUploadProofOfRemittanceBloc.close()});
  });
}
