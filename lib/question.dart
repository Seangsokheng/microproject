abstract class Question {
  final String _title;
  final List<String> _options;
  final List<int> _correctAnswer;

  String get title => _title;
  List<String> get options => _options;
  List<int> get correctAnswer => _correctAnswer;

  Question(this._title, this._options, this._correctAnswer);

  bool isCorrect(List<int> answer);

  String get questionType;
}
