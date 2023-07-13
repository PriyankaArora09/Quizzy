import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizzy/ques_screen.dart';
import 'package:quizzy/questions.dart';
import 'package:quizzy/result_screen.dart';

import 'commom_screen.dart';

class Quizzy extends StatefulWidget {
  const Quizzy({Key? key}) : super(key: key);

  @override
  State<Quizzy> createState() => _QuizzyState();
}

class _QuizzyState extends State<Quizzy> {

  List<String> selectedAns = [];

  var activeScreen = 'CommonScreen';

  void switchScreen() {
    setState(() {
      activeScreen = 'QuesScreen';
    });
  }

  void chooseAns(String options){
    selectedAns.add(options);
    if(selectedAns.length == questions.length){
      //selectedAns = [];
      setState(() {
        activeScreen = 'ResultScreen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      activeScreen = 'ques-screen';
    });
    selectedAns = [];
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = CommonScreen(switchScreen);

    if(activeScreen == 'QuesScreen'){
      screenWidget = QuesScreen(onSelectedAns: chooseAns);
    }

    if(activeScreen == 'ResultScreen'){
      screenWidget = ResultScreen(chosenAns: selectedAns,onRestart: restartQuiz);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Colors.pink.shade800,
              Colors.pink.shade700,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
          child: screenWidget,
      ),
      ),
    );
  }
}
