import 'package:microproject/question.dart';

class MultipleChoice extends Question {
  MultipleChoice(String title, List<String> options, List<int> correctAnswer)
      : super(title, options, correctAnswer);

  @override
  bool isCorrect(List<int> answer) {
    var answerSet = answer.toSet();
    var correctAnswerSet = correctAnswer.toSet();
    return answer.length == answerSet.length &&
        answerSet.containsAll(correctAnswerSet) &&
        correctAnswerSet.containsAll(answerSet);
  }

  @override
  String get questionType => 'MultipleChoice';
}
