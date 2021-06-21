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
  @override
  initScreen(BuildContext context) {
    const color3 = const Color(0xFF38BF68);
    return MaterialApp(

        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Balsamiq_Sans'),

        home: Scaffold(
            body: Stack(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: new BoxDecoration(
                      image: new DecorationImage(
                      image: new ExactAssetImage('assets/images/Vr.png'),
                       fit: BoxFit.cover,
                              ),
                      ),
                      child: new BackdropFilter(
                        filter: new ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
                        child: new Container(
                          decoration: new BoxDecoration(color: Color(0xffd8334a).withOpacity(0.0)),
                        ),
                       ),
                      ),
                    Container(
                      child:Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                  height: 100,
                                    decoration: BoxDecoration(
                                        color: Color(0xffd8334a),
                                        shape: BoxShape.circle
                                    ),
                                  ),
                                  Container(
                                    height: 80,
                                    decoration: BoxDecoration(
                                        color: Colors.white70,
                                        shape: BoxShape.circle
                                    ),
                                    child: Image.asset("assets/images/Logo.png",scale: 8,),
                                  ),
                                ],
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                              Text("i choose you",style: TextStyle(fontFamily: 'Kaushan',color: Colors.white,fontSize: 30),),
                              SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                              Text("Let's choose your favourite",style: TextStyle(fontFamily: 'Sanchez',color: Colors.white,fontSize: 18),)
                          ]),
            )
        ])
    )
    );
  }
}






