import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'bot_activities_transaction_history_model.dart';
import 'bot_summary_transaction_history_model.dart';

part 'bot_detail_transaction_history_response.g.dart';

@JsonSerializable()
class BotDetailTransactionHistoryResponse extends Equatable {
  final String pk;
  final String ticker;
  @JsonKey(name: 'ticker_name')
  final String tickerName;
  @JsonKey(name: 'bot_id')
  final String botId;
  final String updated;
  @JsonKey(name: 'is_active')
  final bool isActive;
  final String status;
  @JsonKey(name: 'action_status')
  final String? actionStatus;
  @JsonKey(name: 'bot_apps_name')
  final String botAppsName;
  final List<BotSummaryTransactionHistoryModel> summary;
  final List<BotActivitiesTransactionHistoryModel> activities;

  const BotDetailTransactionHistoryResponse(
      this.pk,
      this.ticker,
      this.tickerName,
      this.botId,
      this.updated,
      this.isActive,
      this.status,
      this.actionStatus,
      this.botAppsName,
      this.summary,
      this.activities);

  factory BotDetailTransactionHistoryResponse.fromJson(
          Map<String, dynamic> json) =>
      _$BotDetailTransactionHistoryResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$BotDetailTransactionHistoryResponseToJson(this);

  @override
  List<Object?> get props => [
        pk,
        ticker,
        tickerName,
        botId,
        updated,
        isActive,
        status,
        actionStatus,
        botAppsName,
        summary,
        activities
      ];
}
