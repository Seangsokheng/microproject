import 'package:microproject/participant.dart';
import 'package:microproject/question.dart';
import 'package:microproject/result.dart';

class Quiz {
  final String _title;
  List<Question> _question = [];
  Map<Participant, Result> results = {};

  Quiz(this._title) {
    if (title.isEmpty) {
      throw ArgumentError('Quiz title cannot be empty');
    }
  }

  String get title => _title;
  List<Question> get questions => _question;

  void addQuestion(Question question) {
    _question.add(question);
  }

  void submitAnswers(Participant participant, List<List<int>> answers) {
    int score = 0;
    for (int i = 0; i < _question.length; i++) {
      try {
        if (_question[i].isCorrect(answers[i])) {
          score++;
        }
      } catch (e) {
        throw ArgumentError('Invalid answer format for question ${i + 1}');
      }
    }
    results[participant] = Result(participant, score, _question.length);
  }

  void displayResults() {
    print('\nQuiz Results for: $_title');
    print('Total Questions: ${_question.length}\n');

    var sortedResults = results.values.toList()
      ..sort((a, b) => b.score.compareTo(a.score));

    for (var result in sortedResults) {
      print(result);
    }
  }
}
