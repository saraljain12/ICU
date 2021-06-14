//@dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';
import 'package:icu/screens/login_screen/widget/country_picker.dart';
import 'InputDeco_design.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  var _dialCode = '';
  bool agree = false;

  // This function is triggered when the button is clicked
  void _doSomething(){
    if(_namekey.currentState.validate()&&_emailkey.currentState.validate()&&_agekey.currentState.validate()&&_numkey.currentState.validate()) {
    if(stateValue==null){
      Fluttertoast.showToast(msg: "please select state");
    }
    else if(cityValue==null){
      Fluttertoast.showToast(msg: "please select city");
    }
    else if(Selectedgender==null){
      Fluttertoast.showToast(msg: "please select gender");
    }else{
      Map<String,Object> demodata = {
        "name": name,
        "email":mail,
        "age":age,
        "gender":Selectedgender,
        "number": phone,
        "state":stateValue,
        "city":cityValue
      };
      FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser.uid).collection("Information").doc("infor").set(demodata);
      Navigator.pushReplacementNamed(context, '/QuestionScreen');
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


  String name,phone,age,Selectedgender;
  String countryValue;
  String stateValue;
  String cityValue;
  bool ismail;
  String mail;


  //TextController to read text entered in text field
  final _contactEditingController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final GlobalKey<FormState> _namekey = GlobalKey<FormState>();
  final GlobalKey<FormState> _emailkey = GlobalKey<FormState>();
  final GlobalKey<FormState> _numkey = GlobalKey<FormState>();
  final GlobalKey<FormState> _agekey = GlobalKey<FormState>();
  TextEditingController _emailcontroller;


  @override
  Future<void> initState() {
  }

  @override
  Widget build(BuildContext context) {
    final  Map<String, Object> data = ModalRoute.of(context).settings.arguments;
    String number = "${data['number']}";
    number = number.substring(3);
  // Fluttertoast.showToast(msg: number);
    mail = "${data['email']}";
    // Fluttertoast.showToast(msg: mail);
    if(mail!="null"){
      ismail = true;
    }
    else{
      ismail = false;
    }
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            onChanged: (){
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 15,
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom:15,left: 10,right: 10),
                  child: Form(
                    key: _namekey,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: buildInputDecoration(Icons.person,"Full Name"),
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
                ), // name
                Padding(
                  padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                  child: Form(
                    key: _emailkey,
                    child: Container(
                      decoration: ismail?BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        color: Colors.grey[300],
                      ):BoxDecoration(),
                      child: TextFormField(
                        decoration:buildInputDecoration(Icons.email,"Email"),
                        initialValue: ismail?mail:"",

                        keyboardType: TextInputType.text,
                        style: TextStyle(fontFamily: 'Poppins'),
                        enabled: ismail ? false : true,
                        validator: (String value) {
                          if(!ismail)
                          if (!EmailValidator.validate(value)) {
                            return "Enter a valid mail";
                          }

                          return null;
                        },
                        onChanged: (String value){
                          if(!ismail)
                          _emailkey.currentState.validate();
                          mail = value;
                        },
                        onSaved: (String value){
                          if(!ismail)
                          mail = value;
                        },
                      ),
                    )
                ),
          ), // email
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
                        age = value;
                      },
                      onSaved: (String value) {
                        age = value;
                      },
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.black
                      ),
                      decoration: buildInputDecoration(Icons.person,"Age"),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),LengthLimitingTextInputFormatter(2)],
                    ),
                  ),
                ), // age
                Padding(
                  padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                  child: AbsorbPointer(
                  absorbing: ismail? false:true,
                  child: !ismail?Container(
                      // margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0),
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.grey[300]
                      ),
                      foregroundDecoration: BoxDecoration(
                        border: Border.all(color: Colors.grey,),
                        color: Colors.grey,
                        backgroundBlendMode: BlendMode.saturation,
                      ),
                        child: Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CountryPicker(
                              callBackFunction: _callBackFunction,
                              headerText: 'Select Country',
                              headerBackgroundColor: Theme
                                  .of(context)
                                  .primaryColor,
                              headerTextColor: Colors.white,
                            ),
                            SizedBox(
                              width: screenWidth * 0.02,
                            ),
                            Container(width: 1,
                              height: double.infinity,
                              color: Color(0xffF99D90),),
                            SizedBox(
                              width: screenWidth * 0.02,
                            ),
                            Expanded(
                              child: Form(
                                key: _numkey,
                                child: TextFormField(
                                  initialValue: !ismail?number:"",
                                  enabled: !ismail? false:true,
                                  validator: (String value){
                                    if(value.length!=10) {
                                      return 'Please Enter valid Phone number';
                                    }
                                    return null;
                                  },
                                  onChanged: (String value){
                                    _numkey.currentState.validate();
                                    phone = value;
                                  },
                                  onSaved: (String value) {
                                    phone = value;
                                  },
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.black
                                  ),
                                  decoration: InputDecoration(
                                    hintText: 'Contact Number',
                                    hintStyle: TextStyle(fontSize: 15,
                                        color: Colors.black,
                                        fontFamily: 'Poppins'),
                                    border: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    contentPadding: EdgeInsets.only(
                                        bottom: 5),
                                  ),
                                  // controller: _contactEditingController,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),LengthLimitingTextInputFormatter(10)],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ):Container(
                    // margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0),
                    height: 45,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xffF99D90),
                      ),
                    ),

                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CountryPicker(
                          callBackFunction: _callBackFunction,
                          headerText: 'Select Country',
                          headerBackgroundColor: Theme
                              .of(context)
                              .primaryColor,
                          headerTextColor: Colors.white,
                        ),
                        SizedBox(
                          width: screenWidth * 0.02,
                        ),
                        Container(width: 1,
                          height: double.infinity,
                          color: Color(0xffF99D90),),
                        SizedBox(
                          width: screenWidth * 0.02,
                        ),
                        Expanded(
                          child: Form(
                            key: _numkey,
                            child: TextFormField(
                              initialValue: !ismail?number:"",
                              enabled: !ismail? false:true,
                              validator: (String value){
                                if(value.length!=10) {
                                  return 'Please Enter valid Phone number';
                                }
                                return null;
                              },
                              onChanged: (String value){
                                _numkey.currentState.validate();
                                phone = value;
                              },
                              onSaved: (String value) {
                                phone = value;
                              },
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.black
                              ),
                              decoration: InputDecoration(
                                hintText: 'Contact Number',
                                hintStyle: TextStyle(fontSize: 15,
                                    color: Colors.black,
                                    fontFamily: 'Poppins'),
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                    bottom: 5),
                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),LengthLimitingTextInputFormatter(10)],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ) ,
                    ),
                  ), // number

                Container(
                    child: CSCPicker(
                      showStates: true,
                      showCities: true,
                      showCountry: false,

                      ///Enable (get flag with country name) / Disable (Disable flag) / ShowInDropdownOnly (display flag in dropdown only) [OPTIONAL PARAMETER]
                      flagState: CountryFlag.ENABLE,

                      ///Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER] (USE with disabledDropdownDecoration)
                      dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                          border:
                          Border.all(color: Colors.grey.shade300, width: 1)),

                      ///Disabled Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER]  (USE with disabled dropdownDecoration)
                      disabledDropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.grey.shade300,
                          border:
                          Border.all(color: Colors.grey.shade300, width: 1)),

                      ///Default Country
                      defaultCountry: DefaultCountry.India,

                      ///selected item style [OPTIONAL PARAMETER]
                      selectedItemStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),

                      ///DropdownDialog Heading style [OPTIONAL PARAMETER]
                      dropdownHeadingStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),

                      ///DropdownDialog Item style [OPTIONAL PARAMETER]
                      dropdownItemStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),

                      ///Dialog box radius [OPTIONAL PARAMETER]
                      dropdownDialogRadius: 10.0,

                      ///Search bar radius [OPTIONAL PARAMETER]
                      searchBarRadius: 10.0,

                      onCountryChanged: (value) {
                        setState(() {
                          countryValue = value;
                        });
                      },

                      onStateChanged: (value) {
                        setState(() {
                          stateValue = value;
                        });
                      },

                      onCityChanged: (value) {
                        setState(() {
                          cityValue = value;
                        });
                      },
                    ),
                ),// state and city
                GenderPickerWithImage(
            showOtherGender: false,
            verticalAlignedText: true,
             selectedGender: (Selectedgender=="Male")?Gender.Male:(Selectedgender=="Female")?Gender.Female:null,
            selectedGenderTextStyle: TextStyle(
                color: Color(0xFF8b32a8), fontWeight: FontWeight.bold),
            unSelectedGenderTextStyle: TextStyle(
                color: Colors.white, fontWeight: FontWeight.normal),
            onChanged: (Gender gender) {
              Selectedgender = gender.toString();
              Selectedgender = Selectedgender.substring(7);
              //Fluttertoast.showToast(msg: Selectedgender);
            },
            equallyAligned: true,
            animationDuration: Duration(milliseconds: 400),
            isCircular: true,
            // default : true,
            opacityOfGradient: 0.4,
            padding: const EdgeInsets.all(3),
            size: 80, //default : 40
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
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: RaisedButton(
                    color: Colors.redAccent,
                      onPressed: agree ? _doSomething : null,
                    child: Text('Continue'),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: BorderSide(color: Colors.grey,width: 2)
                    ),
                    textColor:Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
