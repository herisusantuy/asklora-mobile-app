import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'trusted_contact.g.dart';

@JsonSerializable()
class TrustedContact extends Equatable {
  @JsonKey(name: 'given_name')
  String? givenName;

  @JsonKey(name: 'family_name')
  String? familyName;

  String? email;

  String? phone;

  TrustedContact({this.givenName, this.familyName, this.email, this.phone});

  factory TrustedContact.fromJson(Map<String, dynamic> json) =>
      _$TrustedContactFromJson(json);

  Map<String, dynamic> toJson() => _$TrustedContactToJson(this);

  @override
  List<Object> get props =>
      [givenName ?? '', familyName ?? '', email ?? '', phone ?? ''];
}
