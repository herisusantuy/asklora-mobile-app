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

class QuestionNo7Changed extends DisclosuresAffiliationEvent {
  final bool isEmployee;
  const QuestionNo7Changed(this.isEmployee) : super();
  @override
  List<Object> get props => [isEmployee];
}
