import 'package:microproject/multipleChoice.dart';
import 'package:microproject/quiz.dart';
import 'package:microproject/quizzManager.dart';
import 'package:microproject/singleChoice.dart';

void main (){
  // Create a quiz with pre-populated questions
  Quiz programmingQuiz = Quiz('Programming Basics Quiz');

  // Add single choice questions
  programmingQuiz.addQuestion(Singlechoice(
      'What is the main purpose of variables in programming?',
      [
        'To store data and information',
        'To create loops',
        'To print text',
        'To connect to the internet'
      ],
      0));

  programmingQuiz.addQuestion(Singlechoice(
      'Which of these is not a common data type?',
      ['Integer', 'String', 'Window', 'Boolean'],
      2));

  // Add multiple choice questions
  programmingQuiz.addQuestion(MultipleChoice(
      'Which of these are loop types in programming?',
      ['for loop', 'while loop', 'jump loop', 'do-while loop'],
      [0, 1, 3] // Correct answers: for, while, and do-while
      ));

  // Create quiz manager with the pre-populated quiz
  Q manager = Quizzmanager()..quizzes.add(programmingQuiz);
  print('Welcome to the Quiz Management System!');
  manager.showMenus();
}