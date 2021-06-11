//@dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:icu/screens/login_screen/login_screen.dart';
import 'package:icu/screens/questions/Questions.dart';
import 'package:icu/screens/register.dart';

import '../../main.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Questions()
      // Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text(
      //       'Home',
      //       style: TextStyle(fontSize: 20.0),
      //     ),
      //       TextButton(onPressed: (){
      //           _signOut();
      //
      //       }, child: Text("Sign Out"))
      //   ]
      //   ),
      // )
    );
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
        LoginScreen()),);
  }
}
