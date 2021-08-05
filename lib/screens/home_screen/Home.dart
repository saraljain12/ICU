//@dart=2.9
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent>with TickerProviderStateMixin {

  DocumentReference docref =  FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser.uid);

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
                            //backgroundImage: (url!=null)?NetworkImage(url):null,
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
                            // backgroundImage: (url!=null)?NetworkImage(url):null,
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
                            // backgroundImage: (url!=null)?NetworkImage(url):null,
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
                            // backgroundImage: (url!=null)?NetworkImage(url):null,
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
                            // backgroundImage: (url!=null)?NetworkImage(url):null,
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
                            // backgroundImage: (url!=null)?NetworkImage(url):null,
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
    mypref();
    // random();
    super.didChangeDependencies();
  }
  @override
  void initState() {
    // random();
    getdata();
    mypref();
  }

  String prefgender,prefcity;
  int prefagestart,prefageend;

  mypref() async {
    DocumentReference docref =  FirebaseFirestore.instance.collection("Users").doc(
        FirebaseAuth.instance.currentUser.uid);
      var docSnapshot = await docref.get();
      if (docSnapshot.exists) {
        setState(() {
          Map<String, dynamic> data = docSnapshot.data();
          prefgender = data['prefgender'];
          prefagestart = (data['prefagestart']);
          prefageend = (data['prefageend']);
          prefcity = (data['prefcity']);
        });
    }
  }
  // int randomnum;
  // random(int max){
  //   randomnum = Random().nextInt(max) + 1;
  //
  // }
  List<String> list;


  getdata() async{
    await FirebaseFirestore.instance.collection("Likes").doc(FirebaseAuth.instance.currentUser.uid).get().then((value){
      setState(() {
        list = List.from(value['like']);
      });
    });
    await FirebaseFirestore.instance.collection("Dislikes").doc(FirebaseAuth.instance.currentUser.uid).get().then((value){
      setState(() {
       list.addAll(List.from(value['dislikes']));
      });
    });
    await FirebaseFirestore.instance.collection("Match").doc(FirebaseAuth.instance.currentUser.uid).get().then((value){
      setState(() {
        list.addAll(List.from(value['match']));
      });
    });
    Fluttertoast.showToast(msg: list.toString());
    
  }

  Stream<QuerySnapshot> stream(){
    var result = FirebaseFirestore.instance.collection("Users")
        .where("gender",isEqualTo: prefgender)
        .where("age",isGreaterThanOrEqualTo: prefagestart)
        .where("age",isLessThanOrEqualTo: prefageend)
        .where("city",isEqualTo: prefcity);
    return result.snapshots();
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
    CardController controller;
    return  Stack(
      children: [
        StreamBuilder<QuerySnapshot>(
          stream: stream(),
          builder: (context, snapshot) {
              String name,city,state,description,uid;
              int age;
            if(snapshot.hasData){
              if(snapshot.data.docs.isNotEmpty) {
                name = snapshot.data.docs[0].get("name");
                age = snapshot.data.docs[0].get("age");
                city = snapshot.data.docs[0].get("gender");
                state = snapshot.data.docs[0].get("city");
                uid = snapshot.data.docs[0].get("uid");
                description = snapshot.data.docs[0].get("Description");
              }
            }
              return (snapshot.hasData&&snapshot.data.docs.isNotEmpty)?
              SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 99),
                      SizedBox(height: screenHeight * 0.041),
                      Container(
                        margin: EdgeInsets.only(left: screenWidth * 0.0435),
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
                      SizedBox(height: screenHeight * 0.028),
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.52,
                        child: Center(
                          child: TinderSwapCard(
                            swipeUp: false,
                            swipeDown: false,
                            orientation: AmassOrientation.TOP,
                            totalNum: 6,
                            stackNum: 3,
                            swipeEdge: 3,
                            maxWidth: MediaQuery.of(context).size.width * 0.913,
                            maxHeight: MediaQuery.of(context).size.height * 0.52,
                            minWidth: MediaQuery.of(context).size.width * 0.913,
                            minHeight: MediaQuery.of(context).size.height * 0.52,
                            cardBuilder: (context, index) =>
                                Card(
                                  borderOnForeground: false,
                                  elevation: 0,
                                  color: Colors.transparent,
                                  child:
                                  Stack(
                                      alignment: Alignment.bottomLeft,
                                      children: [
                                        Container(
                                          width: screenWidth * 0.913,
                                          height: screenHeight * 0.52,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(15),
                                            child: CachedNetworkImage(
                                              imageUrl:snapshot.data.docs[0].get("image1url"),
                                              progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                                                    child: SizedBox(
                                                      width: 40.0,
                                                      height: 40.0,
                                                      child: new CircularProgressIndicator(color: Colors.red,value: downloadProgress.progress,),
                                                    ),
                                                  ),
                                              errorWidget: (context, url, error) => new Icon(Icons.error),
                                              fit: BoxFit.cover,
                                            ),

                                          ),
                                        ),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .end,
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: screenWidth * 0.0242,
                                                  bottom: screenHeight * 0.01),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .end,
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  Text("$name, $age",
                                                      style: TextStyle(
                                                        fontFamily: 'Rubik',
                                                        color: Color(
                                                            0xffffffff),
                                                        fontSize: 24,
                                                        fontWeight: FontWeight
                                                            .w600,
                                                        fontStyle: FontStyle
                                                            .normal,
                                                      )
                                                  ),
                                                  Text("$city, $state",
                                                      style: TextStyle(
                                                        fontFamily: 'Rubik',
                                                        color: Color(
                                                            0xffffffff),
                                                        fontSize: 20,
                                                        fontWeight: FontWeight
                                                            .w400,
                                                        fontStyle: FontStyle
                                                            .normal,
                                                      )
                                                  ),
                                                ],
                                              ),
                                            ),
                                            GestureDetector(
                                              child: Container(
                                                  margin: EdgeInsets.only(
                                                      right: screenWidth *
                                                          0.0242,
                                                      bottom: screenHeight *
                                                          0.01),
                                                  width: 44,
                                                  height: 44,
                                                  padding: EdgeInsets.all(7),
                                                  decoration: new BoxDecoration(
                                                      color: Color(0xffffffff),
                                                      boxShadow: [BoxShadow(
                                                          color: Color(
                                                              0x29000000),
                                                          offset: Offset(0, 3),
                                                          blurRadius: 6,
                                                          spreadRadius: 0
                                                      )
                                                      ],
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
                                ),
                            cardController: controller = CardController(),
                            swipeUpdateCallback:
                                (DragUpdateDetails details, Alignment align) {
                            },
                            swipeCompleteCallback:
                                (CardSwipeOrientation orientation, int index) {
                              if (orientation == CardSwipeOrientation.LEFT) {
                                FirebaseFirestore.instance.collection("Dislikes").doc(FirebaseAuth.instance.currentUser.uid)
                                    .update({'dislikes': FieldValue.arrayUnion([uid]),})
                                    .onError((error, stackTrace) => Fluttertoast.showToast(msg: error))
                                    .whenComplete(() => Fluttertoast.showToast(msg: "added"));
                                Fluttertoast.showToast(msg: "dislike");
                              } else
                              if (orientation == CardSwipeOrientation.RIGHT) {
                                Fluttertoast.showToast(msg: "like");
                              }
                            },
                          ),
                        ),
                      ),
                      Stack(
                          children: [
                            Column(
                              children: [
                                SizedBox(height: screenHeight * 0.03),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    width: screenWidth * 0.913,
                                    height: screenHeight * 0.18,
                                    padding: EdgeInsets.only(
                                        left: screenWidth * 0.025,
                                        top: screenWidth * 0.025),
                                    decoration: new BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(14),
                                      boxShadow: [BoxShadow(
                                          color: Color(0x29000000),
                                          offset: Offset(0, 0),
                                          blurRadius: 6,
                                          spreadRadius: 0
                                      )
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
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
                                        Text(
                                            "$description",
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
                                          child: Text("SEE FULL PROFILE",
                                            style: TextStyle(
                                                color: Color(0xfffe5d5e),
                                                fontFamily: 'Gotham',
                                                fontWeight: FontWeight.w400
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
                                    margin: EdgeInsets.only(
                                        right: screenWidth * 0.0677,
                                        top: screenHeight * 0.01),
                                    width: 44,
                                    height: 44,
                                    padding: EdgeInsets.all(7),
                                    decoration: new BoxDecoration(
                                        color: Color(0xffffffff),
                                        boxShadow: [BoxShadow(
                                            color: Color(0x29000000),
                                            offset: Offset(0, 3),
                                            blurRadius: 6,
                                            spreadRadius: 0
                                        )
                                        ],
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
              ):Container();
            }
        ),
        
        Stories(context,screenWidth),
      ],
    );
  }
}

