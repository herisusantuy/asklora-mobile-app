part of 'omni_search_question_widget_bloc.dart';

class OmniSearchQuestionWidgetState extends Equatable {
  final List<String> keywordAnswers;
  final List<String> keywords;
  final bool addKeywordError;

  const OmniSearchQuestionWidgetState(
      {this.keywordAnswers = const [],
      this.keywords = const [
        'Covid',
        'Inflation',
        'AAPL',
        'Oil',
        'Elon Musk',
        'Burger',
        'Recycle',
      ],
      this.addKeywordError = false})
      : super();

  OmniSearchQuestionWidgetState copyWith(
      {List<String>? keywordAnswers,
      List<String>? keywords,
      bool? addKeywordError}) {
    return OmniSearchQuestionWidgetState(
        keywordAnswers: keywordAnswers ?? this.keywordAnswers,
        keywords: keywords ?? this.keywords,
        addKeywordError: addKeywordError ?? this.addKeywordError);
  }

  @override
  List<Object> get props => [keywordAnswers, keywords, addKeywordError];
}
