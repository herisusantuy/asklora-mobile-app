import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_account_response.g.dart';

@JsonSerializable(explicitToJson: true)
class GetAccountResponse extends Equatable {
  final int id;
  final String username;
  final String email;

  const GetAccountResponse(
    this.id,
    this.username,
    this.email,
  );

  factory GetAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAccountResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAccountResponseToJson(this);

  @override
  List<Object?> get props => [];
}
