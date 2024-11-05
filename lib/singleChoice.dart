import 'package:microproject/question.dart';

class Singlechoice extends Question {
  Singlechoice(String title, List<String> options, int correctAnswer)
      : super(title, options, [correctAnswer]);

  @override
  bool isCorrect(List<int> answer) {
    if (answer.length != 1) {
      return false; // Single choice must have exactly one answer
    }
    return answer[0] == correctAnswer[0];
  }

  @override
  String get questionType => 'SingleChoice';
}
