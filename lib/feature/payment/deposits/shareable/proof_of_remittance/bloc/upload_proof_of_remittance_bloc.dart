import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repository/file_picker_repository.dart';

part 'upload_proof_of_remittance_event.dart';

part 'upload_proof_of_remittance_state.dart';

class UploadProofOfRemittanceBloc
    extends Bloc<UploadProofofRemittanceEvent, UploadProofofRemittanceState> {
  UploadProofOfRemittanceBloc(
      {required FilePickerRepository filePickerRepository})
      : _filePickerRepository = filePickerRepository,
        super(const UploadProofofRemittanceState()) {
    on<PickFile>(_onPickFile);
  }

  final FilePickerRepository _filePickerRepository;

  void _onPickFile(
    PickFile event,
    Emitter<UploadProofofRemittanceState> emit,
  ) async {
    emit(state.copyWith(
        documentFile:
            await _filePickerRepository.pickFile(fileType: FileType.image)));
  }
}
