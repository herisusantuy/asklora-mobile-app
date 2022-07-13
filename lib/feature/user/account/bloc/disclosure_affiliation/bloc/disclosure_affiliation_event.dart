part of 'disclosure_affiliation_bloc.dart';

abstract class DisclosuresAffiliationEvent extends Equatable {
  const DisclosuresAffiliationEvent();

  @override
  List<Object> get props => [];
}

class QuestionNo1Changed extends DisclosuresAffiliationEvent {
  final bool isAffiliated;
  const QuestionNo1Changed(this.isAffiliated) : super();
  @override
  List<Object> get props => [isAffiliated];
}

class AffiliateCompanyNameChanged extends DisclosuresAffiliationEvent {
  final String affiliateCompanyName;
  const AffiliateCompanyNameChanged(this.affiliateCompanyName) : super();
  @override
  List<Object> get props => [affiliateCompanyName];
}

class AffiliateCompanyAddressChanged extends DisclosuresAffiliationEvent {
  final String affiliateCompanyAddress;
  const AffiliateCompanyAddressChanged(this.affiliateCompanyAddress) : super();
  @override
  List<Object> get props => [affiliateCompanyAddress];
}

class AffiliateCompanyCityChanged extends DisclosuresAffiliationEvent {
  final String affiliateCompanyCity;
  const AffiliateCompanyCityChanged(this.affiliateCompanyCity) : super();
  @override
  List<Object> get props => [affiliateCompanyCity];
}

class AffiliateCompanyStateChanged extends DisclosuresAffiliationEvent {
  final String affiliateCompanyState;
  const AffiliateCompanyStateChanged(this.affiliateCompanyState) : super();
  @override
  List<Object> get props => [affiliateCompanyState];
}

class AffiliateCompanyCountryChanged extends DisclosuresAffiliationEvent {
  final String affiliateCompanyCountry;
  const AffiliateCompanyCountryChanged(this.affiliateCompanyCountry) : super();
  @override
  List<Object> get props => [affiliateCompanyCountry];
}

class AffiliateCompanyEmailChanged extends DisclosuresAffiliationEvent {
  final String affiliateCompanyEmail;
  const AffiliateCompanyEmailChanged(this.affiliateCompanyEmail) : super();
  @override
  List<Object> get props => [affiliateCompanyEmail];
}

class QuestionNo2Changed extends DisclosuresAffiliationEvent {
  final bool isSeniorExecutive;
  const QuestionNo2Changed(this.isSeniorExecutive) : super();
  @override
  List<Object> get props => [isSeniorExecutive];
}

class QuestionNo3Changed extends DisclosuresAffiliationEvent {
  final bool isSeniorPolitical;
  const QuestionNo3Changed(this.isSeniorPolitical) : super();
  @override
  List<Object> get props => [isSeniorPolitical];
}

class QuestionNo4Changed extends DisclosuresAffiliationEvent {
  final bool isFamilyMember;
  const QuestionNo4Changed(this.isFamilyMember) : super();
  @override
  List<Object> get props => [isFamilyMember];
}

class QuestionNo5Changed extends DisclosuresAffiliationEvent {
  final bool isAssociates;
  const QuestionNo5Changed(this.isAssociates) : super();
  @override
  List<Object> get props => [isAssociates];
}

class NameOfAffiliatedChanged extends DisclosuresAffiliationEvent {
  final String nameOfAffiliatedPerson;
  const NameOfAffiliatedChanged(this.nameOfAffiliatedPerson) : super();
  @override
  List<Object> get props => [nameOfAffiliatedPerson];
}

class NameOfAffiliatedSubmitted extends DisclosuresAffiliationEvent {
  const NameOfAffiliatedSubmitted() : super();
  @override
  List<Object> get props => [];
}

class QuestionNo6Changed extends DisclosuresAffiliationEvent {
  final bool isOwner;
  const QuestionNo6Changed(this.isOwner) : super();
  @override
  List<Object> get props => [isOwner];
}

class NameOfJointAccountChanged extends DisclosuresAffiliationEvent {
  final String nameOfJointAccount;
  const NameOfJointAccountChanged(this.nameOfJointAccount) : super();
  @override
  List<Object> get props => [nameOfJointAccount];
}

class NameOfJointAccountSubmitted extends DisclosuresAffiliationEvent {
  const NameOfJointAccountSubmitted() : super();
  @override
  List<Object> get props => [];
}

class QuestionNo7Changed extends DisclosuresAffiliationEvent {
  final bool isEmployee;
  const QuestionNo7Changed(this.isEmployee) : super();
  @override
  List<Object> get props => [isEmployee];
}
