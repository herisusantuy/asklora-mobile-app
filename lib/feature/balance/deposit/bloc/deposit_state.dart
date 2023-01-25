part of 'deposit_bloc.dart';

class DepositState extends Equatable {
  final BaseResponse response;
  final double depositAmount;
  final List<PlatformFile> uploadProofOfRemittanceImages;

  const DepositState({
    this.response = const BaseResponse(),
    this.depositAmount = 0,
    this.uploadProofOfRemittanceImages = const [],
  }) : super();

  @override
  List<Object?> get props =>
      [depositAmount, uploadProofOfRemittanceImages, response];

  DepositState copyWith({
    double? depositAmount,
    List<PlatformFile>? uploadProofOfRemittanceImages,
    BaseResponse? response,
  }) {
    return DepositState(
      response: response ?? this.response,
      depositAmount: depositAmount ?? this.depositAmount,
      uploadProofOfRemittanceImages:
          uploadProofOfRemittanceImages ?? this.uploadProofOfRemittanceImages,
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
      if (depositAmount == 0 || uploadProofOfRemittanceImages.isEmpty) {
        return true;
      } else {
        return false;
      }
    }
  }
}
