// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortfolioResponse _$PortfolioResponseFromJson(Map<String, dynamic> json) =>
    PortfolioResponse(
      totalPortfolio: (json['totalPortfolio'] as num?)?.toDouble() ?? 0,
      withdrawableAmount: (json['withdrawableAmount'] as num?)?.toDouble() ?? 0,
      buyingPower: (json['buyingPower'] as num?)?.toDouble() ?? 0,
      totalBotStockValues:
          (json['totalBotStockValues'] as num?)?.toDouble() ?? 0,
      profit: (json['profit'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$PortfolioResponseToJson(PortfolioResponse instance) =>
    <String, dynamic>{
      'totalPortfolio': instance.totalPortfolio,
      'withdrawableAmount': instance.withdrawableAmount,
      'buyingPower': instance.buyingPower,
      'totalBotStockValues': instance.totalBotStockValues,
      'profit': instance.profit,
    };
