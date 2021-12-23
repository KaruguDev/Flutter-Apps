import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();
void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  //
  List<Icon> scoreKeeper = [];
  int correctAnswersCount = 0;

  void restartQuiz() {
    setState(() {
      quizBrain.restart();
      scoreKeeper.clear();
      correctAnswersCount = 0;
    });
  }

  void checkAnswer(bool userAnswer) {
    Icon passFail;

    setState(() {
      if (quizBrain.getQuestionNumber() + 1 ==
          quizBrain.getQuestionBankSize()) {
        Alert(
          context: context,
          type: AlertType.info,
          title: "Quizzler",
          desc: "You have got $correctAnswersCount questions correct",
          buttons: [
            DialogButton(
              child: Text(
                "TRY AGAIN",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                restartQuiz();
                Navigator.pop(context);
              },
              color: Color.fromRGBO(0, 179, 134, 1.0),
              radius: BorderRadius.circular(0.0),
            ),
            DialogButton(
              child: Text(
                "CLOSE",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              color: Color.fromRGBO(0, 179, 134, 1.0),
              radius: BorderRadius.circular(0.0),
            ),
          ],
        ).show();
      } else {
        if (userAnswer == quizBrain.getQuestionAnswer()) {
          correctAnswersCount++;
          passFail = Icon(
            Icons.check,
            color: Colors.green,
          );
        } else {
          passFail = Icon(
            Icons.clear,
            color: Colors.red,
          );
        }

        scoreKeeper.add(passFail);
        quizBrain.nextQuestion();
      }
    });
  }

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
                quizBrain.getQuestionText(), //The Question
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
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //keep score
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //keep score
                checkAnswer(false);
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
