import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../repository/FilePickerRepository.dart';

part 'deposit_upload_proof_of_remittance_event.dart';

part 'deposit_upload_proof_of_remittance_state.dart';

class DepositUploadProofOfRemittanceBloc extends Bloc<
    DepositUploadProofofRemittanceEvent, DepositUploadProofofRemittanceState> {
  DepositUploadProofOfRemittanceBloc(
      {required FilePickerRepository filePickerRepository})
      : _filePickerRepository = filePickerRepository,
        super(const DepositUploadProofofRemittanceState()) {
    on<PickDocumentFile>(_onPickDocumentFile);
  }

  final FilePickerRepository _filePickerRepository;

  void _onPickDocumentFile(
    PickDocumentFile event,
    Emitter<DepositUploadProofofRemittanceState> emit,
  ) async {
    emit(state.copyWith(
        documentFile:
            await _filePickerRepository.pickFile(fileType: FileType.image)));
  }
}
