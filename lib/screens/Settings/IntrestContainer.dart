import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Container buildContainer(SvgPicture image,String hinttext,bool selected) {

  return selected?Container(
    height: 28,
    decoration: new BoxDecoration(
      color: Colors.pinkAccent,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [BoxShadow(
          color: Color(0xfffe5662),
          offset: Offset(0,0),
          blurRadius: 3,
          spreadRadius: 0
      ) ],
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(width: 12),
        Container(
          width: 23,
          height: 23,
          child: image,
          color: Colors.white,
        ),
        SizedBox(width: 5),
        Text(hinttext,
            style: TextStyle(
              fontFamily: 'Rubik',
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              letterSpacing: 0.12,
            )
        ),
        SizedBox(width: 9),
      ],
    ),
  ): Container(
      height: 28,
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(
            color: Color(0x21afafaf),
            offset: Offset(0,0),
            blurRadius: 3,
            spreadRadius: 0
        ) ],
      ),
        child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(width: 12),
          Container(
            width: 23,
            height: 23,
            child: image,
        ),
          SizedBox(width: 5),
          Text(hinttext,
            style: TextStyle(
              fontFamily: 'Rubik',
              color: Color(0xffb0b3b6),
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              letterSpacing: 0.12,
            )
        ),
          SizedBox(width: 9),
      ],
    ),
  );
}