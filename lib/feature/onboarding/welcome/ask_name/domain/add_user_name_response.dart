import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_user_name_response.g.dart';

@JsonSerializable()
class AddUserNameResponse extends Equatable {
  final String created;
  final String updated;
  final String name;

  @JsonKey(name: 'account_id')
  final String accountId;

  const AddUserNameResponse(
      this.created, this.updated, this.name, this.accountId);

  @override
  List<Object?> get props => [created, updated, name, accountId];

  factory AddUserNameResponse.fromJson(Map<String, dynamic> json) =>
      _$AddUserNameResponseFromJson(json);
}
