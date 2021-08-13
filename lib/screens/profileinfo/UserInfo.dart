//@dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:icu/screens/login_screen/widget/Dropdown.dart';
import 'package:icu/screens/login_screen/widget/country_picker.dart';
import 'InputDeco_design.dart';
import 'package:geocoding/geocoding.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  var _dialCode = '';
  bool agree = false;
  Position _currentPosition;
  String city,state;
  double latitude=0,longitude=0;


  void _doSomething(){
    setState(() {
      progress = true;
    });

    if(city==null){
      setState(() {
        progress = false;
      });
      Fluttertoast.showToast(msg: "Please give location access to move further");
      _getCurrentLocation();
    }else {
      Fluttertoast.showToast(msg:"1");
      if (_namekey.currentState.validate() && _agekey.currentState.validate()) {
        if (ismail) {
          if (phone != null) {
            if (phone.length != 10) {
              setState(() {
                progress = false;
              });
              Fluttertoast.showToast(msg: 'Please Enter Valid Phone number');
            } else {
              if (gender == null) {
                setState(() {
                  progress = false;
                });
                Fluttertoast.showToast(msg: "please select gender");
              } else {
                Fluttertoast.showToast(msg: FirebaseAuth.instance.currentUser.uid);
                Fluttertoast.showToast(msg:"$name+$mail+$age+$gender+$phone+$city+$state");
                Map<String, Object> demodata = {
                  "name": name,
                  "email": mail,
                  "age": age,
                  "gender": gender,
                  "number": phone,
                  "city":city,
                  "state":state,
                  "uid":FirebaseAuth.instance.currentUser.uid,
                  "prefageend":99,
                  "prefagestart":18,
                  "prefcity":city
                };
                FirebaseFirestore.instance.collection("Users").doc(
                    FirebaseAuth.instance.currentUser.uid).set(demodata).whenComplete(() {
                  Fluttertoast.showToast(msg: "Successful");
                  Navigator.pushReplacementNamed(context, '/ImageScreen');
                }
                )
                    .onError((error, stackTrace) {setState(() {
                  progress = false;
                });Fluttertoast.showToast(msg: error.toString());});
              }
            }
          }
          else {
            setState(() {
              progress = false;
            });
            Fluttertoast.showToast(msg: 'Please enter phone number');
          }
        }
        else {
          if (_emailkey.currentState.validate()) {
            if (gender == null) {
              setState(() {
                progress = false;
              });
              Fluttertoast.showToast(msg: "please select gender");
            } else {
              Map<String, Object> demodata = {
                "name": name,
                "email": mail,
                "age": age,
                "gender": gender,
                "number": phone,
                "city":city,
                "state":state,
                "uid":FirebaseAuth.instance.currentUser.uid,
                "prefageend":99,
                "prefagestart":18,
                "prefcity":city
              };
              FirebaseFirestore.instance.collection("Users").doc(
                  FirebaseAuth.instance.currentUser.uid).set(demodata).whenComplete(() {
                Fluttertoast.showToast(msg: "Successful");
                Navigator.pushReplacementNamed(context, '/ImageScreen');
              }
              )
                  .onError((error, stackTrace) {setState(() {
                progress = false;
              });Fluttertoast.showToast(msg: error.toString());});
            }
          }
        }
      }
    }
    }


  void _callBackFunction(String name, String dialCode, String flag) {
    _dialCode = dialCode;
  }

  void showErrorDialog(BuildContext context, String message) {
    // set up the AlertDialog
    final CupertinoAlertDialog alert = CupertinoAlertDialog(
      title: const Text('Error'),
      content: Text('\n$message'),
      actions: <Widget>[
        CupertinoDialogAction(
          isDefaultAction: true,
          child: const Text('Yes'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


  String name,phone,gender;
  int age;
  bool ismail;
  String mail;
  bool progress = false;

  final _contactEditingController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final GlobalKey<FormState> _namekey = GlobalKey<FormState>();
  final GlobalKey<FormState> _emailkey = GlobalKey<FormState>();
  final GlobalKey<FormState> _numkey = GlobalKey<FormState>();
  final GlobalKey<FormState> _agekey = GlobalKey<FormState>();
  TextEditingController _emailcontroller;


  @override
  Future<void> initState() {
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    final  Map<String, Object> data = ModalRoute.of(context).settings.arguments;
    String number = "${data['number']}";
    number = number.substring(3);
    String email = "${data['email']}";
    if(email!="null"){
      mail = email;
      ismail = true;
    }
    else{
      ismail = false;
      phone = number;
    }
    final sh = MediaQuery.of(context).size.height;
    final sw = MediaQuery.of(context).size.width;
    final appbarheight = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: SingleChildScrollView(
          child: Stack(
            children: [
              Form(
              key: _formkey,
              onChanged: (){
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: appbarheight
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: sw*0.02777),
                        child: Row(
                          children: [
                            Text("User",style: TextStyle(fontSize: 40,fontFamily: 'Gotham',fontWeight: FontWeight.w400,color: Colors.black),),
                            Container(width: sw*0.02777,),
                            Text("Personal",style: TextStyle(fontSize: 40,fontFamily: 'Gotham',fontWeight: FontWeight.w400,color: Color(0xffE20000)))
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: sw*0.02777),
                          child: Text("Details",style: TextStyle(fontSize: 40,fontFamily: 'Gotham',fontWeight: FontWeight.w400,color: Colors.black)))
                    ],
                  ),// heading
                  SizedBox(
                    height: sh*0.044,
                  ),

                  //NAME
                  Align(
                      alignment:Alignment.centerLeft,
                      child: Container(
                          margin: EdgeInsets.symmetric(horizontal:sw*0.02777 ),
                          child: Text("User name",
                              style: TextStyle(fontSize: 20,fontFamily: 'Rubik',fontWeight: FontWeight.w400,color: Colors.black)
                            )
                      )
                  ),
                  SizedBox(
                    height: sh*0.005,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: sw*0.02777),
                    child: Container(
                      child: Form(
                        key: _namekey,
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          style: TextStyle(fontSize: 20,fontFamily: "Rubik", fontWeight: FontWeight.w400),
                          decoration: buildInputDecoration(Icons.person,"Enter Your Full Name"),
                          inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]')),LengthLimitingTextInputFormatter(30)],
                          validator: (String value){
                            value = value.trim();
                            if(value.length<3)
                            {
                              return 'Please Enter valid Name';
                            }
                            return null;
                          },
                          onChanged: (String value){
                            _namekey.currentState.validate();
                            name=value;
                          },
                          onSaved: (String value){
                            name = value;
                          },
                        ),
                      ),
                    ),
                  ), // name
                  SizedBox(
                    height: sh*0.022,
                  ),

                  //Age
                  Align(
                      alignment:Alignment.centerLeft,
                      child: Container(
                          margin: EdgeInsets.symmetric(horizontal:sw*0.02777 ),
                          child: Text("Age",
                              style: TextStyle(fontSize: 20,fontFamily: 'Rubik',fontWeight: FontWeight.w400,color: Colors.black)
                          )
                      )
                  ),
                  SizedBox(
                    height: sh*0.005,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom:15,left: 10,right: 10),
                    child:  Form(
                      key: _agekey,
                      child: TextFormField(
                        validator: (String value){
                          if(value.isEmpty){
                            return 'Please Enter Age';
                          }
                          else if(int.parse(value)<18) {
                            return 'Please Enter valid Age';
                          }
                          return null;
                        },
                        onChanged: (String value){
                          _agekey.currentState.validate();
                          age = int.parse(value);
                        },
                        onSaved: (String value) {
                          age = int.parse(value);
                        },
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.black
                        ),
                        decoration: buildInputDecoration(Icons.calendar_today_outlined,"Age"),
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),LengthLimitingTextInputFormatter(2)],
                      ),
                    ),
                  ),


                  //EMAIL AND MOBILE NUMBER
                  (!ismail)?Align(
                      alignment:Alignment.centerLeft,
                      child: Container(
                          margin: EdgeInsets.symmetric(horizontal:sw*0.02777 ),
                          child: Text("Email",
                              style: TextStyle(fontSize: 20,fontFamily: 'Rubik',fontWeight: FontWeight.w400,color: Colors.black)
                          )
                      )
                  ):Align(
                      alignment:Alignment.centerLeft,
                      child: Container(
                          margin: EdgeInsets.symmetric(horizontal:sw*0.02777 ),
                          child: Text("Mobile No",
                              style: TextStyle(fontSize: 20,fontFamily: 'Rubik',fontWeight: FontWeight.w400,color: Colors.black)
                          )
                      )
                  ),
                  SizedBox(
                    height: sh*0.005,
                  ),
                  (!ismail)?
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Form(
                      key: _emailkey,
                      child: Container(
                        child: TextFormField(
                          decoration:buildInputDecoration(Icons.email,"Email"),
                          keyboardType: TextInputType.text,
                          style: TextStyle(fontFamily: 'Rubik'),
                          validator: (String value) {
                            if (!EmailValidator.validate(value)) {
                              return "Enter a valid mail";
                            }
                            return null;
                          },
                          onChanged: (String value){
                            _emailkey.currentState.validate();
                            mail = value;
                          },
                          onSaved: (String value){
                            mail = value;
                          },
                        ),
                      )
                  ),
                    )://email
                  Padding(
                    padding: EdgeInsets.only(left: 10,right: 10),
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0),

                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.circular(5)
                        ),

                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CountryPicker(
                                showflag: false,
                                callBackFunction: _callBackFunction,
                                headerText: 'Select Country',
                                headerBackgroundColor: Theme
                                    .of(context)
                                    .primaryColor,
                                headerTextColor: Colors.white,
                                SelectedTextColor: Colors.black,
                              ),
                              Expanded(
                                child: Form(
                                  child: TextFormField(
                                    validator: (String value){
                                    },
                                    onChanged: (String value){
                                      phone = value;
                                    },
                                    onSaved: (String value) {
                                      phone = value;
                                    },
                                    style: TextStyle(
                                        fontFamily: 'Rubik',
                                        color: Colors.black
                                    ),
                                    decoration: InputDecoration(
                                      hintText: "Enter Your Mobile No",hintStyle: TextStyle(fontFamily: 'Rubik',fontWeight: FontWeight.w400,fontSize: 16),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 0.5
                                        ),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 0.5,
                                        ),
                                      ),
                                      enabledBorder:OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 0.5,
                                        ),
                                      ),
                                    ),
                                    // decoration: buildInputDecoration(null,"Enter Your Mobile No"),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),LengthLimitingTextInputFormatter(10)],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ) ,//mobile

                  SizedBox(
                    height: sh*0.022,
                  ),
                  Align(
                      alignment:Alignment.centerLeft,
                      child: Container(
                          margin: EdgeInsets.symmetric(horizontal:sw*0.02777 ),
                          child: Text("Gender",
                              style: TextStyle(fontSize: 20,fontFamily: 'Rubik',fontWeight: FontWeight.w400,color: Colors.black)
                          )
                      )
                  ),
                  SizedBox(
                    height: sh*0.005,
                  ),
                  Container(
                   margin: EdgeInsets.symmetric(horizontal:sw*0.02777),
                    child: AppDropdownInput(
                      hintText: "Gender",

                      options: ["Male", "Female"],
                      value: gender,
                      onChanged: (String value) {
                        setState(() {
                          gender = value;
                          // state.didChange(newValue);
                        });
                      },
                      getLabel: (String value) => value,
                    ),
                  ),

                  SizedBox(
                    height: sh*0.033,
                  ),
                  Row(
                    children: [
                      Material(
                        child: Checkbox(
                          value: agree,
                          onChanged: (value) {
                            setState(() {
                              agree = value;
                            });
                          },
                        ),
                      ),
                      Text(
                        'I have read and accept terms and conditions',
                        style: TextStyle(fontSize: 13),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: agree?(LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Color(0xfffd297b), Color(0xffff655b)])):LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Colors.grey, Colors.grey]) ,

                          boxShadow: [BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),]
                      ),
                      width: 200,
                      height: 50,
                      child:TextButton(
                        onPressed: _doSomething,
                        child: Text('Continue',style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ),
                  Text("$city"+" "+"$state")
                  ],
              ),
            ),
              progress?Container(margin:EdgeInsets.only(top: sh*0.3),child: Center(child: CircularProgressIndicator(color: Colors.redAccent,))):SizedBox(height: 0,width: 0,)
          ]),
        ),
    );
  }

  _getCurrentLocation() async {
    _currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    setState(() {
      latitude = _currentPosition.latitude;
      longitude = _currentPosition.longitude;
    });
    _getAddressFromCoordinates(_currentPosition.latitude, _currentPosition.longitude);
  }
  _getAddressFromCoordinates(double latitude,double longitude) async {
    List<Placemark> newplace = await placemarkFromCoordinates(latitude,longitude);
    Placemark placeMark  = newplace[0];
    setState(() {
      city = placeMark.locality;
      state = placeMark.administrativeArea;
      Fluttertoast.showToast(msg: city);
    });
  }

}
