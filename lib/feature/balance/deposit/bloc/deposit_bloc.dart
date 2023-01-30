import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/base_response.dart';
import '../../../../core/utils/extensions.dart';
import '../repository/deposit_repository.dart';
import '../utils/deposit_utils.dart';

part 'deposit_event.dart';

part 'deposit_state.dart';

class DepositBloc extends Bloc<DepositEvent, DepositState> {
  DepositBloc(
      {required DepositRepository depositRepository, required this.depositType})
      : _depositRepository = depositRepository,
        super(const DepositState()) {
    on<DepositAmountChanged>(_onDepositAmountChanged);
    on<ProofOfRemittanceImagesChanged>(_onProofOfRemittanceImagesChanged);
    on<ProofOfRemittanceImageDeleted>(_onProofOfRemittanceImageDeleted);
    on<SubmitDeposit>(_onSubmitDeposit);
  }

  final DepositRepository _depositRepository;
  final DepositType depositType;

  void _onDepositAmountChanged(
      DepositAmountChanged event, Emitter<DepositState> emit) {
    emit(state.copyWith(
      depositAmount: event.depositAmount,
      depositAmountErrorText: '',
    ));
  }

  _onProofOfRemittanceImagesChanged(
      ProofOfRemittanceImagesChanged event, Emitter<DepositState> emit) {
    emit(state.copyWith(proofOfRemittanceImagesErrorText: ''));
    List<PlatformFile> images = List.from(state.proofOfRemittanceImages);
    images.addAll(event.images);
    if (images.length > maximumProofOfRemittanceImagesAllowed) {
      emit(state.copyWith(
          proofOfRemittanceImagesErrorText:
              'Maximum number of images allowed is $maximumProofOfRemittanceImagesAllowed'));
    } else {
      emit(state.copyWith(proofOfRemittanceImages: images));
    }
  }

  _onProofOfRemittanceImageDeleted(
      ProofOfRemittanceImageDeleted event, Emitter<DepositState> emit) {
    List<PlatformFile> images = List.from(state.proofOfRemittanceImages);
    images.remove(event.image);
    emit(state.copyWith(proofOfRemittanceImages: images));
  }

  void _onSubmitDeposit(SubmitDeposit event, Emitter<DepositState> emit) async {
    try {
      if (_isBelowMinAmount) {
        emit(state.copyWith(depositAmountErrorText: _getAmountErrorText));
      } else {
        emit(state.copyWith(response: BaseResponse.loading()));
        var data = await _depositRepository.submitDeposit(
            depositAmount: state.depositAmount,
            platformFiles: state.proofOfRemittanceImages);
        emit(state.copyWith(response: data));
      }
    } catch (e) {
      emit(state.copyWith(response: BaseResponse.error(e.toString())));
    }
  }

  bool get _isBelowMinAmount {
    return state.depositAmount < depositType.minDeposit;
  }

  String get _getAmountErrorText =>
      'The minimum deposit amount is HKD${depositType.minDeposit.convertToCurrencyDecimal()}';
}
