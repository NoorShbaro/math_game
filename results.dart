import 'package:flutter/material.dart';

import 'const.dart';

class results extends StatelessWidget {

  final String message;
  final VoidCallback onTap;
  final icon;

  const results({
    super.key,
    required this.message,
    required this.onTap,
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blueGrey,
      content: Container(
        height: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              message,
              style: BTextStyle,
            ),

            SizedBox(height: 20,),

            GestureDetector(
              onTap: onTap,
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.blueGrey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon (
                  icon,
                  color: Colors.black38,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
