import 'package:flutter/material.dart';

import '../const.dart';

class MyButton extends StatelessWidget {

  final String child;
  final VoidCallback onTap;
  var buttonColor=Colors.blueGrey[400];

  MyButton({super.key, required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {

    if (child== 'C') {
      buttonColor= Colors.green[400];
    }
    else
      if(child == 'DEL') {
        buttonColor= Colors.red[400];
      }
      else
        if (child =='=') {
          buttonColor = Colors.blueGrey;
        }

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(

          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: Text(
              child,
              style: BTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
