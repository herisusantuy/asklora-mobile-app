import 'package:json_annotation/json_annotation.dart';

part 'onfido_result_response.g.dart';

@JsonSerializable()
class OnfidoResultResponse {
  String detail;

  OnfidoResultResponse(
    this.detail,
  );

  factory OnfidoResultResponse.fromJson(Map<String, dynamic> json) =>
      _$OnfidoResultResponseFromJson(json);
}
