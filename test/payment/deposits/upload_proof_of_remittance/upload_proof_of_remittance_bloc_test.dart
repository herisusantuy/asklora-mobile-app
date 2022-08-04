import 'package:asklora_mobile_app/feature/payment/deposits/bloc/upload_proof_of_remittance/upload_proof_of_remittance_bloc.dart';
import 'package:asklora_mobile_app/feature/payment/deposits/repository/file_picker_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'upload_proof_of_remittance_bloc_test.mocks.dart';

@GenerateMocks([FilePickerRepository])
void main() async {
  group('Deposit Upload Proof of Remittance Bloc Tests', () {
    late UploadProofOfRemittanceBloc uploadProofOfRemittanceBloc;
    late MockFilePickerRepository filePickerRepository;

    setUpAll(() async {
      filePickerRepository = MockFilePickerRepository();
    });
    setUp(() async {
      uploadProofOfRemittanceBloc = UploadProofOfRemittanceBloc(
          filePickerRepository: filePickerRepository);
    });

    test(
        'Deposit Upload Proof of Remittance Bloc init state the documentFile = null',
        () {
      expect(uploadProofOfRemittanceBloc.state,
          const UploadProofofRemittanceState());
    });

    blocTest<UploadProofOfRemittanceBloc, UploadProofofRemittanceState>(
        'emits `PlatformFile(name: `test_file`, size: 2000)` WHEN '
        'picking some file',
        build: () {
          when(filePickerRepository.pickFile(fileType: FileType.image))
              .thenAnswer((_) =>
                  Future.value(PlatformFile(name: 'test_file', size: 2000)));
          return uploadProofOfRemittanceBloc;
        },
        act: (bloc) => bloc.add(const PickFile()),
        expect: () => {
              UploadProofofRemittanceState(
                  documentFile: PlatformFile(name: 'test_file', size: 2000)),
            });

    tearDown(() => {uploadProofOfRemittanceBloc.close()});
  });
}
