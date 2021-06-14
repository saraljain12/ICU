// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:icu/screens/login_screen/widget/country_picker.dart';
import 'package:icu/screens/login_screen/widget/custom_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn GoogleSignIN = GoogleSignIn();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _contactEditingController = TextEditingController();
  var _dialCode = '';
  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose(){
    super.dispose();
  }

  //Login click with contact number validation
  Future<void> clickOnLogin(BuildContext context) async {
    if (_contactEditingController.text.isEmpty) {
      showErrorDialog(context, 'Contact number can\'t be empty.');
    }
    else if (_contactEditingController.text.length<10) {
      showErrorDialog(context, 'Invalid number');
    } else {
      final responseMessage =
      await Navigator.pushNamed(context, '/otpScreen',
          arguments: '$_dialCode${_contactEditingController.text}');
      if (responseMessage != null) {
        showErrorDialog(context, responseMessage as String);
      }
    }
  }

  //callback function of country picker
  void _callBackFunction(String name, String dialCode, String flag) {
    _dialCode = dialCode;
  }

  //Alert dialogue to show error and response
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

  //build method for UI Representation
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
      key: _scaffoldKey,
      body: Stack(
          children: <Widget>[
            Image.asset(
              "assets/images/BackImage.png",
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              fit: BoxFit.cover,
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.all(Radius.circular(30))
                          ),
                          child: Image.asset(
                            'assets/images/Logo.jpeg',
                            height: screenHeight * 0.3,
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.04,
                        ),
                        const Text(
                          'ICU',
                          style: TextStyle(fontSize: 50, color: Colors.white),
                        ),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        const Text(
                          'I choose you,',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 21,
                            fontFamily: 'Gotham',
                            fontWeight: FontWeight.w400,
                            color: Colors.white70,
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.005,
                        ),
                        const Text(
                          'Lets choose your Favorite',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 21,
                            fontFamily: 'Gotham',
                            fontWeight: FontWeight.w400,
                            color: Colors.white70,
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.04,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: screenWidth > 600
                                  ? screenWidth * 0.2
                                  : 16),
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Mobile Number',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
                                  color: Colors.white70,
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Container(
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
                                      child: TextField(
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Colors.white
                                        ),
                                        decoration: InputDecoration(
                                          hintText: 'Contact Number',
                                          hintStyle: TextStyle(fontSize: 15,
                                              color: Colors.white70,
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
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              CustomButton(clickOnLogin),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.005,
                        ),
                        const Text(
                          'or',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 21,
                            fontFamily: 'Gotham',
                            fontWeight: FontWeight.w400,
                            color: Colors.white70,
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.05,
                        ),
                        GestureDetector(
                          onTap:(){
                            signInWithGoogle();

                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,

                              children: [
                                Image.asset(
                                  'assets/images/Google.png',
                                  scale: 20,
                                  fit: BoxFit.contain,
                                ),
                                Container(width: 10),
                                Container(
                                  margin: EdgeInsets.only(top: 5),
                                  child: Text(
                                    "Login with Google",
                                    style: TextStyle(
                                        color: Color(0xffF99D90)
                                        , fontSize: 20
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ]
      ),
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    try {
      FirebaseAuth _auth = FirebaseAuth.instance;
      final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = await googleUser
          .authentication;

      // Create a new credential
      final GoogleAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential authResult =
        await _auth.signInWithCredential(credential);
      final User user = authResult.user;
      String email = FirebaseAuth.instance.currentUser.email;
      Map<String,Object> demodata = {
        "email":email
      };

      ///Her to check isNewUser OR Not
      if (authResult.additionalUserInfo.isNewUser) {
        if (user != null) {
          await Navigator.pushReplacementNamed(context, '/FormPage',
              arguments: demodata);
        }

      }
      else {
        if (user != null) {
          await Navigator.pushReplacementNamed(context, '/homeScreen');
        }
      }
      CircularProgressIndicator(color: Colors.black,);


      return await FirebaseAuth.instance.signInWithCredential(credential);
    }
    catch(e){
      Fluttertoast.showToast(msg: e.toString());
    }
  }

}
