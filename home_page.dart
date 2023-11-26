import 'dart:math';

import 'package:flutter/material.dart';

import 'package:mathgame/util/my_button.dart';
import 'results.dart';

import 'const.dart';
import 'dropDownQuestion.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //number pad list
  List <String> numberPad = [
    '7',
    '8',
    '9',
    'C',
    '4',
    '5',
    '6',
    'DEL',
    '1',
    '2',
    '3',
    '=',
    '',
    '0',
    '',
    '-'
  ];

  int A= 1;
  int B= 1;
  int count=0;
  int question=1;
  var rdm = Random();
  String userAnswer ='';

  int ques = levels.first.getQuestion();
  Question Q = levels.first;

  String message(){
    switch(count) {
      case 0:
        return 'Answer 5 in a row to complete \na level';
        break;
      case 1:
      case 2:
      case 3:
      case 4:
        return 'you solved $count right question';
        break;
    }
    return '';
  }

  void updateLevel (Question Q) {
    setState(() {
      this.Q = Q;
      question= Q.getQuestion();
    });
  }

  String SQuestion () {
    question = Q.getQuestion();
    return textQuestion();
  }

  void buttonTapped(String button){
    setState(() {
      if (button == '='){
        checkResult();
      }
      else
        if(button=='C'){
        userAnswer='';
        }
        else
          if(button== 'DEL') {
            if (userAnswer.isNotEmpty) {
              userAnswer = userAnswer.substring(0, userAnswer.length-1);
            }
          }
          else
            if(userAnswer.length < 5 ){
              userAnswer += button;
            }
    });
  }

  void checkResult(){
    if (count == 4) {
      finishLevel();
    }
    else
      if (count < 5 ) {
        switch (question) {
          case 1 :
            if (A + B == int.parse(userAnswer)) {
              count++;
              showDialog(context: context, builder: (context) {
                return Center(
                  child: results(
                      message: 'Correct!',
                      onTap: goToNextQuestion,
                      icon: Icons.arrow_forward
                  ),
                );
              });
            }
            else {
              count = 0;
              showDialog(context: context, builder: (context) {
                return Center(
                  child: results(
                      message: 'Incorrect!Try again',
                      onTap: goBackToQuestion,
                      icon: Icons.rotate_left
                  ),
                );
              });
            }
            break;
          case 2 :
            if (A - B == int.parse(userAnswer)) {
              count++;
              showDialog(context: context, builder: (context) {
                return Center(
                  child: results(
                      message: 'Correct!',
                      onTap: goToNextQuestion,
                      icon: Icons.arrow_forward
                  ),
                );
              });
            }
            else {
              count = 0;
              showDialog(context: context, builder: (context) {
                return Center(
                  child: results(
                      message: 'Incorrect!Try again',
                      onTap: goBackToQuestion,
                      icon: Icons.rotate_left
                  ),
                );
              });
            }
            break;
          case 3:
            if (A * B == int.parse(userAnswer)) {
              count++;
              showDialog(context: context, builder: (context) {
                return Center(
                  child: results(
                      message: 'Correct!',
                      onTap: goToNextQuestion,
                      icon: Icons.arrow_forward
                  ),
                );
              });
            }
            else {
              count = 0;
              showDialog(context: context, builder: (context) {
                return Center(
                  child: results(
                      message: 'Incorrect!Try again',
                      onTap: goBackToQuestion,
                      icon: Icons.rotate_left
                  ),
                );
              });
            }
            break;
          case 4 :
            if (pow(A, B) == int.parse(userAnswer)) {
              count++;
              showDialog(context: context, builder: (context) {
                return Center(
                  child: results(
                      message: 'Correct!',
                      onTap: goToNextQuestion,
                      icon: Icons.arrow_forward
                  ),
                );
              });
            }
            else {
              count = 0;
              showDialog(context: context, builder: (context) {
                return Center(
                  child: results(
                      message: 'Incorrect!Try again',
                      onTap: goBackToQuestion,
                      icon: Icons.rotate_left
                  ),
                );
              });
            }
            break;
          case 5:
            if (A * B + (A - B) == int.parse(userAnswer)) {
              count++;
              showDialog(context: context, builder: (context) {
                return Center(
                  child: results(
                      message: 'Correct!',
                      onTap: goToNextQuestion,
                      icon: Icons.arrow_forward
                  ),
                );
              });
            }
            else {
              count = 0;
              showDialog(context: context, builder: (context) {
                return Center(
                  child: results(
                      message: 'Incorrect!Try again',
                      onTap: goBackToQuestion,
                      icon: Icons.rotate_left
                  ),
                );
              });
            }
            break;
        }
      }
  }

  void randomNumber() {
    A = rdm.nextInt(10);
    B = rdm.nextInt(10);
  }

  void goToNextQuestion(){
    Navigator.of(context).pop();

    setState(() {
      userAnswer= '';
    });

    A = randomNumber() as int;
    B = randomNumber() as int;
  }

  void goBackToQuestion(){
    Navigator.of(context).pop();
    setState(() {
      userAnswer='';
    });
  }

  void goBackToQuestion1(){
    count=0;
    question=1;
    Navigator.of(context).pop();

    setState(() {
      userAnswer= '';
    });

    A = randomNumber() as int;
    B = randomNumber() as int;
  }

  String textQuestion () {
    switch (question) {
      case 1:
        return ('$A + $B =');
        break;
      case 2:
        return ('$A - $B =');
        break;
      case 3:
        return ('$A x $B =');
        break;
      case 4:
        return ('$A ^ $B =');
        break;
      case 5:
        return ('$A x $B +(${A-B})=');
        break;

      default :
        'Congrats!';
    }
    return '';
  }

  void finishLevel(){
      if (count == 4 ){
        showDialog(
            context: context,
            builder: (context){
              return Center(
                child: results(
                    message: 'Congrats you have finished 5 in a row! wanna replay?',
                    onTap: goBackToQuestion1,
                    icon: Icons.check
                ),
              );
            }
        );
      }
    }

  @override
  Widget build(BuildContext context) {

    double screenWidth= MediaQuery.of(context).size.width;
   // double screenHeight= MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body:
      Stack(
        children: [
          Image.asset(
              'images.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        Column(
          children: [

            Container(
              height: 220,
              width: screenWidth,
              color: Colors.blueGrey,
              child: Center(
                child: Column(
                children : [
                  SizedBox( height: 20,),
                  Text(
                  'Select question',
                  style: BTextStyle,
                ),
                  const SizedBox(height: 10,),
                  MyDropDownQuestion(
                      updateQuestion: updateLevel,
                  ),
                  SizedBox( height: 10,),
                  Text(
                    message(),
                    style: BTextStyle,
                  ),
                ],
              ),
              ),
            ),

            Expanded(
                child:Container (
                  width: screenWidth,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Text(
                          SQuestion(),
                          style: BTextStyle,
                        ),

                        Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey[400],
                            borderRadius: BorderRadius.circular(4)
                          ),
                          child: Center(
                            child: Text(
                              userAnswer,
                              style: BTextStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ),

            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: GridView.builder(
                  itemCount: numberPad.length,
                    //physics:const NeverScrollableScrollPhysics(),
                    gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                    ),
                    itemBuilder: (context,index) {
                      return MyButton(
                        child: numberPad[index],
                        onTap : () => buttonTapped(numberPad[index]),
                      );
                    },
                ),
              )
            ),

          ],
        ),
        ]
      ),
    );
  }
}
