//@dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:icu/screens/ChatPackage/FirebaseApi.dart';
import 'package:intl/intl.dart';

import '../CustomTextField.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}
class _ChatScreenState extends State<ChatScreen> {

  String url;
  static FirebaseAuth _auth = FirebaseAuth.instance;
  final String uid = _auth.currentUser.uid;
  TextEditingController _textController = TextEditingController();


  DocumentReference docref =  FirebaseFirestore.instance.collection("Users").doc(
      FirebaseAuth.instance.currentUser.uid);


  CollectionReference match = FirebaseFirestore.instance.collection("Match");
  getimage() async{
    var docSnapshot = await docref.get();
    if (docSnapshot.exists) {
      setState(() {
        Map<String, dynamic> data = docSnapshot.data();
        url = data['image1url'];
      });
    }
  }
  static bool exist = false;

  Future<bool> checkExist() async {
    final String uid = _auth.currentUser.uid;
    try {
      await FirebaseFirestore.instance.doc("Match/$uid").get().then((doc) {
        setState(() {
        exist = doc.exists;
        });
      });
      return exist;
    } catch (e) {
      // If any error
      return false;
    }
  }
  initState(){
    getimage();
    checkExist();
  }

  Widget Chatlist (double width){
    return exist ? StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Match").doc(uid).snapshots(),
          builder:(context,snapshot) {
              return (snapshot.hasData) ? ListView.separated(
                padding: EdgeInsets.only(top: 0),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount:  snapshot.data[uid].length,
                itemBuilder: (context, index) {
                  List list = snapshot.data[uid];
                  return ListTile(uid2: list.elementAt(index), width: width);
                },
                separatorBuilder: (context, index) {
                  return Divider(indent: width * 0.218,
                    endIndent: width * 0.0642,
                    thickness: 1.25,);
                },
              ) : Container();
            }
    ):Container();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double messageheight = (height*0.89195)-137;
    return Stack(
      children: [
        Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: height*0.053),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: width*0.0397),
            child: Text("New Matches",
                style: TextStyle(
                  fontFamily: 'Gotham',
                  color: Color(0xff000000),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                )
            ),
          ),
          SizedBox(height: height*0.01835),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: (url!=null)?NetworkImage(url):AssetImage("assets/images/girl1.jpg"),
                backgroundColor: Colors.transparent,
              ),
              CircleAvatar(
                radius: 30,
                backgroundImage: (url!=null)?NetworkImage(url):AssetImage("assets/images/girl1.jpg"),
                backgroundColor: Colors.transparent,
              ),
              CircleAvatar(
                radius: 30,
                backgroundImage: (url!=null)?NetworkImage(url):AssetImage("assets/images/girl1.jpg"),
                backgroundColor: Colors.transparent,
              ),
              CircleAvatar(
                radius:30,
                backgroundImage: (url!=null)?NetworkImage(url):AssetImage("assets/images/girl1.jpg"),
                backgroundColor: Colors.transparent,
              ),
            ],
          ),
          SizedBox(height: height*0.0367),
          Container(
              width: width,
              height: messageheight,
              decoration: new BoxDecoration(
                color: Color(0xffffffff),
                borderRadius: BorderRadius.only(topLeft:Radius.circular(40),topRight: Radius.circular(40)),
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
                SizedBox(height: messageheight*0.0509),
                 Container(
                   margin: EdgeInsets.symmetric(horizontal: width*0.039),
                   padding: EdgeInsets.only(left: 12),
                    width: width*0.922,
                    height: 40,
                    decoration: new BoxDecoration(
                        color: Color(0xffefefef),
                        borderRadius: BorderRadius.circular(30)
                    ),
                  child: TextFieldCustom(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical:10,horizontal: 10)
                    ),
                   style: TextStyle(
                      fontFamily: 'Rubik',
                      color: Color(0xff000000),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      ),
                    hintText: Text.rich(
                      TextSpan(
                        children:[
                          WidgetSpan(
                            child: Icon(Icons.search,color: Color(0xfffe5a60),size: 22,),
                          ),
                          WidgetSpan(
                            child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Text("Search ",
                                    style: TextStyle(
                                      fontFamily: 'Rubik',
                                      color: Color(0xff707070),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                    )
                                )
                            ),
                          ),
                        ],
                      ),
                    )),
                  ),
                SizedBox(height: messageheight*0.0449),
                Container(
                  margin: EdgeInsets.only(left: width*0.0397),
                  child: Text("Messages",
                      style: TextStyle(
                        fontFamily: 'GothamRounded',
                        color: Color(0xff000000),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      )
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
        Container(
          margin: EdgeInsets.only(top: (height*0.20385)+136),
          child: SingleChildScrollView(
            child: Chatlist(width),
          ),
        ),
    ]);
  }

}

