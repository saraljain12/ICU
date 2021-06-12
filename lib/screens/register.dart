import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'login_screen/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override

    Widget build(BuildContext context) {
      return  Scaffold(
          body:Center(
            child: GestureDetector(
              onTap: () {
                _signOut();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()),);
              },
              child: Container(
                // width: 120,
                margin: EdgeInsets.symmetric(horizontal: 14),
                padding: EdgeInsets.only(
                    left: 12, top: 5, bottom: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(40),
                        left: Radius.circular(40))
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Container(width: 15),
                      Icon(Icons.logout,size: 17,),
                      SizedBox(width: 10),
                      Text("Logout", style: TextStyle(
                          color: Colors.red,
                          fontSize: 17,fontWeight: FontWeight.bold
                      )),
                    ]),
              ),
            ),
          )
      );
    }


  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

}