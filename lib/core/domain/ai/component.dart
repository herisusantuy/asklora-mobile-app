import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'component.g.dart';

enum ComponentType {
  promptButton('prompt_btn'),
  navigationButton('nav_btn');

  final String value;

  const ComponentType(this.value);

  static ComponentType findByString(String aiComponentTypeString) =>
      ComponentType.values
          .firstWhere((element) => element.value == aiComponentTypeString);
}

@JsonSerializable()
class Component extends Equatable {
  final String id;
  final String label;

  const Component(this.id, this.label);

  get type => ComponentType.findByString(id);

  factory Component.fromJson(Map<String, dynamic> json) =>
      _$ComponentFromJson(json);

  Map<String, dynamic> toJson() => _$ComponentToJson(this);

  @override
  List<Object?> get props => [type];
}
