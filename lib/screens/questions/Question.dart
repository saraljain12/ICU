import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.1),
        child: RichText(
          textAlign: TextAlign.center,
            text: new TextSpan(
                children: [
                  new TextSpan(
                      text: questionText,
                      style: TextStyle(
                        fontFamily: 'Gotham',
                        color: Color(0xff000000),
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                      )
                  ),
                ]
            )
        )
      ),
    ); //Contaier
  }
}
