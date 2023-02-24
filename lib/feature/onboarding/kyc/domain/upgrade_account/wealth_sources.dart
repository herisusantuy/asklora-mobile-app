import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wealth_sources.g.dart';

@JsonSerializable()
class WealthSources extends Equatable {
  @JsonKey(name: 'wealth_source')
  final String? wealthSource;
  final int? percentage;

  const WealthSources({
    this.wealthSource,
    this.percentage,
  });

  factory WealthSources.fromJson(Map<String, dynamic> json) =>
      _$WealthSourcesFromJson(json);

  Map<String, dynamic> toJson() => _$WealthSourcesToJson(this);

  @override
  List<Object> get props => [
        wealthSource ?? '',
        percentage ?? 0,
      ];
}
