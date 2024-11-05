import 'package:microproject/participant.dart';

class Result {
  final Participant _participant;
  final int _score;
  final int _totalQuestions;

  Result(this._participant, this._score, this._totalQuestions);

  double get percentageScore => (_score / _totalQuestions) * 100;
  int get score => _score;
  
  @override
  String toString() =>
      '${_participant.fullName}: $_score/$_totalQuestions (${percentageScore.toStringAsFixed(1)}%)';
}
