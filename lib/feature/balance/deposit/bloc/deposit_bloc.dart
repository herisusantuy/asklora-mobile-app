import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/base_response.dart';
import '../repository/deposit_repository.dart';
import '../utils/deposit_utils.dart';

part 'deposit_event.dart';

part 'deposit_state.dart';

class DepositBloc extends Bloc<DepositEvent, DepositState> {
  DepositBloc({required DepositRepository depositRepository})
      : _depositRepository = depositRepository,
        super(const DepositState()) {
    on<DepositAmountChanged>(_onDepositAmountChanged);
    on<ProofOfRemittanceImagesChanged>(_onProofOfRemittanceImagesChanged);
    on<ProofOfRemittanceImageDeleted>(_onProofOfRemittanceImageDeleted);
    on<SubmitDeposit>(_onSubmitDeposit);
  }

  final DepositRepository _depositRepository;

  void _onDepositAmountChanged(
      DepositAmountChanged event, Emitter<DepositState> emit) {
    emit(state.copyWith(
      depositAmount: event.depositAmount,
    ));
  }

  _onProofOfRemittanceImagesChanged(
      ProofOfRemittanceImagesChanged event, Emitter<DepositState> emit) {
    List<PlatformFile> images = List.from(state.uploadProofOfRemittanceImages);
    images.addAll(event.images);
    emit(state.copyWith(uploadProofOfRemittanceImages: images));
  }

  _onProofOfRemittanceImageDeleted(
      ProofOfRemittanceImageDeleted event, Emitter<DepositState> emit) {
    List<PlatformFile> images = List.from(state.uploadProofOfRemittanceImages);
    images.remove(event.image);
    emit(state.copyWith(uploadProofOfRemittanceImages: images));
  }

  void _onSubmitDeposit(SubmitDeposit event, Emitter<DepositState> emit) async {
    try {
      emit(state.copyWith(response: BaseResponse.loading()));
      var data = await _depositRepository.submitDeposit(
          depositAmount: state.depositAmount,
          platformFiles: state.uploadProofOfRemittanceImages);
      emit(state.copyWith(response: data));
    } catch (e) {
      emit(state.copyWith(response: BaseResponse.error(e.toString())));
    }
  }
}
