import 'dart:io';
import 'package:microproject/participant.dart';
import 'package:microproject/question.dart';
import 'package:microproject/quiz.dart';

class Quizzmanager {
  List<Quiz> quizzes = [];
  List<Participant> participants = [];

  String getInput(String prompt) {
    while (true) {
      stdout.write('$prompt: ');
      String? input = stdin.readLineSync()?.trim();
      if (input != null && input.isNotEmpty) return input;
      print('Invalid input. Please try again.');
    }
  }

  int getIntInput(String prompt, int min, int max) {
    while (true) {
      try {
        int value = int.parse(getInput(prompt));
        if (value >= min && value <= max) return value;
        print('Please enter a number between $min and $max');
      } catch (e) {
        print('Please enter a valid number');
      }
    }
  }

  void registerParticipant() {
    String firstName = getInput("Enter your first name");
    String lastName = getInput("Enter your last name");

    try {
      participants.add(Participant(firstName, lastName));
      print('\nParticipant registered successfully!');
    } catch (e) {
      print('Error :${e}');
    }
  }
  void takeQuiz (){
    if (quizzes.isEmpty) {
      print('No quizzes available. Please create a quiz first.');
      return;
    }
    if (participants.isEmpty) {
      print('No participants registered. Please register first.');
      return;
    }
    print('\nAvailable Quizzes:');
    for (int i = 0; i < quizzes.length; i++) {
      print('$i. ${quizzes[i].title}');
    }

    int quizIndex = getIntInput('Select quiz number', 0, quizzes.length - 1);
    Quiz selectedQuiz = quizzes[quizIndex];

    print('\nRegistered Participants:');
    for (int i = 0; i < participants.length; i++) {
      print('$i. ${participants[i].fullName}');
    }

    int participantIndex =
        getIntInput('Select participant number', 0, participants.length - 1);
    Participant selectedParticipant = participants[participantIndex];

    List<List<int>> answers = [];
    for (int i = 0; i < selectedQuiz.questions.length; i++) {
      Question question = selectedQuiz.questions[i];
      print('\nQuestion ${i + 1}: ${question.title}');
      print('Options:');
      for (int j = 0; j < question.options.length; j++) {
        print('$j. ${question.options[j]}');
      }

      if (question.questionType == "SingleChoice") {
        int answer =
            getIntInput('Enter your answer', 0, question.options.length - 1);
        answers.add([answer]);
      } else {
        List<int> multipleAnswers = [];
        while (true) {
          print('\nCurrent answers: $multipleAnswers');
          print('Enter -1 when done');
          int answer =
              getIntInput('Enter an answer', -1, question.options.length - 1);
          if (answer == -1) break;
          if (!multipleAnswers.contains(answer)) {
            multipleAnswers.add(answer);
          }
        }
        answers.add(multipleAnswers);
      }
    }
    try {
      selectedQuiz.submitAnswers(selectedParticipant, answers);
      print('\nQuiz submitted successfully!');
    } catch (e) {
      print('Error submitting quiz: $e');
    }
  }

  void viewResults() {
    if (quizzes.isEmpty) {
      print('No quizzes available.');
      return;
    }

    print('\nAvailable Quizzes:');
    for (int i = 0; i < quizzes.length; i++) {
      print('$i. ${quizzes[i].title}');
    }
    int quizIndex = getIntInput('Select quiz number', 0, quizzes.length - 1);
    quizzes[quizIndex].displayResults();
  }
  void showMenus (){
    while (true) {
      print('\n=== Quiz System ===');
      print('1. Register as Participant');
      print('2. Take Quiz');
      print('3. View Results');
      print('4. Exit');

      int choice = getIntInput('Enter your choice', 1, 4);

      switch (choice) {
        case 1:
          registerParticipant();
          break;
        case 2:
          takeQuiz();
          break;
        case 3:
          viewResults();
          break;
        case 4:
          print('Thank you for using the Quiz System!');
          return;
    }
  }

  }
}
