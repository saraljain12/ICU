//@dart=2.9
import 'package:flutter/material.dart';

class Answer extends StatefulWidget {
  final Function selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  State<Answer> createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  bool changecolor = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: widget.selectHandler,
        //     (){
        //   setState(() {
        //   changecolor = true;
        // });
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(70.0)),
            border: Border.all(
              color: changecolor?Color(0xffff5b60):Color(0xffE7E9EE)
            )
          ),
          child: Text(widget.answerText,style: TextStyle(color: Colors.black,fontSize: 24),textAlign: TextAlign.center,), //RaisedButton
        ),
      ),
    ); //Container
  }
}
