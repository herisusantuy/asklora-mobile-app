part of 'risk_disclosure_bloc.dart';

abstract class RiskDisclosureEvent extends Equatable {
  const RiskDisclosureEvent();

  @override
  List<Object> get props => [];
}

class CompanyRiskDisclosureChanged extends RiskDisclosureEvent {
  final bool companyDisclosureAgreementChecked;

  const CompanyRiskDisclosureChanged(this.companyDisclosureAgreementChecked)
      : super();

  @override
  List<Object> get props => [companyDisclosureAgreementChecked];
}
