part of 'address_proof_bloc.dart';

enum FundingSource {
  employmentIncome,
  investments,
  inheritance,
  bussinessIncome,
  savings,
  family,
  unknown
}

enum EmploymentStatus {
  unemployed,
  employed,
  student,
  retired,
  unknown,
}

class AddressProofState extends Equatable {
  const AddressProofState({
    this.unitNumber = '',
    this.residentialAddress = '',
    this.city = '',
    this.country = '',
    this.isSameMailingAddress = true,
    this.mailUnitNumber = '',
    this.mailResidentialAddress = '',
    this.mailCity = '',
    this.mailCountry = '',
  });

  final String unitNumber;
  final String residentialAddress;
  final String city;
  final String country;
  final bool isSameMailingAddress;
  final String mailUnitNumber;
  final String mailResidentialAddress;
  final String mailCity;
  final String mailCountry;

  AddressProofState copyWith({
    String? unitNumber,
    String? residentialAddress,
    String? city,
    String? country,
    bool? isSameMailingAddress,
    String? mailUnitNumber,
    String? mailResidentialAddress,
    String? mailCity,
    String? mailCountry,
  }) {
    return AddressProofState(
      unitNumber: unitNumber ?? this.unitNumber,
      residentialAddress: residentialAddress ?? this.residentialAddress,
      city: city ?? this.city,
      country: country ?? this.country,
      isSameMailingAddress: isSameMailingAddress ?? this.isSameMailingAddress,
      mailUnitNumber: mailUnitNumber ?? this.mailUnitNumber,
      mailResidentialAddress:
          mailResidentialAddress ?? this.mailResidentialAddress,
      mailCity: mailCity ?? this.mailCity,
      mailCountry: mailCountry ?? this.mailCountry,
    );
  }

  @override
  List<Object> get props {
    return [
      unitNumber,
      residentialAddress,
      city,
      country,
      isSameMailingAddress,
      mailUnitNumber,
      mailResidentialAddress,
      mailCity,
      mailCountry,
    ];
  }
}
