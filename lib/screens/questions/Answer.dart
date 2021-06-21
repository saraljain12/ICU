//@dart=2.9
import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(70.0)),
          color: Colors.blue,
          border: Border.all(
            color: Colors.blue
          )
        ),
        child: TextButton(
          child: Text(answerText,style: TextStyle(color: Colors.white,fontSize: 16),),
          onPressed: selectHandler,
        ), //RaisedButton
      ),
    ); //Container
  }
}
