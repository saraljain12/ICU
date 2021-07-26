//@dart=2.9
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:sms_otp_auto_verify/sms_otp_auto_verify.dart';

class OtpScreen extends StatefulWidget {
  bool _isInit = true;
  var _contact = '';

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String phoneNo;
  String smsOTP;
  String verificationId;
  String errorMessage = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool progress=false;



  @override
  void initState() {
    super.initState();
    _getAppSignature();
    _startListeningSms();
  }
  /// Get signature code
  _getAppSignature() async {
    String signature = await SmsRetrieved.getAppSignature();
    print("App Hash Key:  $signature");
  }

  ///Here ListeningSms
  _startListeningSms() async {
    String otp = await SmsRetrieved.startListeningSms();
    String text = otp.split(" ")[0];
    setState(() {
      if (otp.isNotEmpty || otp != null) {
        setState(() {
          smsOTP = text;
          verifyOtp();
        });
      }
      });
    Fluttertoast.showToast(msg: text);
  }

  //this is method is used to initialize data
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Load data only once after screen load
    if (widget._isInit) {
      widget._contact = '${ModalRoute.of(context).settings.arguments as String}';
      generateOtp(widget._contact);
      widget._isInit = false;
    }
  }

  //dispose controllers
  @override
  void dispose() {
    super.dispose();
  }

  //build method for UI
  @override
  Widget build(BuildContext context) {
    //Getting screen height width
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: (progress)?
          Opacity(
            opacity: 0.5,

            child: Stack(
              children: [
                Container(
                padding: const EdgeInsets.all(16.0),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    const Text(
                      'Verification',
                      style: TextStyle(fontSize: 28, color: Colors.black),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    Text(
                      'Enter A 6 digit number that was sent to ${widget._contact}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontFamily: 'Poppins'
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.04,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: screenWidth > 500 ? screenWidth * 0.2 : 10),
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          // ignore: prefer_const_literals_to_create_immutables
                          boxShadow: [
                            const BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 1.0), //(x,y)
                              blurRadius: 6.0,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(16.0)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: screenWidth * 0.025,top: screenHeight*0.1),
                            child:
                                PinFieldAutoFill(
                                  codeLength: 6,
                                  onCodeChanged:(code){
                                    smsOTP = code;
                                  },
                                  onCodeSubmitted: (code){
                                    smsOTP = code;
                                    verifyOtp();
                                  },
                                ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.04,
                          ),
                          GestureDetector(
                            onTap: () {
                              verifyOtp();
                            },
                            child: Container(
                              margin: const EdgeInsets.all(8),
                              height: 45,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 253, 188, 51),
                                borderRadius: BorderRadius.circular(36),
                              ),
                              alignment: Alignment.center,
                              child: const Text(
                                'Verify',
                                style: TextStyle(color: Colors.black, fontSize: 16.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
                Center(child: CircularProgressIndicator(color: Colors.blue))
            ]),
          ):
          Container(
            padding: const EdgeInsets.all(16.0),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                const Text(
                  'Verification',
                  style: TextStyle(fontSize: 28, color: Colors.black),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Text(
                  'Enter A 6 digit number that was sent to ${widget._contact}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: 'Poppins'
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.04,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: screenWidth > 500 ? screenWidth * 0.2 : 10),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      // ignore: prefer_const_literals_to_create_immutables
                      boxShadow: [
                        const BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(16.0)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: screenWidth * 0.025,top: screenHeight*0.1),
                        child:
                        PinFieldAutoFill(
                          codeLength: 6,
                          onCodeChanged:(code){
                            smsOTP = code;
                          },
                          onCodeSubmitted: (code){
                            smsOTP = code;
                            verifyOtp();
                          },
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.04,
                      ),
                      GestureDetector(
                        onTap: () {
                          verifyOtp();
                        },
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          height: 45,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 253, 188, 51),
                            borderRadius: BorderRadius.circular(36),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            'Verify',
                            style: TextStyle(color: Colors.black, fontSize: 16.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ),
      ),
    );
  }

  //Method for generate otp from firebase
  Future<void> generateOtp(String contact) async {
    final PhoneCodeSent smsOTPSent = (String verId, [int forceCodeResend]) {
      verificationId = verId;
    };
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: contact,
          codeAutoRetrievalTimeout: (String verId) {
            verificationId = verId;
          },
          codeSent: smsOTPSent,
          timeout: const Duration(seconds: 60),
          verificationCompleted: (AuthCredential phoneAuthCredential) async {
            // await _auth.signInWithCredential(phoneAuthCredential);
          },
          verificationFailed: (FirebaseAuthException exception) {
            Navigator.pop(context, exception.message);
          });
      // await SmsAutoFill().listenForCode;
      // final signature=await SmsAutoFill().getAppSignature;
    } catch (e) {
      switch (e.code) {
        case 'ERROR_INVALID_VERIFICATION_CODE':
          FocusScope.of(context).requestFocus(FocusNode());
          setState(() {
            errorMessage = 'Invalid Code';
          });
          showAlertDialog(context, 'Invalid Code');
          break;
        default:
          showAlertDialog(context, e.message);
          break;
      }
     Navigator.pop(context, (e as PlatformException).message);
    }
  }

  //Method for verify otp entered by user
  Future<void> verifyOtp() async {
    setState(() {
      progress = true;
    });
    if (smsOTP == null || smsOTP == '') {
      setState(() {
        progress = false;
      });

      showAlertDialog(context, 'please enter 6 digit otp');
      return;
    }
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsOTP,
      );
      final UserCredential user = await _auth.signInWithCredential(credential);
      String number = FirebaseAuth.instance.currentUser.phoneNumber;
      //data
      Map<String,Object> demodata = {
        "number":number
      };
      //final User currentUser = await _auth.currentUser;
       if (user.additionalUserInfo.isNewUser) {
        if (user != null) {
          await Navigator.pushReplacementNamed(context, '/FormPage',
              arguments: demodata);
        }
      }else {
         if (user != null) {
           Navigator.pushReplacementNamed(context, '/homeScreen');
         }
       }
      // assert(user.user.uid == currentUser.uid);

    } catch (e) {
      setState(() {
        progress = false;
      });
      switch (e.code) {
        case 'ERROR_INVALID_VERIFICATION_CODE':
          FocusScope.of(context).requestFocus(FocusNode());
          setState(() {
            errorMessage = 'Invalid Code';
          });
          showAlertDialog(context, 'Invalid Code');
          break;
        default:
          showAlertDialog(context, e.message);
          break;
      }
    }
  }

  //Basic alert dialogue for alert errors and confirmations
  void showAlertDialog(BuildContext context, String message) {
    // set up the AlertDialog
    final CupertinoAlertDialog alert = CupertinoAlertDialog(
      title: const Text('Error'),
      content: Text('\n$message'),
      actions: <Widget>[
        CupertinoDialogAction(
          isDefaultAction: true,
          child: const Text('Ok'),
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

}
