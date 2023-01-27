part of 'deposit_bloc.dart';

class DepositState extends Equatable {
  final BaseResponse response;
  final double depositAmount;
  final List<PlatformFile> proofOfRemittanceImages;

  const DepositState({
    this.response = const BaseResponse(),
    this.depositAmount = 0,
    this.proofOfRemittanceImages = const [],
  }) : super();

  @override
  List<Object?> get props => [depositAmount, proofOfRemittanceImages, response];

  DepositState copyWith({
    double? depositAmount,
    List<PlatformFile>? proofOfRemittanceImages,
    BaseResponse? response,
  }) {
    return DepositState(
      response: response ?? this.response,
      depositAmount: depositAmount ?? this.depositAmount,
      proofOfRemittanceImages:
          proofOfRemittanceImages ?? this.proofOfRemittanceImages,
    );
  }

  bool disableDeposit(DepositType depositType) {
    if (depositType == DepositType.type2) {
      if (depositAmount == 0) {
        return true;
      } else {
        return false;
      }
    } else {
      if (depositAmount == 0 || proofOfRemittanceImages.isEmpty) {
        return true;
      } else {
        return false;
      }
    }
  }
}
