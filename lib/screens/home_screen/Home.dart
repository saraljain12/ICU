//@dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}
class _HomeContentState extends State<HomeContent>{
  String uid = FirebaseAuth.instance.currentUser.uid;
  String url;

  DocumentReference docref =  FirebaseFirestore.instance.collection("Users").doc(
      FirebaseAuth.instance.currentUser.uid).collection("Information").doc("infor");

  getimage() async{
       var docSnapshot = await docref.get();
       if (docSnapshot.exists) {
         setState(() {
           Map<String, dynamic> data = docSnapshot.data();
           url = data['image1url'];
         });
       }
     }

  Widget Stories(BuildContext context,double screenwidth){
    return Container(
      decoration: BoxDecoration(
        // color: Colors.redAccent,
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(0xfffd297b), Color(0xffff655b)]),
        borderRadius: BorderRadius.only(
        ),
      ),
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: SizedBox(
        height: 75,
        child: ListView(
          itemExtent: screenwidth/6,

          padding: EdgeInsets.only(left: 3,right: 2),
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Column(
              children: [
                Container(
                   margin: EdgeInsets.symmetric(horizontal: 5),
                  width: 44,
                    child: Column(
                        children: [
                          SizedBox(height: 10),
                          CircleAvatar(
                            radius: 22.0,
                            backgroundImage: (url!=null)?NetworkImage(url):null,
                            backgroundColor: Colors.transparent,
                          ),SizedBox(height: 2),

                        ]
                    )
                ),
                Text("Top Pick",textAlign: TextAlign.center,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: Colors.white,fontFamily: 'Rubik'))
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
                          SizedBox(height: 10),
                          CircleAvatar(
                            radius: 22.0,
                            backgroundImage: (url!=null)?NetworkImage(url):null,
                            backgroundColor: Colors.transparent,
                          ),SizedBox(height: 2),

                        ]
                    )
                ),
                Text("Popular",textAlign: TextAlign.center,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: Colors.white,fontFamily: 'Rubik'))
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
                          SizedBox(height: 10),
                          CircleAvatar(
                            radius: 22.0,
                            backgroundImage: (url!=null)?NetworkImage(url):null,
                            backgroundColor: Colors.transparent,
                          ),SizedBox(height: 2),

                        ]
                    )
                ),
                Text("Match%",textAlign: TextAlign.center,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: Colors.white,fontFamily: 'Rubik'))
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
                          SizedBox(height: 10),
                          CircleAvatar(
                            radius: 22.0,
                            backgroundImage: (url!=null)?NetworkImage(url):null,
                            backgroundColor: Colors.transparent,
                          ),SizedBox(height: 2),

                        ]
                    )
                ),
                Text("Passport",textAlign: TextAlign.center,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: Colors.white,fontFamily: 'Rubik'))
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
                          SizedBox(height: 10),
                          CircleAvatar(
                            radius: 22.0,
                            backgroundImage: (url!=null)?NetworkImage(url):null,
                            backgroundColor: Colors.transparent,
                          ),SizedBox(height: 2),

                        ]
                    )
                ),
                Text("Near by",textAlign: TextAlign.center,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: Colors.white,fontFamily: 'Rubik'))
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
                          SizedBox(height: 10),
                          CircleAvatar(
                            radius: 22.0,
                            backgroundImage: (url!=null)?NetworkImage(url):null,
                            backgroundColor: Colors.transparent,
                          ),SizedBox(height: 2),

                        ]
                    )
                ),
                Text("Online",textAlign: TextAlign.center,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: Colors.white,fontFamily: 'Rubik'))
                ,SizedBox(height: 5),
              ],
            ),

          ],
        ),
      ),
    );

  }

  @override
  void didChangeDependencies() {
    getimage();
    super.didChangeDependencies();
  }
  @override
  void initState() {

  }

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
    return  Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 99),
              SizedBox(height: screenHeight*0.041),
              Container(
                margin: EdgeInsets.only(left: screenWidth*0.0435),
                child: Text("Recommended For You",
                    style: TextStyle(
                      fontFamily: 'Gotham',
                      color: Color(0xff000000),
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )
                ),
              ),
              SizedBox(height: screenHeight*0.028),
              Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal:screenWidth*0.0435 ),
                      width: screenWidth*0.913,
                      height: screenHeight*0.52,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image(
                          image: (url!=null)?NetworkImage(url,):AssetImage("assets/images/girl1.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left:screenWidth*0.0677,bottom: screenHeight*0.01),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Anisha Sharma, 22",
                                  style: TextStyle(
                                    fontFamily: 'Rubik',
                                    color: Color(0xffffffff),
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                  )
                              ),
                              Text("Kanpur, Uttar Pradesh",
                                  style: TextStyle(
                                    fontFamily: 'Rubik',
                                    color: Color(0xffffffff),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  )
                              ),

                            ],
                          ),
                        ),
                        GestureDetector(
                          child: Container(
                              margin: EdgeInsets.only(right:screenWidth*0.0677,bottom: screenHeight*0.01),
                              width: 44,
                              height: 44,
                              padding: EdgeInsets.all(7),
                              decoration: new BoxDecoration(
                                color: Color(0xffffffff),
                                boxShadow: [BoxShadow(
                                    color: Color(0x29000000),
                                    offset: Offset(0,3),
                                    blurRadius: 6,
                                    spreadRadius: 0
                                ) ],
                                shape: BoxShape.circle
                              ),
                              child: SvgPicture.asset(
                                  "assets/icons/star.svg",
                              )
                          ),
                        )
                      ],
                    ),
                  ]),
              Stack(
                children: [
                  Column(
                  children: [
                    SizedBox(height: screenHeight*0.03),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: screenWidth*0.913,
                        height: screenHeight*0.18,
                        padding: EdgeInsets.only(left: screenWidth*0.025,top: screenWidth*0.025),
                        decoration: new BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [BoxShadow(
                              color: Color(0x29000000),
                              offset: Offset(0,0),
                              blurRadius: 6,
                              spreadRadius: 0
                          ) ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Bio",
                                style: TextStyle(
                                  fontFamily: 'Rubik',
                                  color: Color(0xff333343),
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                )
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text("Every day might not be a good day but there is good in every day.",
                                style: TextStyle(
                                  fontFamily: 'Rubik',
                                  color: Color(0xff6d7278),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                )
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            GestureDetector(
                              child: Text("SEE FULL PROFILE",style: TextStyle(
                                  color: Color(0xfffe5d5e),fontFamily: 'Gotham',fontWeight: FontWeight.w400
                              ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      child: Container(
                          margin: EdgeInsets.only(right:screenWidth*0.0677,top: screenHeight*0.01),
                          width: 44,
                          height: 44,
                          padding: EdgeInsets.all(7),
                          decoration: new BoxDecoration(
                              color: Color(0xffffffff),
                              boxShadow: [BoxShadow(
                                  color: Color(0x29000000),
                                  offset: Offset(0,3),
                                  blurRadius: 6,
                                  spreadRadius: 0
                              ) ],
                              shape: BoxShape.circle
                          ),
                          child: Image.asset(
                            "assets/icons/match%.png",
                          )
                      ),
                    ),
                  )
              ])
            ]
          ),
        ),
        Stories(context,screenWidth),
      ],
    );
  }
}