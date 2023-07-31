import 'package:equatable/equatable.dart';

import '../../../../core/domain/ai/component.dart';

class QueryResponse extends Equatable {
  final String response;
  final String? requestId;
  final String? respType;
  final List<Component> components;
  final List<dynamic>? results;
  final bool? newSession;

  const QueryResponse(
      this.response, this.requestId, this.respType, this.newSession,
      {this.components = const [], this.results = const []});

  static fromJson(Map<String, dynamic> json) => QueryResponse(
        json['response'] as String,
        json['request_id'] as String?,
        json['type'] as String?,
        json['new_session'] as bool?,
        results: (json['results'] as List<dynamic>?)?.map((e) => e).toList() ??
            const [],
        components: (json['components'] as List<dynamic>?)?.map((e) {
              if (e['id'] == ComponentType.promptButton.value) {
                return PromptButton(e['id'], e['label']);
              } else {
                return NavigationButton(e['id'], e['label']);
              }
            }).toList() ??
            const [],
      );

  String getResult() {
    if (results != null) {
      if (results is List<String>) {
        return (results as List<String>).join('\n');
      } else if (results is List<dynamic>) {
        return List<String>.from(results as Iterable).join('\n');
      } else {
        return '';
      }
    } else {
      return '';
    }
  }

  @override
  List<Object?> get props =>
      [response, requestId, respType, newSession, components, results];
}
