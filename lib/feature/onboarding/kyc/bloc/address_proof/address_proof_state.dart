part of 'address_proof_bloc.dart';

class AddressProofState extends Equatable {
  const AddressProofState(
      {this.district,
      this.region,
      this.addressLine1 = '',
      this.addressLine2 = '',
      this.addressProofImages = const []});

  final District? district;
  final Region? region;
  final String addressLine1;
  final String addressLine2;
  final List<PlatformFile> addressProofImages;

  AddressProofState copyWith({
    District? district,
    Region? region,
    String? addressLine1,
    String? addressLine2,
    List<PlatformFile>? addressProofImages,
  }) {
    return AddressProofState(
      district: district ?? this.district,
      region: region ?? this.region,
      addressLine1: addressLine1 ?? this.addressLine1,
      addressLine2: addressLine2 ?? this.addressLine2,
      addressProofImages: addressProofImages ?? this.addressProofImages,
    );
  }

  @override
  List<Object?> get props {
    return [district, region, addressLine1, addressLine2, addressProofImages];
  }

  bool enableNextButton() {
    if (district != null &&
        region != null &&
        addressLine1.isNotEmpty &&
        addressProofImages.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
