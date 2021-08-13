//@dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:icu/screens/CustomTextField.dart';

class smallsettings extends StatefulWidget {
  String appbartitle,heading,subheading,fieldname;
  bool already;
  bool numboard;

  smallsettings({ this.appbartitle,this.heading,this.subheading,this.already,this.fieldname,this.numboard});

  @override
  _smallsettingsState createState() => _smallsettingsState(appbartitle: appbartitle,heading: heading,subheading: subheading,already: already,fieldname: fieldname,numboard: numboard);

}
class _smallsettingsState extends State<smallsettings> {
  String appbartitle, heading, subheading,fieldname;
  bool already;
  bool numboard;
  TextEditingController _controller = TextEditingController();

  _smallsettingsState(
      { this.appbartitle, this.heading, this.subheading, this.already,this.fieldname,this.numboard});

  @override
  Widget build(BuildContext context) {
    if (already) {
      _controller.text = subheading;
      _controller.selection = TextSelection.fromPosition(TextPosition(offset: _controller.text.length));
    }
    double width = MediaQuery.of(context).size.width;
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
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 2, vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: TextFormField(
                  keyboardType: numboard?TextInputType.number:TextInputType.text,
                  cursorColor: Colors.pink,
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.start,
                  controller: _controller,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 0, horizontal: 15),
                    hintText: already ? "" : subheading,
                    hintStyle: TextStyle(color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      borderSide: BorderSide(
                          color: Colors.pink,
                          width: 0.5
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),
                  ),
                ),
              ),
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
      "$fieldname":(appbartitle=="Age")?int.parse(_controller.text):_controller.text
    }, SetOptions(merge: true)).whenComplete(() => Navigator.pop(context)).onError((error, stackTrace) => Fluttertoast.showToast(msg: error.toString()));
  }
}