// @dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:icu/screens/ChatPackage/FirebaseApi.dart';
import 'package:icu/screens/Images/ImageUpload.dart';
import 'package:icu/screens/Settings/Editprofile.dart';
import 'package:icu/screens/home_screen/home_screen.dart';
import 'package:icu/screens/login_screen/login_screen.dart';
import 'package:icu/screens/splash_screen/splash_screen.dart';
import 'screens/login_screen/otp_screen.dart';
import 'package:icu/screens/profileinfo/UserInfo.dart';
import 'package:icu/screens/questions/Questions.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ICU',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Gotham',
        ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        routes: <String, WidgetBuilder>{
          '/DetailsScreen':(BuildContext ctx) => FormPage(),
        '/otpScreen': (BuildContext ctx) => OtpScreen(),
        '/homeScreen': (BuildContext ctx) => HomeScreen(),
        '/FormPage': (BuildContext ctx) => FormPage(),
        '/LoginPage': (BuildContext ctx) => LoginScreen(),
        '/QuestionScreen':(BuildContext ctx)=> Questions(),
          '/ImageScreen':(BuildContext ctx)=>ImageScreen(),
          '/ChatScreen':(BuildContext ctx)=>Chat(),
          '/EditProfileScreen':(BuildContext ctx)=>EditSettings()
    });
  }
}