class ListTile extends StatefulWidget {
  String uid2;
  double width;
  ListTile({ this.uid2,this.width});
  @override
  _ListState createState() =>_ListState(uid2: uid2,width: width);

}
class _ListState extends State<ListTile> {
  String uid2;
  double width;
  String urll;
  String lastmessage;
  String time;
  String name;
  _ListState({ this.uid2,this.width});
  Map<String,dynamic> data;

  initState(){
    getmessageandtime(uid2, data);
    getdata(uid2,data);
  }

  getdata(String uid, Map<String,dynamic> data) async{
    DocumentReference docref = FirebaseFirestore.instance.collection("Users").doc(
        uid2);
    var docSnapshot = await docref.get();
    if (docSnapshot.exists) {
      setState(() {
        data = docSnapshot.data();
        urll = data['image1url'];
        name = data['name'];
      });
    }
  }

  getmessageandtime(String uid2, Map<String,dynamic> data) async{
    String uid = FirebaseAuth.instance.currentUser.uid;
    FirebaseFirestore.instance.collection("Match").doc(uid).collection(uid+"_"+uid2).orderBy("time",descending: true)
    .snapshots().listen(
            (data) {
              setState(() {
                lastmessage = "${data.docs[0]['message']}";
                int dateTime = int.parse("${data.docs[0]['time']}");
                var date = DateTime.fromMillisecondsSinceEpoch(dateTime);
                var formattedDate = DateFormat('HH:mm').format(date);
                time = formattedDate;
              });

            }
            );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>
                  Chat(uid2: uid2)));
      },
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: width * 0.05841),
          child:
          Column(
                children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: (urll!=null)?NetworkImage(urll):AssetImage("assets/images/Logo.png"),
                        backgroundColor: Colors.transparent,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: width * 0.0443),
                            width: width - (width * 0.16112) - 70,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment
                                  .spaceBetween,
                              children: [
                                Text((name!=null)?name:"I Choose You",
                                    style: TextStyle(
                                      fontFamily: 'Rubik',
                                      color: Color(0xff333343),
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                    )
                                ),
                                Text((time!=null)?time:"11:11",
                                    style: TextStyle(
                                      fontFamily: 'Rubik',
                                      color: Color(0xff707070),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                    )
                                )
                              ],
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(left: width * 0.0443),
                              width: width - (width * 0.16112) - 70,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment
                                    .center,
                                children: [
                                  Container(
                                    child: Flexible(
                                      child: Text(
                                        (lastmessage!=null)?lastmessage:"I Choose You",
                                        style: TextStyle(
                                          fontFamily: 'Rubik',
                                          color: Color(0xff333343),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: false,
                                      ),
                                    ),
                                  ),
                                  // Container(
                                  //   height: 21,
                                  //   width: 21,
                                  //   alignment: Alignment.center,
                                  //   decoration: BoxDecoration(
                                  //       color: Color(0xfffd3f6e),
                                  //       shape: BoxShape.circle
                                  //   ),
                                  //   child: Text("2",
                                  //       style: TextStyle(
                                  //         fontFamily: 'Rubik',
                                  //         color: Color(0xffffffff),
                                  //         fontSize: 16,
                                  //         fontWeight: FontWeight.w400,
                                  //         fontStyle: FontStyle.normal,
                                  //       )
                                  //   ),
                                  // )
                                ],
                              )
                          )
                        ],
                      )
                    ],
                  ),
                ],
              )
      ),
    );
  }

}