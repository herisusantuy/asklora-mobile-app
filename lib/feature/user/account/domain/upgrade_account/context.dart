import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'context.g.dart';

@JsonSerializable()
class Context extends Equatable {
  @JsonKey(name: 'context_type')
  final String? contextType;
  @JsonKey(name: 'company_name')
  final String? companyName;
  @JsonKey(name: 'company_street_address')
  final String? companyStreetAddress;
  @JsonKey(name: 'company_city')
  final String? companyCity;
  @JsonKey(name: 'company_state')
  final String? companyState;
  @JsonKey(name: 'company_country')
  final String? companyCountry;
  @JsonKey(name: 'company_compliance_email')
  final String? companyComplianceEmail;
  @JsonKey(name: 'given_name')
  final String? givenName;
  @JsonKey(name: 'family_name')
  final String? familyName;

  const Context(
      {this.contextType,
      this.companyName,
      this.companyStreetAddress,
      this.companyCity,
      this.companyState,
      this.companyCountry,
      this.companyComplianceEmail,
      this.givenName,
      this.familyName});

  factory Context.fromJson(Map<String, dynamic> json) =>
      _$ContextFromJson(json);

  Map<String, dynamic> toJson() => _$ContextToJson(this);

  Context copyWith(
      {String? contextType,
      String? companyName,
      String? companyStreetAddress,
      String? companyCity,
      String? companyState,
      String? companyCountry,
      String? companyComplianceEmail,
      String? givenName,
      String? familyName}) {
    return Context(
      contextType: contextType ?? this.contextType,
      companyName: companyName ?? this.companyName,
      companyStreetAddress: companyStreetAddress ?? this.companyStreetAddress,
      companyCity: companyCity ?? this.companyCity,
      companyState: companyState ?? this.companyState,
      companyCountry: companyCountry ?? this.companyCountry,
      companyComplianceEmail:
          companyComplianceEmail ?? this.companyComplianceEmail,
      givenName: givenName ?? this.givenName,
      familyName: familyName ?? this.familyName,
    );
  }

  @override
  List<Object> get props => [
        contextType ?? '',
        companyName ?? '',
        companyStreetAddress ?? '',
        companyCity ?? '',
        companyState ?? '',
        companyCountry ?? '',
        companyComplianceEmail ?? '',
        givenName ?? '',
        familyName ?? ''
      ];
}
