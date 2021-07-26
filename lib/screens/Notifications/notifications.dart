//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class notification extends StatefulWidget {
  @override
  _notificationState createState() => _notificationState();

}
class _notificationState extends State<notification> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("Notification",
              style: TextStyle(
                fontFamily: 'Rubik',
                color: Color(0xff333343),
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
              )
          ),
        ),
        body: Container(),
      ),
    );
  }
}