//@dart=2.9
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gender_selection/gender_selection.dart';
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
    if(_namekey.currentState.validate()&&_emailkey.currentState.validate()&&_numkey.currentState.validate()&&!Selectedgender.isEmpty&&_agekey.currentState.validate()) {
      if (_contactEditingController.text.isEmpty) {
        showErrorDialog(context, 'Contact number can\'t be empty.');
        Fluttertoast.showToast(msg: "UnSuccessful");
      }
      else if (_contactEditingController.text.length<10) {
        showErrorDialog(context, 'Invalid number');
        Fluttertoast.showToast(msg: "UnSuccessful");
      } else {
        Fluttertoast.showToast(msg: "Successful");
        // final responseMessage =
        //     await Navigator.pushNamed(context, '/otpScreen',
        //     arguments: '$_dialCode${_contactEditingController.text}');
        // if (responseMessage != null) {
        //   showErrorDialog(context, responseMessage as String);
        // }
      }

    }else if(Selectedgender.isEmpty){
      Fluttertoast.showToast(msg: "please select gender");
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


  String name,email,phone,age,Selectedgender;

  //TextController to read text entered in text field
  final _contactEditingController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final GlobalKey<FormState> _namekey = GlobalKey<FormState>();
  final GlobalKey<FormState> _emailkey = GlobalKey<FormState>();
  final GlobalKey<FormState> _numkey = GlobalKey<FormState>();
  final GlobalKey<FormState> _agekey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
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
                      validator: (String value){
                        if(value.length<3)
                        {
                          return 'Please Enter valid Name';
                        }
                        return null;
                      },
                      onChanged: (String value){
                        _namekey.currentState.validate();
                      },
                      onSaved: (String value){
                        name = value;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                  child: Form(
                    key: _emailkey,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration:buildInputDecoration(Icons.email,"Email"),
                      validator: (String value){
                        if(!EmailValidator.validate(value)){
                          return "Enter a valid mail";
                        }
                        return null;
                      },
                      onChanged: (String value){
                        _emailkey.currentState.validate();
                      },
                      onSaved: (String value){
                        email = value;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom:15,left: 10,right: 10),
                  child:  Form(
                    key: _agekey,
                    child: TextFormField(
                      validator: (String value){
                        if(int.parse(value)<18) {
                          return 'Please Enter valid Age';
                        }
                        return null;
                      },
                      onChanged: (String value){
                        _agekey.currentState.validate();
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
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                  child: Container(
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
                                validator: (String value){
                                if(value.length!=10) {
                                  return 'Please Enter valid Phone number';
                                }
                                 return null;
                                },
                                onChanged: (String value){
                                  _numkey.currentState.validate();
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
                                controller: _contactEditingController,
                                keyboardType: TextInputType.number,
                                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),LengthLimitingTextInputFormatter(10)],
                              ),
                            ),
                          ),
                          ],
                      ),
                    ),
                  ),
                GenderSelection(
                    maleText: "", //default Male
                    femaleText: "", //default Female
                    selectedGenderIconBackgroundColor: Colors.indigo, // default red
                    checkIconAlignment: Alignment.centerRight,   // default bottomRight
                    selectedGenderCheckIcon: null, // default Icons.check
                    onChanged: (Gender gender){
                      Selectedgender = gender.toString();
                      Selectedgender = Selectedgender.substring(7);
                      Fluttertoast.showToast(msg: Selectedgender);
                    },
                    equallyAligned: true,
                    animationDuration: Duration(milliseconds: 400),
                    isCircular: true, // default : true,
                    isSelectedGenderIconCircular: true,
                    opacityOfGradient: 0.6,
                    padding: const EdgeInsets.all(3),
                    size: 120, //default : 120

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
                // ElevatedButton(),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: RaisedButton(
                    color: Colors.redAccent,
                      onPressed: agree ? _doSomething : null, child: Text('Continue'),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: BorderSide(color: Colors.blue,width: 2)
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
