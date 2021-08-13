//@dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class genderscreen extends StatefulWidget {
  String appbartitle,heading,fieldname,selected;
  bool showme;
  genderscreen({ this.appbartitle,this.heading,this.fieldname,this.showme,this.selected});

  @override
      _gendersettingsState createState() => _gendersettingsState(appbartitle: appbartitle,heading: heading,fieldname: fieldname,showme:showme,selected:selected);

}
class _gendersettingsState extends State<genderscreen> {
  String appbartitle, heading,fieldname,selected;
  bool showme;

  _gendersettingsState(
      { this.appbartitle, this.heading,this.fieldname,this.showme,this.selected});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            automaticallyImplyLeading: true,
            leading: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.arrow_back_ios, color: Colors.black,)
            ),
            title: Text(heading,
                style: TextStyle(
                  fontFamily: 'Rubik',
                  color: Color(0xff333343),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                )
            ),
          ),

          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 15, top: 10),
                child: Text(heading,
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      color: Color(0xff333343),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 0.16,
                    )
                ),
              ),
              Container(
                child: GestureDetector(
                  onTap: (){setState(() {
                    selected = "Male";
                  });},
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 12,vertical: 10),
                    decoration: new BoxDecoration(
                      border: Border.all(color: selected=="Male"?Color(0xfffd3d6f):Colors.grey,),

                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Text("Male",
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          color: Color(0xff333343),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          letterSpacing: 0.14,
                        )
                    ),
                  ),
                ),
              ),
              Container(
                child: GestureDetector(
                  onTap: (){setState(() {
                    selected = "Female";
                  });},
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 12,vertical: 10),
                    decoration: new BoxDecoration(
                        border: Border.all(color: selected=="Female"?Color(0xfffd3d6f):Colors.grey,),

                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Text("Female",
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          color: Color(0xff333343),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          letterSpacing: 0.14,
                        )
                    ),
                  ),
                ),
              ),
              showme?Container(
                child: GestureDetector(
                  onTap: (){setState(() {
                    selected = "Both";
                  });},
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 12,vertical: 10),
                    decoration: new BoxDecoration(
                        border: Border.all(color: selected=="Both"?Color(0xfffd3d6f):Colors.grey,),

                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Text("Both",
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          color: Color(0xff333343),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          letterSpacing: 0.14,
                        )
                    ),
                  ),
                ),
              ):Container(),

              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: ()=>updatedata(),
                  child: Container(
                    width: 80,
                    decoration: BoxDecoration(color: Colors.pink,borderRadius: BorderRadius.all(Radius.circular(30))),
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    padding: EdgeInsets.symmetric(horizontal: 12,vertical: 7),
                    child: Text("Save",style: TextStyle(color: Colors.white,fontSize: 20),),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }

  updatedata(){
    FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser.uid).set({
      "$fieldname":selected
    }, SetOptions(merge: true)).whenComplete(() => Navigator.pop(context)).onError((error, stackTrace) => Fluttertoast.showToast(msg: error.toString()));
  }

}