//@dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class notification extends StatefulWidget {
  @override
  _notificationState createState() => _notificationState();

}
class _notificationState extends State<notification> {
  static FirebaseAuth _auth = FirebaseAuth.instance;
  final String uid = _auth.currentUser.uid;
  static bool exist = false;


  initState(){
    checkExist();
  }
  Future<bool> checkExist() async {
    final String uid = _auth.currentUser.uid;
    try {
      await FirebaseFirestore.instance.doc("Notifications/$uid").get().then((doc) {
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



  Widget Chatlist (double width){
    return exist ? StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Notifications").doc(uid).snapshots(),
        builder:(context,snapshot) {
          return (snapshot.hasData) ? ListView.separated(
            padding: EdgeInsets.only(top: 0),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount:  snapshot.data[uid].length,
            itemBuilder: (context, index) {
              List list = snapshot.data[uid];
              return ListTile(uid2: list.elementAt(index), width: width,);
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 20,);
            },
          ) : Container();
        }
    ):Container();
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("Notification",
              style: TextStyle(
                fontFamily: 'Rubik',
                color: Color(0xff333343),
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
              )
          ),
        ),
        body: Column(
          children: [
            
            SizedBox(height: 15,),
            Chatlist(width),
          ],
        ),
      ),
    );
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
    FirebaseFirestore.instance.collection("Notifications").doc(uid).collection(uid2).orderBy("time",descending: true)
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
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) =>
        //         Chat(uid2: uid2)));
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