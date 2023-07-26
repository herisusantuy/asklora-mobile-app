import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../../core/domain/ai/component.dart';

part 'query_response.g.dart';

@JsonSerializable()
class QueryResponse extends Equatable {
  final String response;

  @JsonKey(name: 'request_id')
  final String? requestId;
  @JsonKey(name: 'type')
  final String? respType;
  final List<Component> components;

  @JsonKey(name: 'new_session')
  final bool newSession;

  const QueryResponse(
      this.response, this.requestId, this.respType, this.newSession,
      {this.components = const []});

  factory QueryResponse.fromJson(Map<String, dynamic> json) =>
      _$QueryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QueryResponseToJson(this);

  @override
  List<Object?> get props =>
      [response, requestId, respType, newSession, components];
}
