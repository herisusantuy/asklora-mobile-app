part of 'omni_search_question_widget_bloc.dart';

const List<String> defaultKeywords = [
  'Covid',
  'Inflation',
  'AAPL',
  'Oil',
  'Elon Musk',
  'Burger',
  'Recycle',
];

class OmniSearchQuestionWidgetState extends Equatable {
  final List<String> keywordAnswers;
  final List<String> keywords;
  final bool addKeywordError;
  final String keyword;

  const OmniSearchQuestionWidgetState(
      {this.keyword = '',
      this.keywordAnswers = const [],
      this.keywords = defaultKeywords,
      this.addKeywordError = false})
      : super();

  OmniSearchQuestionWidgetState copyWith(
      {List<String>? keywordAnswers,
      List<String>? keywords,
      bool? addKeywordError,
      String? keyword}) {
    return OmniSearchQuestionWidgetState(
      keywordAnswers: keywordAnswers ?? this.keywordAnswers,
      keywords: keywords ?? this.keywords,
      addKeywordError: addKeywordError ?? this.addKeywordError,
      keyword: keyword ?? this.keyword,
    );
  }

  @override
  List<Object> get props =>
      [keywordAnswers, keywords, addKeywordError, keyword];
}
