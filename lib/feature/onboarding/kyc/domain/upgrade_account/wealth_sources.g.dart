// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wealth_sources.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WealthSources _$WealthSourcesFromJson(Map<String, dynamic> json) =>
    WealthSources(
      wealthSource: json['wealth_source'] as String?,
      percentage: json['percentage'] as int?,
    );

Map<String, dynamic> _$WealthSourcesToJson(WealthSources instance) =>
    <String, dynamic>{
      'wealth_source': instance.wealthSource,
      'percentage': instance.percentage,
    };
