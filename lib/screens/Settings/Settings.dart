//@dart=2.9
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:icu/screens/Settings/FullSettings.dart';

final List<List<String>> imgList = [
  ['assets/icons/Boost.svg',"Boost Your Profile","Make your profile on top in your area","0xffFFFCD0"],
  ['assets/icons/Spotlight.svg',"Buy Unlimited Likes","Get matches faster with unlimited likes","0xffFFF5F8"],
  ['assets/icons/premium.svg',"See Who Likes You","Check who likes you and match immediately","0xfff3f3f3"],
  ['assets/icons/premium.svg',"View Your Intro's","Unlock all your intro's","0xfff3f3f3"],
  ['assets/icons/premium.svg',"Get a Virtual date absolutely free!","All love stories begin with a date,get your's now","0xfff3f3f3"],
];
class SettingsContent extends StatefulWidget {
  @override
  _SettingsContentState createState() => _SettingsContentState();

}
class _SettingsContentState extends State<SettingsContent> {

  String uid = FirebaseAuth.instance.currentUser.uid;
  String url,name,city,state;
  int age;
  int _current = 0;

  DocumentReference docref =  FirebaseFirestore.instance.collection("Users").doc(
      FirebaseAuth.instance.currentUser.uid);

  getimage() async{
    var docSnapshot = await docref.get();
    if (docSnapshot.exists) {
      setState(() {
        Map<String, dynamic> data = docSnapshot.data();
        url = data['image1url'];
        name = data['name'];
        city = data['city'];
        state = data['state'];
        age = data['age'];
      });
    }
  }



  @override
  void initState() {
    getimage();
  }

  @override
  void didChangeDependencies() {
    getimage();
    super.didChangeDependencies();
  }

