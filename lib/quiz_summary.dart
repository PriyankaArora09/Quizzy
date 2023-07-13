import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuizSummary extends StatelessWidget {
  const QuizSummary(this.summaryData, {Key? key}) : super(key: key);

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: summaryData.map((data) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 1),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(500),
                      color: data['chosen_ans'] == data['correct_ans']
                          ? Colors.teal[400]
                          : Colors.deepPurple[300],
                    ),
                    child: Text(
                      ((data['ques_index'] as int) + 1).toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['ques_text'] as String,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              //fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            data['chosen_ans'] as String,
                            style: TextStyle(
                              color: Colors.cyan[100],
                              fontSize: 14,
                              //fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            data['correct_ans'] as String,
                            style: TextStyle(
                              color: Colors.tealAccent[100],
                              fontSize: 14,
                              //fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                         // SizedBox(height: 15,)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
