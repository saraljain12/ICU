import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

InputDecoration buildInputDecoration(IconData icons,String hinttext) {
  return InputDecoration(
    hintText: hinttext,hintStyle: TextStyle(fontFamily: 'Rubik',fontWeight: FontWeight.w400,fontSize: 16),
      prefixIcon: Icon(icons),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
          color: Colors.blue,
          width: 0.5
      ),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
        width: 0.5,
      ),
    ),
    enabledBorder:OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
        width: 0.5,
      ),
    ),
  );
}