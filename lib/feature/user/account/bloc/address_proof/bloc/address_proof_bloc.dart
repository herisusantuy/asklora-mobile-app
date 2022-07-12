import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'address_proof_event.dart';

part 'address_proof_state.dart';

class AddressProofBloc extends Bloc<AddressProofEvent, AddressProofState> {
  AddressProofBloc() : super(const AddressProofState()) {
    on<AddressProofUnitNumberChanged>(_onAddressProofUnitNumberChanged);
    on<AddressProofResidentialChanged>(_onAddressProofResidentChanged);
    on<AddressProofCityChanged>(_onAddressProofCityChanged);
    on<AddressProofCountryChanged>(_onAddressProofCountryChanged);
    on<AddressProofIsSameMailingAddressChanged>(_onIsSameMailingAddressChanged);
    on<AddressProofMailUnitNumberChanged>(_onAddressProofMailUnitNumberChanged);
    on<AddressProofMailResidentialAddressChanged>(
        _onAddressProofMailResidentialAddressChanged);
    on<AddressProofMailCityChanged>(_onAddressProofMailCityChanged);
    on<AddressProofMailCountryChanged>(_onAddressProofMailCountryChanged);
  }

  _onAddressProofUnitNumberChanged(
      AddressProofUnitNumberChanged event, Emitter<AddressProofState> emit) {
    emit(state.copyWith(unitNumber: event.unitNumber));
  }

  _onAddressProofResidentChanged(
      AddressProofResidentialChanged event, Emitter<AddressProofState> emit) {
    emit(state.copyWith(residentialAddress: event.residentialAddress));
  }

  _onAddressProofCityChanged(
      AddressProofCityChanged event, Emitter<AddressProofState> emit) {
    emit(state.copyWith(city: event.city));
  }

  _onAddressProofCountryChanged(
      AddressProofCountryChanged event, Emitter<AddressProofState> emit) {
    emit(state.copyWith(country: event.country));
  }

  _onIsSameMailingAddressChanged(AddressProofIsSameMailingAddressChanged event,
      Emitter<AddressProofState> emit) {
    emit(state.copyWith(isSameMailingAddress: event.isSameMailingAddress));
  }

  _onAddressProofMailUnitNumberChanged(AddressProofMailUnitNumberChanged event,
      Emitter<AddressProofState> emit) {
    emit(state.copyWith(mailUnitNumber: event.mailUnitNumber));
  }

  _onAddressProofMailResidentialAddressChanged(
      AddressProofMailResidentialAddressChanged event,
      Emitter<AddressProofState> emit) {
    emit(state.copyWith(mailResidentialAddress: event.mailResidentialAddress));
  }

  _onAddressProofMailCityChanged(
      AddressProofMailCityChanged event, Emitter<AddressProofState> emit) {
    emit(state.copyWith(mailCity: event.mailCity));
  }

  _onAddressProofMailCountryChanged(
      AddressProofMailCountryChanged event, Emitter<AddressProofState> emit) {
    emit(state.copyWith(mailCountry: event.mailCountry));
  }
}