  Widget toprow(BuildContext context,double width){
    return Container(
      margin: EdgeInsets.only(left: width*0.375,top: 30,right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 20,
            width: width*0.25,
              decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black)
              ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    width: 8,
                    height: 8,
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                        color: Color(0xff6dd400)
                    )
                ),
                Text("Online Now",
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      color: Color(0xffb0b3b6),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 0.12,
                    )
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>
                      FullSettings())).then((value) =>  setState(() {
                getimage();
              }));
            },
            child: Icon(Icons.settings,color: Color(0xffb0b3b6),size: 32),
          )
      ],
      ),
    );
  }
  Widget image(BuildContext context,double width,double height){
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
          width: width*0.688,
          height: height*0.45,
            padding: EdgeInsets.all(3),
            decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Color(0xfffd436c),width: 4)
            ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: (url!=null)?CachedNetworkImage(
              imageUrl:url,
              progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                child: SizedBox(
                  width: 40.0,
                  height: 40.0,
                  child: new CircularProgressIndicator(color: Colors.red,value: downloadProgress.progress,),
                ),
              ),
              errorWidget: (context, url, error) => new Icon(Icons.error),
              fit: BoxFit.cover,
            ):null,
          )
        ),
          Container(
                alignment: Alignment.center,
                  width: 95,
                  height: 19,
                  decoration: new BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xfffd3574),
                          Color(0xfffe5b5f) ],
                        stops: [
                          0,
                          1
                        ],
                        begin: Alignment(-1.00, 0.00),
                        end: Alignment(1.00, -0.00),
                      ),
                  ),
                child: Text("60% Profil complete",
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      color: Color(0xffffffff),
                      fontSize: 9,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )
                ),
              ),
      ]),
        Container(
          margin: EdgeInsets.only(bottom: 30),
          child: Column(
            children: [
              Text("$name, $age",
                  style: TextStyle(
                    fontFamily: 'GothamRounded',
                    color: Color(0xffffffff),
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                  )
              ),
              Text("$city, $state",
                  style: TextStyle(
                    fontFamily: 'GothamRounded',
                    color: Color(0xffffffff),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )
              )
            ],
          ),
        ),
    ]
    );
  }
  Widget Stories(BuildContext context,double screenwidth){
    return Container(
      child: SizedBox(
        // height: 75,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // itemExtent: screenwidth/4,
          // padding: EdgeInsets.only(left: 3,right: 2),
          // scrollDirection: Axis.horizontal,
          children: <Widget>[
            Column(
              children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: 44,
                    child: Column(
                        children: [
                          GestureDetector(
                            child: Container(
                                width: 44,
                                height: 44,
                                decoration: new BoxDecoration(
                                    boxShadow: [BoxShadow(
                                        color: Color(0x29000000),
                                        offset: Offset(0,3),
                                        blurRadius: 6,
                                        spreadRadius: 0
                                    ) ],
                                    shape: BoxShape.circle
                                ),
                                child: SvgPicture.asset(
                                  "assets/icons/Spotlight.svg",
                                )
                            ),
                          )
                          ,SizedBox(height: 2),
                        ]
                    )
                ),
                Text("Spotlight",textAlign: TextAlign.center,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Color(0xffb0b3b6),fontFamily: 'Rubik'))
              ],
            ),
            Column(
              children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: 44,
                    child: Column(
                        children: [
                          GestureDetector(
                            child: Container(
                                width: 44,
                                height: 44,
                                decoration: new BoxDecoration(
                                    boxShadow: [BoxShadow(
                                        color: Color(0x29000000),
                                        offset: Offset(0,3),
                                        blurRadius: 6,
                                        spreadRadius: 0
                                    ) ],
                                    shape: BoxShape.circle,
                                  // gradient: LinearGradient(
                                  //   colors: [
                                  //     Color(0xfffffc00),
                                  //     Color(0xffffc850) ],
                                  //   stops: [
                                  //     0,
                                  //     1
                                  //   ],
                                  //   begin: Alignment(-0.00, -1.00),
                                  //   end: Alignment(0.00, 1.00),
                                  //   // angle: 180,
                                  //   // scale: undefined,
                                  // )
                                ),

                                child: SvgPicture.asset(
                                  "assets/icons/Boost.svg"
                                )
                            ),
                          ),
                          SizedBox(height: 2),

                        ]
                    )
                ),
                Text("Boost",textAlign: TextAlign.center,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Color(0xffb0b3b6),fontFamily: 'Rubik'))
                ,SizedBox(height: 5),
              ],
            ),
            Column(
              children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: 44,
                    child: Column(
                        children: [
                          GestureDetector(
                            child: Container(
                                width: 44,
                                height: 44,
                                decoration: new BoxDecoration(
                                    boxShadow: [BoxShadow(
                                        color: Color(0x29000000),
                                        offset: Offset(0,3),
                                        blurRadius: 6,
                                        spreadRadius: 0
                                    ) ],
                                    shape: BoxShape.circle
                                ),
                                child: SvgPicture.asset("assets/icons/premium.svg",)
                            ),
                          )
                          ,SizedBox(height: 2),
                        ]
                    )
                ),
                Text("Premium",textAlign: TextAlign.center,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Color(0xffb0b3b6),fontFamily: 'Rubik'))
                ,SizedBox(height: 5),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget slider(BuildContext context,double width){
    final List<Widget> imageSliders = imgList.map((item) => Container(
      child: Container(
        decoration: BoxDecoration(
        ),
        margin: EdgeInsets.all(5.0),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            child: Container(
                width: width*0.75,
                color: Color(int.parse(item[3])),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        width: 44,
                        height: 44,
                        decoration: new BoxDecoration(
                            boxShadow: [BoxShadow(
                                color: Color(0x29000000),
                                offset: Offset(0,3),
                                blurRadius: 6,
                                spreadRadius: 0
                            ) ],
                            shape: BoxShape.circle,
                        ),

                        child: SvgPicture.asset(
                          item[0]
                        )
                    ),
                    Text(
                        item[1],style: TextStyle(
                      fontFamily: 'Rubik',
                      color: Color(0xff333343),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                    )
                    ),
                    Text(item[2],
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          color: Color(0xff333343),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 20,
                      // width: width*0.75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: imgList.map((url) {
                          int index = imgList.indexOf(url);
                          return Container(
                            margin: EdgeInsets.only(left: 3,right: 3),
                            width: 6.0,
                            height: 6.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: _current == index
                                    ? Color(0xff6d7278)
                                    :  Color(0xffbadedede)
                              ),
                              color: _current == index
                                  ? Color(0xff6d7278)
                                  : Color(0xffbadedede)
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ))
        ),
      ),
    )).toList();
    return Stack(
        children: [
          CarouselSlider(
            items: imageSliders,
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                pageSnapping: true,
                aspectRatio: 2.5,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }
            ),
          ),

        ]
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Column(
            children: [
              toprow(context, width),
              SizedBox(height: 8),
              GestureDetector(
                onTap:()=> Navigator.of(context).pushNamed('/EditProfileScreen'),
                  child: image(context, width, height)
              ),
              SizedBox(height: 8),
              Stories(context, width),
              slider(context,width)
            ],
          )
      )
    );
  }
}
