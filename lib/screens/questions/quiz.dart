//@dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import './Answer.dart';
import './Question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz({
    @required this.questions,
    @required this.answerQuestion,
    @required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1,bottom: MediaQuery.of(context).size.height*0.03),
              width: 44,
              height: 44,
              child: SvgPicture.asset(
                "assets/icons/search.svg",color: Color(0xffff5b60),
              )
          ),
          Question(
            questions[questionIndex]['questionText'],
          ), //Question
          ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
              .map((answer) {
            return Answer(() => answerQuestion(answer['text']), answer['text']);
          }).toList()
        ],
    ); //Column
  }
}
