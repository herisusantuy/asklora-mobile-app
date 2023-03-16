// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_bot_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortfolioBotResponse _$PortfolioBotResponseFromJson(
        Map<String, dynamic> json) =>
    PortfolioBotResponse(
      portfolioBots: (json['portfolioBots'] as List<dynamic>?)
              ?.map(
                  (e) => PortfolioBotModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$PortfolioBotResponseToJson(
        PortfolioBotResponse instance) =>
    <String, dynamic>{
      'portfolioBots': instance.portfolioBots,
    };
