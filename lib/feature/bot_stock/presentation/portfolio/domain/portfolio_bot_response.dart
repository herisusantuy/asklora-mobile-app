import 'package:json_annotation/json_annotation.dart';
import 'portfolio_bot_model.dart';

part 'portfolio_bot_response.g.dart';

@JsonSerializable()
class PortfolioBotResponse {
  final List<PortfolioBotModel> portfolioBots;

  PortfolioBotResponse({
    this.portfolioBots = const [],
  });

  factory PortfolioBotResponse.fromJson(Map<String, dynamic> json) =>
      _$PortfolioBotResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PortfolioBotResponseToJson(this);
}
