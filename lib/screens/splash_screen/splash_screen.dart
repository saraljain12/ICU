//@dart=2.9
import 'dart:async';
import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icu/screens/home_screen/home_screen.dart';
import 'package:icu/screens/login_screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashState();
  }
}

class SplashState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
  }
  startTime() async {
    var duration = new Duration(seconds: 3);
    return new Timer(duration, route);
  }
  route() {
    User user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
    else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }
  Widget Title = new Container(
    padding: EdgeInsets.symmetric(horizontal: 20,),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Splash",
          style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 60
          ),
        ),
        Text(
          "Screen",
          style: TextStyle(
              color: Colors.yellow,
              fontWeight: FontWeight.bold,
              fontSize: 60
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.circle,
              color: Colors.black87,
              size: 15.0,
            ),
            new SizedBox(
              width: 70.0,
              child: new Center(
                child: new Container(
                  margin: new EdgeInsetsDirectional.only(
                      start: 10.0, end: 10.0),
                  height: 2.0,
                  color: Colors.yellow,
                ),
              ),
            ),

            Icon(
              Icons.circle,
              color: Colors.black,
              size: 15.0,
            )
          ],
        ),
        SizedBox(height: 5,),
        CircularProgressIndicator(color: Colors.black,)
      ],
    ),
  );
  Widget text(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Welcome to",
            style: TextStyle(
                color: Colors.white60,
                fontSize: 25
            ),
          ),
          Text(
            "Grocery App",
            style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.bold,
                fontSize: 25
            ),
          ),
        ],
      ),
    );
  }
  @override
  initScreen(BuildContext context) {
    const color3 = const Color(0xFF38BF68);
    return MaterialApp(

        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Balsamiq_Sans'),
        home: Scaffold(
            body: Container(
              child: ListView(
                  children: [
                    Center(child: Title),
                    Container(
                      height: 130,
                    ),
                    text(context)
                  ]),
            )
        )
    );
  }
}






