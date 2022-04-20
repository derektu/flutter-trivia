import 'package:flutter/material.dart';

void main() {
  runApp(const TriviaApp());
}

class TriviaApp extends StatelessWidget {
  const TriviaApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Trivia',
      home: TriviaMainScreen(),
    );
  }
}

class ScoreBoard extends StatelessWidget {
  const ScoreBoard({Key? key, required this.answers}) : super(key: key);

  final List<bool> answers;

  // TODO: need to handle too many answers (overflow)
  //
  List<Widget> renderAnswers() {
    return answers
        .map((answer) => Icon(
              answer ? Icons.check : Icons.close,
              color: answer ? Colors.green : Colors.red,
              size: 24,
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: renderAnswers(),
    );
  }
}

class TriviaMainScreen extends StatelessWidget {
  const TriviaMainScreen({Key? key}) : super(key: key);

  Widget renderTriviaQuestion(String question) {
    return Text(
      question,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 24,
      ),
    );
  }

  Widget renderTrueFalseButton(bool trueOrFalse) {
    return TextButton(
      onPressed: () {
        // TODO
        print('Button[$trueOrFalse] pressed');
      },
      style: TextButton.styleFrom(
        backgroundColor: trueOrFalse ? Colors.green : Colors.red,
      ),
      child: Text(
        trueOrFalse ? 'True' : 'False',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 28,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: renderTriviaQuestion('This is where the trivia question is displayed'),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                child: renderTrueFalseButton(true),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                child: renderTrueFalseButton(false),
              ),
              const SizedBox(height: 12),
              const Padding(
                padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                child: ScoreBoard(answers: [true, false]),
              ),
            ],
          ),
        ));
  }
}
