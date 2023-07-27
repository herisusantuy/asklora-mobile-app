import 'package:json_annotation/json_annotation.dart';

import '../../domain/validation_enum.dart';

part 'asklora_error.g.dart';

@JsonSerializable()
class AskloraError {
  final String detail;
  final String code;

  AskloraError({this.detail = '', this.code = 'UNKNOWN'});

  AskloraError copyWith({
    String? detail,
    String? code,
  }) {
    return AskloraError(
      detail: detail ?? this.detail,
      code: code ?? this.code,
    );
  }

  ValidationCode get type => ValidationCode.getTypeByCode(code);

  factory AskloraError.fromJson(Map<String, dynamic> json) {
    try {
      return _$AskloraErrorFromJson(json);
    } catch (e) {
      return AskloraError(detail: 'Something went wrong!', code: 'UNKNOWN');
    }
  }

  Map<String, dynamic> toJson() => _$AskloraErrorToJson(this);
}
