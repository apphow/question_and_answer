import 'package:flutter/material.dart';
// import question.dart file here
import 'question.dart';

void main() {
  runApp(Questions());
}

class Questions extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade700,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuestionPage(),
          ),
        ),
      ),
    );
  }
}

class QuestionPage extends StatefulWidget {
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  List<Widget> runningScore = [];

  // answer index will correspond with the question index

  // Create the new question object from question.dart constructor

  List<Question> questionList = [
    Question(q: 'A cow can be lead down stairs but not up stairs?', a: false),
    Question(
        q: 'Approximately one quarter of human bones are in the feet.',
        a: true),
    Question(q: 'A slug\'s blood is green.', a: true),
  ];

  // this variable will track where we are in the question list, starting
  // from 0, and our Text widgets below will call the question,
  // and advance to the next question
  int questionNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                //the text displayed comes from the list of questions
                // at this index [questionNumber]
                questionList[questionNumber].questionText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                // use setState to update question number and to update
                // the screen when the user presses true of false button
                bool correctAnswer =
                    questionList[questionNumber].questionAnswer;
                if (correctAnswer == true) {
                  print("Yep, that's right!");
                } else {
                  print("Oops, wrong answer!");
                }
                setState(
                  () {
                    questionNumber++;
                  },
                );
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                bool correctAnswer =
                    questionList[questionNumber].questionAnswer;
                if (correctAnswer == false) {
                  print("That's correct! You're smart!");
                } else {
                  print("I'm sorry, that's not the right answer!");
                }
                setState(
                  () {
                    questionNumber++;
                  },
                );
              },
            ),
          ),
        ),
        Row(
          children: runningScore,
        ),
      ],
    );
  }
}
