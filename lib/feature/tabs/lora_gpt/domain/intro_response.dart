import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'intro_response.g.dart';

@JsonSerializable()
class IntroResponse extends Equatable {
  final List<String> result;
  final String type;

  const IntroResponse(this.result, this.type);

  factory IntroResponse.fromJson(Map<String, dynamic> json) =>
      _$IntroResponseFromJson(json);

  Map<String, dynamic> toJson() => _$IntroResponseToJson(this);

  String getResult() {
    return result.join('\n');
  }

  @override
  List<Object?> get props => [result, type];
}
