part of 'address_proof_bloc.dart';

abstract class AddressProofEvent extends Equatable {
  const AddressProofEvent();

  @override
  List<Object> get props => [];
}

class AddressProofUnitNumberChanged extends AddressProofEvent {
  final String unitNumber;
  const AddressProofUnitNumberChanged(this.unitNumber) : super();
  @override
  List<Object> get props => [unitNumber];
}

class AddressProofResidentialChanged extends AddressProofEvent {
  final String residentialAddress;
  const AddressProofResidentialChanged(this.residentialAddress) : super();
  @override
  List<Object> get props => [residentialAddress];
}

class AddressProofCityChanged extends AddressProofEvent {
  final String city;
  const AddressProofCityChanged(this.city) : super();
  @override
  List<Object> get props => [city];
}

class AddressProofCountryChanged extends AddressProofEvent {
  final String country;
  const AddressProofCountryChanged(this.country) : super();
  @override
  List<Object> get props => [country];
}

class AddressProofIsSameMailingAddressChanged extends AddressProofEvent {
  final bool isSameMailingAddress;
  const AddressProofIsSameMailingAddressChanged(this.isSameMailingAddress)
      : super();
  @override
  List<Object> get props => [isSameMailingAddress];
}

class AddressProofMailUnitNumberChanged extends AddressProofEvent {
  final String mailUnitNumber;
  const AddressProofMailUnitNumberChanged(this.mailUnitNumber) : super();
  @override
  List<Object> get props => [mailUnitNumber];
}

class AddressProofMailResidentialAddressChanged extends AddressProofEvent {
  final String mailResidentialAddress;
  const AddressProofMailResidentialAddressChanged(this.mailResidentialAddress)
      : super();
  @override
  List<Object> get props => [mailResidentialAddress];
}

class AddressProofMailCityChanged extends AddressProofEvent {
  final String mailCity;
  const AddressProofMailCityChanged(this.mailCity) : super();
  @override
  List<Object> get props => [mailCity];
}

class AddressProofMailCountryChanged extends AddressProofEvent {
  final String mailCountry;
  const AddressProofMailCountryChanged(this.mailCountry) : super();
  @override
  List<Object> get props => [mailCountry];
}
