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
        margin: EdgeInsets.all(10),
        child: RichText(
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
                  // new TextSpan(
                  //     text: "Dates",
                  //     style: TextStyle(
                  //       fontFamily: 'GothamRounded',
                  //       color: Color(0xffe20000),
                  //       fontSize: 30,
                  //       fontWeight: FontWeight.w500,
                  //       fontStyle: FontStyle.normal,
                  //     )
                  // ),
                  // new TextSpan(
                  //     text: "?",
                  //     style: TextStyle(
                  //       fontFamily: 'GothamRounded',
                  //       color: Color(0xff000000),
                  //       fontSize: 30,
                  //       fontWeight: FontWeight.w500,
                  //       fontStyle: FontStyle.normal,
                  //     )
                  // ),
                ]
            )
        )
      ),
    ); //Contaier
  }
}
