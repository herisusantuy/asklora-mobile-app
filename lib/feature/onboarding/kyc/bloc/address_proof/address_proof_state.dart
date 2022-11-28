part of 'address_proof_bloc.dart';

class AddressProofState extends Equatable {
  const AddressProofState(
      {this.district = '',
      this.region = '',
      this.addressLine1 = '',
      this.addressLine2 = '',
      this.addressProofImages = const []});

  final String district;
  final String region;
  final String addressLine1;
  final String addressLine2;
  final List<PlatformFile> addressProofImages;

  AddressProofState copyWith({
    String? district,
    String? region,
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
    if (district.isNotEmpty &&
        region.isNotEmpty &&
        addressLine1.isNotEmpty &&
        addressProofImages.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
