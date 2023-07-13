import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonScreen extends StatelessWidget {
  const CommonScreen(this.startQuiz, {Key? key}) : super(key: key);
   final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'images/quiz-logo.png',
            width: 300,
            color: Colors.pink.shade100,
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            'Lets learn flutter the new way!!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22.5,
              //fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: BorderSide(
                color: Colors.pink.shade200,
                width: 2,
              ),
              textStyle: TextStyle(
                fontSize: 19,
              ),
            ),
            icon: Icon(Icons.arrow_right_alt),
            label: Text(
              'Start Quiz',
            ),
          ),
        ],
      ),
    );
  }
}
