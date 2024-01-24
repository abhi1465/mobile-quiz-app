import 'package:animate_gradient/animate_gradient.dart';
import 'package:dice_roll/data/questions.dart';
import 'package:dice_roll/questions_screen.dart';
import 'package:dice_roll/results_screen.dart';
import 'package:dice_roll/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: AnimateGradient(
          primaryBegin: Alignment.topLeft,
          primaryEnd: Alignment.bottomLeft,
          secondaryBegin: Alignment.bottomLeft,
          secondaryEnd: Alignment.topRight,
          primaryColors: const [
            Color.fromARGB(255, 4, 89, 106),
            Color.fromARGB(255, 7, 99, 198),
            Colors.white,
          ],
          secondaryColors: const [
            Colors.white,
            Color.fromARGB(255, 206, 14, 107),
            Color.fromARGB(255, 207, 98, 158),
          ],
          child: screenWidget,
        ),
      ),
    );
  }
}
