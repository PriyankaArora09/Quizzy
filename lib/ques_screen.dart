import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizzy/ans_button.dart';
import 'package:quizzy/questions.dart';

class QuesScreen extends StatefulWidget {
  const QuesScreen({Key? key, required this.onSelectedAns}) : super(key: key);

  final void Function(String options) onSelectedAns;

  @override
  State<QuesScreen> createState() => _QuesScreenState();
}

class _QuesScreenState extends State<QuesScreen> {

  var currentQuesIndex = 0;
  void ansQues(String selectedAns){
    widget.onSelectedAns(selectedAns);
    setState(() {
      currentQuesIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQues = questions[currentQuesIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQues.ques,
              style: const TextStyle(
                height: 1.5,
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            ...currentQues.getShuffledAns().map(
              (options) => Padding(
                padding: const EdgeInsets.all(2.5),
                child: AnswerButton(
                  ansText: options,
                  onTap: (){
                    ansQues(options);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
