//@dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:icu/screens/Like/likescreen.dart';
import 'package:icu/screens/Notifications/notifications.dart';
import 'package:icu/screens/Settings/Settings.dart';
import '../ChatPackage/ChatScreen.dart';
import 'package:icu/screens/home_screen/Home.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex=3;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    return  Scaffold(
      body: Center(
        child:(_currentIndex==0)?HomeContent():(_currentIndex==1)?ChatScreen():(_currentIndex==2)?LikeScreen():(_currentIndex==3)?notification():SettingsContent(),
      ),
      bottomNavigationBar: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xfffd297b), Color(0xffff655b)]),
          ),
          child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/icons/home.svg",height: 25,color: (_currentIndex!=0)?Colors.white54:Colors.white,),
                label: 'Home',
                backgroundColor: Colors.transparent
              ),
              BottomNavigationBarItem(
                icon:SvgPicture.asset("assets/icons/chat.svg",height: 25,color: (_currentIndex!=1)?Colors.white54:Colors.white,),
                label: 'Chat',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/icons/like.svg",height: 25,color: (_currentIndex!=2)?Colors.white54:Colors.white,),
                label: 'Like',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/icons/noti.svg",height: 25,color: (_currentIndex!=3)?Colors.white54:Colors.white,),
                label: 'Notifications',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/icons/user.svg",height: 25,color: (_currentIndex!=4)?Colors.white54:Colors.white,),
                label: 'Profile',
              ),
            ],
            currentIndex: _currentIndex,
            onTap: onTabTapped,
            showUnselectedLabels: false,
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            unselectedItemColor: Colors.white54,
            selectedItemColor: Colors.white,
            selectedLabelStyle: TextStyle(color: Colors.white),
          )
      ),
    );
  }
  void onTabTapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }
}
