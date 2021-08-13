//@dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_range_slider/flutter_range_slider.dart' as frs;

class agescreen extends StatefulWidget {
  @override
  _agesettingsState createState() => _agesettingsState();

}
class _agesettingsState extends State<agescreen> {
  int lower,upper;


  getdata() async {
    DocumentReference docref = FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser.uid);
    var docSnapshot = await docref.get();
    if (docSnapshot.exists) {
      setState(() {
        Map<String, dynamic> data = new Map<String, dynamic>();
        data = docSnapshot.data();
        lower = data['prefagestart'];
        upper = data['prefageend'];

      });
    }
  }
  @override
  void initState() {
    getdata();
    super.initState();
  }
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
            title: Text("Age Range",
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
                child: Text("Select Age Range",
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 0.16,
                    )
                ),
              ),
              (upper!=null)?Container(
                margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: frs.RangeSlider(

                  min: 18,
                  max: 99,
                  lowerValue: lower.toDouble(),
                  upperValue: upper.toDouble(),
                  divisions: 81,
                  showValueIndicator: true,
                  valueIndicatorMaxDecimals: 0,
                  onChanged: (double newLowerValue, double newUpperValue) {
                    setState(() {
                      lower = newLowerValue.round();
                      upper = newUpperValue.round();
                    });
                  },
                  onChangeStart: (double startLowerValue, double startUpperValue) {
                    print('Started with values: $startLowerValue and $startUpperValue');
                  },
                  onChangeEnd: (double newLowerValue, double newUpperValue) {
                    print('Ended with values: $newLowerValue and $newUpperValue');
                  },
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
      "prefagestart":lower,
      "prefageend":upper
    }, SetOptions(merge: true)).whenComplete(() => Navigator.pop(context)).onError((error, stackTrace) => Fluttertoast.showToast(msg: error.toString()));
  }

}