part of 'disclosure_affiliation_bloc.dart';

class DisclosureAffiliationState extends Equatable {
  final bool? isAffiliated;
  final bool? isSeniorExecutive;
  final bool? isSeniorPolitical;
  final bool? isFamilyMember;
  final bool? isAssociates;
  final String nameOfAffiliatedPerson;
  final bool isNameOfAffiliatedPersonSubmitted;
  final bool? isOwner;
  final String nameOfJointAccount;
  final bool isNameOfJointAccountSubmitted;
  final bool? isEmployee;
  const DisclosureAffiliationState({
    this.isAffiliated,
    this.isSeniorExecutive,
    this.isSeniorPolitical,
    this.isFamilyMember,
    this.isAssociates,
    this.nameOfAffiliatedPerson = '',
    this.isNameOfAffiliatedPersonSubmitted = false,
    this.isOwner,
    this.nameOfJointAccount = '',
    this.isNameOfJointAccountSubmitted = false,
    this.isEmployee,
  });

  DisclosureAffiliationState copyWith({
    bool? isAffiliated,
    bool? isSeniorExecutive,
    bool? isSeniorPolitical,
    bool? isFamilyMember,
    bool? isAssociates,
    String? nameOfAffiliatedPerson,
    bool? isNameOfAffiliatedPersonSubmitted,
    bool? isOwner,
    String? nameOfJointAccount,
    bool? isNameOfJointAccountSubmitted,
    bool? isEmployee,
  }) {
    return DisclosureAffiliationState(
      isAffiliated: isAffiliated ?? this.isAffiliated,
      isSeniorExecutive: isSeniorExecutive ?? this.isSeniorExecutive,
      isSeniorPolitical: isSeniorPolitical ?? this.isSeniorPolitical,
      isFamilyMember: isFamilyMember ?? this.isFamilyMember,
      isAssociates: isAssociates ?? this.isAssociates,
      nameOfAffiliatedPerson:
          nameOfAffiliatedPerson ?? this.nameOfAffiliatedPerson,
      isNameOfAffiliatedPersonSubmitted: isNameOfAffiliatedPersonSubmitted ??
          this.isNameOfAffiliatedPersonSubmitted,
      isOwner: isOwner ?? this.isOwner,
      nameOfJointAccount: nameOfJointAccount ?? this.nameOfJointAccount,
      isNameOfJointAccountSubmitted:
          isNameOfJointAccountSubmitted ?? this.isNameOfJointAccountSubmitted,
      isEmployee: isEmployee ?? this.isEmployee,
    );
  }

  @override
  List<Object?> get props => [
        isAffiliated,
        isSeniorExecutive,
        isSeniorPolitical,
        isFamilyMember,
        isAssociates,
        nameOfAffiliatedPerson,
        isNameOfAffiliatedPersonSubmitted,
        isOwner,
        nameOfJointAccount,
        isNameOfJointAccountSubmitted,
        isEmployee,
      ];

  bool disabledNextButton() {
    if (isAffiliated != null &&
        isSeniorExecutive != null &&
        isSeniorPolitical != null &&
        isFamilyMember != null &&
        isAssociates != null &&
        isOwner != null &&
        (isEmployee != null && isEmployee != true)) {
      return false;
    }
    return true;
  }
}
