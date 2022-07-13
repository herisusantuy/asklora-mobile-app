part of 'disclosure_affiliation_bloc.dart';

class DisclosureAffiliationState extends Equatable {
  final bool? isAffiliated;
  final String affiliateCompanyName;
  final String affiliateCompanyAddress;
  final String affiliateCompanyCity;
  final String affiliateCompanyState;
  final String affiliateCompanyCountry;
  final String affiliateCompanyEmail;
  final bool? isSeniorExecutive;
  final String controlledPersonCompanyName;
  final String controlledPersonCompanyAddress;
  final String controlledPersonCompanyCity;
  final String controlledPersonCompanyState;
  final String controlledPersonCompanyCountry;
  final String controlledPersonCompanyEmail;
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
    this.affiliateCompanyName = '',
    this.affiliateCompanyAddress = '',
    this.affiliateCompanyCity = '',
    this.affiliateCompanyState = '',
    this.affiliateCompanyCountry = '',
    this.affiliateCompanyEmail = '',
    this.isSeniorExecutive,
    this.controlledPersonCompanyName = '',
    this.controlledPersonCompanyAddress = '',
    this.controlledPersonCompanyCity = '',
    this.controlledPersonCompanyState = '',
    this.controlledPersonCompanyCountry = '',
    this.controlledPersonCompanyEmail = '',
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
    String? affiliateCompanyName,
    String? affiliateCompanyAddress,
    String? affiliateCompanyCity,
    String? affiliateCompanyState,
    String? affiliateCompanyCountry,
    String? affiliateCompanyEmail,
    bool? isSeniorExecutive,
    String? controlledPersonCompanyName,
    String? controlledPersonCompanyAddress,
    String? controlledPersonCompanyCity,
    String? controlledPersonCompanyState,
    String? controlledPersonCompanyCountry,
    String? controlledPersonCompanyEmail,
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
      affiliateCompanyName: affiliateCompanyName ?? this.affiliateCompanyName,
      affiliateCompanyAddress:
          affiliateCompanyAddress ?? this.affiliateCompanyAddress,
      affiliateCompanyCity: affiliateCompanyCity ?? this.affiliateCompanyCity,
      affiliateCompanyState:
          affiliateCompanyState ?? this.affiliateCompanyState,
      affiliateCompanyCountry:
          affiliateCompanyCountry ?? this.affiliateCompanyCountry,
      affiliateCompanyEmail:
          affiliateCompanyEmail ?? this.affiliateCompanyEmail,
      isSeniorExecutive: isSeniorExecutive ?? this.isSeniorExecutive,
      controlledPersonCompanyName:
          controlledPersonCompanyName ?? this.controlledPersonCompanyName,
      controlledPersonCompanyAddress:
          controlledPersonCompanyAddress ?? this.controlledPersonCompanyAddress,
      controlledPersonCompanyCity:
          controlledPersonCompanyCity ?? this.controlledPersonCompanyCity,
      controlledPersonCompanyState:
          controlledPersonCompanyState ?? this.controlledPersonCompanyState,
      controlledPersonCompanyCountry:
          controlledPersonCompanyCountry ?? this.controlledPersonCompanyCountry,
      controlledPersonCompanyEmail:
          controlledPersonCompanyEmail ?? this.controlledPersonCompanyEmail,
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
        affiliateCompanyName,
        affiliateCompanyAddress,
        affiliateCompanyCity,
        affiliateCompanyState,
        affiliateCompanyCountry,
        affiliateCompanyEmail,
        isSeniorExecutive,
        controlledPersonCompanyName,
        controlledPersonCompanyAddress,
        controlledPersonCompanyCity,
        controlledPersonCompanyState,
        controlledPersonCompanyCountry,
        controlledPersonCompanyEmail,
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
