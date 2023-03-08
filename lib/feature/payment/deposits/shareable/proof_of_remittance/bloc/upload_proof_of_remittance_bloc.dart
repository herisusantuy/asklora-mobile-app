import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/domain/base_response.dart';
import '../../../repository/file_picker_repository.dart';
import '../repository/proof_of_remittance_repository.dart';

part 'upload_proof_of_remittance_event.dart';

part 'upload_proof_of_remittance_state.dart';

class UploadProofOfRemittanceBloc
    extends Bloc<UploadProofofRemittanceEvent, UploadProofofRemittanceState> {
  UploadProofOfRemittanceBloc(
      {required FilePickerRepository filePickerRepository,
      required ProofOfRemittanceRepository proofOfRemittanceRepository})
      : _filePickerRepository = filePickerRepository,
        _proofOfRemittanceRepository = proofOfRemittanceRepository,
        super(const UploadProofofRemittanceState()) {
    on<PickFile>(_onPickFile);
    on<DepositAmountChanged>(_onDepositAmountChanged);
    on<SubmitProofOfRemittance>(_onSubmitProofOfRemittance);
    on<SubmitWithOutProofOfRemittance>(_onSubmitWithOutProofOfRemittance);
  }

  final FilePickerRepository _filePickerRepository;
  final ProofOfRemittanceRepository _proofOfRemittanceRepository;

  void _onDepositAmountChanged(
      DepositAmountChanged event, Emitter<UploadProofofRemittanceState> emit) {
    emit(state.copyWith(depositAmount: event.value));
  }

  void _onSubmitProofOfRemittance(SubmitProofOfRemittance event,
      Emitter<UploadProofofRemittanceState> emit) async {
    try {
      emit(state.copyWith(response: BaseResponse.loading()));
      var data = await _proofOfRemittanceRepository.submitProofOfRemittance(
          depositAmount: state.depositAmount,
          platformFiles: state.documentFiles);
      emit(state.copyWith(response: data));
    } catch (e) {
      emit(state.copyWith(response: BaseResponse.error()));
    }
  }

  void _onSubmitWithOutProofOfRemittance(SubmitWithOutProofOfRemittance event,
      Emitter<UploadProofofRemittanceState> emit) async {
    try {
      emit(state.copyWith(response: BaseResponse.loading()));
      var data = await _proofOfRemittanceRepository.submitProofOfRemittance(
          depositAmount: state.depositAmount, platformFiles: []);
      emit(state.copyWith(response: data));
    } catch (e) {
      emit(state.copyWith(response: BaseResponse.error()));
    }
  }

  void _onPickFile(
    PickFile event,
    Emitter<UploadProofofRemittanceState> emit,
  ) async {
    emit(state.copyWith(
        documentFiles:
            await _filePickerRepository.pickFiles(fileType: FileType.image)));
  }
}
