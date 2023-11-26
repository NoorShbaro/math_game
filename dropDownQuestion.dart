import 'package:flutter/material.dart';
import 'package:mathgame/const.dart';
import 'const.dart';

class Question {
  int question;
  String Qquestion;
  Question(this.question, this.Qquestion);

  @override
  String toString() {
    return 'Question $question: $Qquestion';
  }

  int getQuestion(){
    return this.question;
  }
}

List <Question> levels =[
  Question(1, 'A + B'),
  Question(2, 'A - B'),
  Question(3, 'A x B'),
  Question(4, 'A ^ B'),
  Question(5, 'A x B+ (C)'),
];

class MyDropDownQuestion extends StatefulWidget {

  final Function (Question) updateQuestion;

  const MyDropDownQuestion({super.key, required this.updateQuestion});

  @override
  State<MyDropDownQuestion> createState() => _MyDropDownQuestionState();
}

class _MyDropDownQuestionState extends State<MyDropDownQuestion> {

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      width: 200,
        initialSelection: levels[0],

        onSelected: (level) {
        setState(() {
          widget.updateQuestion (level as Question);
        });
        },
        dropdownMenuEntries: levels.map<DropdownMenuEntry<Question>>((Question question) {
          return DropdownMenuEntry(
              value: question, label: question.toString(),
          );
        }
        ).toList(),
    );
  }
}
