import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../core/utils/date_utils.dart';
import '../../../core/utils/extensions.dart';
import '../utils/transaction_history_util.dart';

part 'bot_transaction_history_request.g.dart';

@JsonSerializable()
class BotTransactionHistoryRequest {
  @JsonKey(name: 'transaction_history_type')
  final List<String> status;

  const BotTransactionHistoryRequest({this.status = const []});

  factory BotTransactionHistoryRequest.fromJson(Map<String, dynamic> json) =>
      _$BotTransactionHistoryRequestFromJson(json);

  Map<String, dynamic> toJson() => _$BotTransactionHistoryRequestToJson(this);
}
