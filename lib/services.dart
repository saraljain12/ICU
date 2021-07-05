//@dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DatabaseMethods  {

 static FirebaseAuth _auth = FirebaseAuth.instance;
  final String uid = _auth.currentUser.uid;

  Future<void> addUserInfo(userData) async {
    FirebaseFirestore.instance.collection("users").add(userData).catchError((e) {
      Fluttertoast.showToast(msg: e.toString());
    });
  }

  getUserInfo(String email) async {
    return FirebaseFirestore.instance
        .collection("users")
        .where("userEmail", isEqualTo: email)
        .get()
        .catchError((e) {
      Fluttertoast.showToast(msg: e.toString());
    });
  }

  searchByName(String searchField) {
    return FirebaseFirestore.instance
        .collection("users")
        .where('userName', isEqualTo: searchField)
        .get();
  }

  Future<bool> addChatRoom(chatRoom, chatRoomId) {
    FirebaseFirestore.instance
        .collection("chatRoom")
        .doc(chatRoomId)
        .set(chatRoom)
        .catchError((e) {
      Fluttertoast.showToast(msg: e);
    });
  }

  getChats(String userid2)  {
    return FirebaseFirestore.instance
        .collection("Match")
        .doc(uid)
        .collection(uid+"_"+userid2).snapshots();
  }


  Future<void> addMessage(String userid2, chatMessageData) {
    DocumentReference _docref = FirebaseFirestore.instance.collection("Match")
        .doc(uid)
        .collection(uid+"_"+userid2)
        .doc();

        _docref.set(chatMessageData)
        .catchError((e) {
      Fluttertoast.showToast(msg: e.toString());
    });

    DocumentReference _docref2 = FirebaseFirestore.instance.collection("Match")
        .doc(userid2)
        .collection(userid2+"_"+uid)
        .doc();

    _docref2.set(chatMessageData)
        .catchError((e) {
      Fluttertoast.showToast(msg: e.toString());
    });
  }

  getUserChats(String itIsMyName) async {
    return await FirebaseFirestore.instance
        .collection("chatRoom")
        .where('users', arrayContains: itIsMyName)
        .snapshots();
  }
}
