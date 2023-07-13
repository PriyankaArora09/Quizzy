import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizzy/questions.dart';
import 'package:quizzy/quiz_summary.dart';
import 'package:quizzy/quiz.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key, required this.chosenAns, required this.onRestart}) : super(key: key);

  final List<String> chosenAns;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (int i = 0; i < chosenAns.length; i++) {
      summary.add({
        'ques_index': i,
        'ques_text': questions[i].ques,
        'correct_ans': questions[i].answers[0],
        'chosen_ans': chosenAns[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totalQues = questions.length;
    final correctAns = summaryData.where((data) {
      return data['chosen_ans'] == data['correct_ans'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have answered $correctAns out of $totalQues questions coreectly!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            QuizSummary(summaryData),
            TextButton.icon(
              icon: Icon(Icons.restart_alt),
              onPressed: onRestart,
              label: Text('Restart Quiz',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
