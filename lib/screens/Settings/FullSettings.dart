//@dart=2.9
import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:icu/screens/Settings/IntrestContainer.dart';
import 'package:image_picker/image_picker.dart';

class FullSettings extends StatefulWidget {
  @override
  _FullSettingsState createState() => _FullSettingsState();
}

class _FullSettingsState extends State<FullSettings> {

  final _picker = ImagePicker();
  PickedFile image;
  String uid = FirebaseAuth.instance.currentUser.uid;
  String urll1,urll2,urll3,urll4,urll5,urll6;
  final _fireStorage = FirebaseStorage.instance;

  _imgFromCamera1() async {
    image = (await _picker.getImage(
        source: ImageSource.camera, imageQuality: 50
    ));

    setState(() {
      _fireStorage.ref().child('Images/$uid/image1').putFile(File(image.path)).
      whenComplete(() async {
        String url1 = await _fireStorage.ref()
            .child('Images/$uid/image1')
            .getDownloadURL();
        await docref.update({"image1url": url1});
        getimage();
      }
      );
    });
  }
  _imgFromGallery1() async {
    image = (await  _picker.getImage(
        source: ImageSource.gallery, imageQuality: 50
    ));
    setState(() {
      _fireStorage.ref().child('Images/$uid/image1').putFile(File(image.path)).whenComplete(() async {
        String url1 = await _fireStorage.ref()
            .child('Images/$uid/image1')
            .getDownloadURL();
        await docref.update({"image1url": url1});
        getimage();
      });
    });
  }
  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library,color: Color(0xfffd297b)),
                      title: new Text('Photo Library',style: TextStyle(color: Colors.black),),
                      onTap: () {
                        _imgFromGallery1();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera,color: Color(0xfffd297b)),
                    title: new Text('Camera',style: TextStyle(color: Colors.black)),
                    onTap: () {
                      _imgFromCamera1();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

  _imgFromCamera2() async {
    image = (await _picker.getImage(
        source: ImageSource.camera, imageQuality: 50
    ));
    setState(() {
      _fireStorage.ref().child('Images/$uid/image2').putFile(File(image.path)).whenComplete(()async {
        String url1 = await _fireStorage.ref()
            .child('Images/$uid/image2')
            .getDownloadURL();
        await docref.update({"image2url": url1});
        getimage();
      });
    });
  }
  _imgFromGallery2() async {
    image = (await  _picker.getImage(
        source: ImageSource.gallery, imageQuality: 50
    ));
    setState(() {
      _fireStorage.ref().child('Images/$uid/image2').putFile(File(image.path)).whenComplete(() async {
        String url1 = await _fireStorage.ref()
            .child('Images/$uid/image2')
            .getDownloadURL();
        await docref.update({"image2url": url1});
        getimage();
      });
    });
  }
  void _showPicker2(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library,color: Color(0xfffd297b)),
                      title: new Text('Photo Library',style: TextStyle(color: Colors.black),),
                      onTap: () {
                        _imgFromGallery2();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera,color: Color(0xfffd297b)),
                    title: new Text('Camera',style: TextStyle(color: Colors.black)),
                    onTap: () {
                      _imgFromCamera2();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

  _imgFromCamera3() async {
    image = (await _picker.getImage(
        source: ImageSource.camera, imageQuality: 50
    ));
    setState(() {
      _fireStorage.ref().child('Images/$uid/image3').putFile(File(image.path)).whenComplete(() async {
        String url1 = await _fireStorage.ref()
            .child('Images/$uid/image3')
            .getDownloadURL();
        await docref.update({"image3url": url1});
        getimage();
      });
    });
  }
  _imgFromGallery3() async {
    image = (await  _picker.getImage(
        source: ImageSource.gallery, imageQuality: 50
    ));
    setState(() {
      _fireStorage.ref().child('Images/$uid/image3').putFile(File(image.path)).whenComplete(() async {
        String url1 = await _fireStorage.ref()
            .child('Images/$uid/image3')
            .getDownloadURL();
        await docref.update({"image3url": url1});
        getimage();
      });
    });
  }
  void _showPicker3(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library,color: Color(0xfffd297b)),
                      title: new Text('Photo Library',style: TextStyle(color: Colors.black),),
                      onTap: () {
                        _imgFromGallery3();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera,color: Color(0xfffd297b)),
                    title: new Text('Camera',style: TextStyle(color: Colors.black)),
                    onTap: () {
                      _imgFromCamera3();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

  _imgFromCamera4() async {
    image = (await _picker.getImage(
        source: ImageSource.camera, imageQuality: 50
    ));
    setState(() {
      _fireStorage.ref().child('Images/$uid/image4').putFile(File(image.path)).whenComplete(() async {
        String url1 = await _fireStorage.ref()
            .child('Images/$uid/image4')
            .getDownloadURL();
        await docref.update({"image4url": url1});
        getimage();
      });
    });
  }
  _imgFromGallery4() async {
    image = (await  _picker.getImage(
        source: ImageSource.gallery, imageQuality: 50
    ));
    setState(() {
      _fireStorage.ref().child('Images/$uid/image4').putFile(File(image.path)).whenComplete(() async {
        String url1 = await _fireStorage.ref()
            .child('Images/$uid/image4')
            .getDownloadURL();
        await docref.update({"image4url": url1});
        getimage();
      });
    });
  }
  void _showPicker4(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library,color: Color(0xfffd297b)),
                      title: new Text('Photo Library',style: TextStyle(color: Colors.black),),
                      onTap: () {
                        _imgFromGallery4();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera,color: Color(0xfffd297b)),
                    title: new Text('Camera',style: TextStyle(color: Colors.black)),
                    onTap: () {
                      _imgFromCamera4();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

  _imgFromCamera5() async {
    image = (await _picker.getImage(
        source: ImageSource.camera, imageQuality: 50
    ));
    setState(() {
      _fireStorage.ref().child('Images/$uid/image5').putFile(File(image.path)).whenComplete(() async {
        String url1 = await _fireStorage.ref()
            .child('Images/$uid/image5')
            .getDownloadURL();
        await docref.update({"image5url": url1});
        getimage();
      });
    });
  }
  _imgFromGallery5() async {
    image = (await  _picker.getImage(
        source: ImageSource.gallery, imageQuality: 50
    ));
    setState(() {
      _fireStorage.ref().child('Images/$uid/image5').putFile(File(image.path)).whenComplete(() async {
        String url1 = await _fireStorage.ref()
            .child('Images/$uid/image5')
            .getDownloadURL();
        await docref.update({"image5url": url1});
        getimage();
      });
    });
  }
  void _showPicker5(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library,color: Color(0xfffd297b)),
                      title: new Text('Photo Library',style: TextStyle(color: Colors.black),),
                      onTap: () {
                        _imgFromGallery5();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera,color: Color(0xfffd297b)),
                    title: new Text('Camera',style: TextStyle(color: Colors.black)),
                    onTap: () {
                      _imgFromCamera5();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

  _imgFromCamera6() async {
    image = (await _picker.getImage(
        source: ImageSource.camera, imageQuality: 50
    ));
    setState(() {
      _fireStorage.ref().child('Images/$uid/image6').putFile(File(image.path)).whenComplete(() async {
        String url1 = await _fireStorage.ref()
            .child('Images/$uid/image6')
            .getDownloadURL();
        await docref.update({"image6url": url1});
        getimage();
      });
    });
  }
  _imgFromGallery6() async {
    image = (await  _picker.getImage(
        source: ImageSource.gallery, imageQuality: 50
    ));
    setState(() {
      _fireStorage.ref().child('Images/$uid/image6').putFile(File(image.path)).whenComplete(() async {
        String url1 = await _fireStorage.ref()
            .child('Images/$uid/image6')
            .getDownloadURL();
        await docref.update({"image6url": url1});
        getimage();
      });
    });
  }
  void _showPicker6(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library,color: Color(0xfffd297b)),
                      title: new Text('Photo Library',style: TextStyle(color: Colors.black),),
                      onTap: () {
                        _imgFromGallery6();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera,color: Color(0xfffd297b)),
                    title: new Text('Camera',style: TextStyle(color: Colors.black)),
                    onTap: () {
                      _imgFromCamera6();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }


  DocumentReference docref =  FirebaseFirestore.instance.collection("Users").doc(
      FirebaseAuth.instance.currentUser.uid).collection("Information").doc("infor");



  Future<void> getimage() async{
    var docSnapshot = await docref.get();
    if (docSnapshot.exists) {
      setState(() {
        Map<String,dynamic> data = new Map<String,dynamic>();
        data = docSnapshot.data();
        if(data.containsKey('image1url')){
          urll1 = data['image1url'];
        }
        if(data.containsKey('image2url')){
          urll2 = data['image2url'];
        }
        if(data.containsKey('image3url')){
          urll3 = data['image3url'];
        }
        if(data.containsKey('image4url')){
          urll4 = data['image4url'];
        }
        if(data.containsKey('image5url')){
          urll5 = data['image5url'];
        }
        if(data.containsKey('image6url')){
          urll6 = data['image6url'];
        }
      });
    }
  }

  Future<void> deleteimage1() async{
    var docSnapshot = await docref.get();
    if (docSnapshot.exists) {
      setState(() {
        Map<String,dynamic> data = new Map<String,dynamic>();
        data = docSnapshot.data();
        docref.update({"image1url": data['image2url']});;

        if(data.containsKey('image3url')) {
          docref.update({"image2url": data['image3url']});;

          if(data.containsKey('image4url')) {
            docref.update({"image3url": data['image4url']});;

            if(data.containsKey('image5url')) {
              docref.update({"image4url": data['image5url']});;

              if(data.containsKey('image6url')) {
                docref.update({"image5url": data['image6url']});;
                docref.update({
                  'image6url': FieldValue.delete()
                });
                setState(() {
                  urll6 = null;
                });
              }else{
                docref.update({
                  'image5url': FieldValue.delete()
                });
                setState(() {
                  urll5 = null;
                });
              }
            }else{
              docref.update({
                'image4url': FieldValue.delete()
              });
              setState(() {
                urll4 = null;
              });
            }
          }else{
            docref.update({
              'image3url': FieldValue.delete()
            });
            setState(() {
              urll3 = null;
            });
          }
        }else{
          docref.update({
            'image2url': FieldValue.delete()
          });
          setState(() {
            urll2 = null;
          });
        }
        getimage();
      });
    }
  }
  Future<void> deleteimage2() async{
    var docSnapshot = await docref.get();
    if (docSnapshot.exists) {
      setState(() {
        Map<String,dynamic> data = new Map<String,dynamic>();
        data = docSnapshot.data();
        if(data.containsKey('image3url')) {
          docref.update({"image2url": data['image3url']});;

          if(data.containsKey('image4url')) {
            docref.update({"image3url": data['image4url']});;

            if(data.containsKey('image5url')) {
              docref.update({"image4url": data['image5url']});;

              if(data.containsKey('image6url')) {
                docref.update({"image5url": data['image6url']});;
                docref.update({
                  'image6url': FieldValue.delete()
                });
                setState(() {
                  urll6 = null;
                });
              }else{
                docref.update({
                  'image5url': FieldValue.delete()
                });
                setState(() {
                  urll5 = null;
                });
              }
            }else{
              docref.update({
                'image4url': FieldValue.delete()
              });
              setState(() {
                urll4 = null;
              });
            }
          }else{
            docref.update({
              'image3url': FieldValue.delete()
            });
            setState(() {
              urll3 = null;
            });
          }
        }else{
          docref.update({
            'image2url': FieldValue.delete()
          });
          setState(() {
            urll2 = null;
          });
        }
        getimage();
      });
    }
  }
  Future<void> deleteimage3() async{
    var docSnapshot = await docref.get();
    if (docSnapshot.exists) {
      setState(() {
        Map<String,dynamic> data = new Map<String,dynamic>();
        data = docSnapshot.data();
          if(data.containsKey('image4url')) {
            docref.update({"image3url": data['image4url']});;

            if(data.containsKey('image5url')) {
              docref.update({"image4url": data['image5url']});;

              if(data.containsKey('image6url')) {
                docref.update({"image5url": data['image6url']});;
                docref.update({
                  'image6url': FieldValue.delete()
                });
                setState(() {
                  urll6 = null;
                });
              }else{
                docref.update({
                  'image5url': FieldValue.delete()
                });
                setState(() {
                  urll5 = null;
                });
              }
            }else{
              docref.update({
                'image4url': FieldValue.delete()
              });
              setState(() {
                urll4 = null;
              });
            }
          }else{
            docref.update({
              'image3url': FieldValue.delete()
            });
            setState(() {
              urll3 = null;
            });
          }
        getimage();
      });
    }
  }
  Future<void> deleteimage4() async{
    var docSnapshot = await docref.get();
    if (docSnapshot.exists) {
      setState(() {
        Map<String,dynamic> data = new Map<String,dynamic>();
        data = docSnapshot.data();

          if(data.containsKey('image5url')) {
            docref.update({"image4url": data['image5url']});;

            if(data.containsKey('image6url')) {
              docref.update({"image5url": data['image6url']});;
              docref.update({
                'image6url': FieldValue.delete()
              });
              setState(() {
                urll6 = null;
              });
            }else{
              docref.update({
                'image5url': FieldValue.delete()
              });
              setState(() {
                urll5 = null;
              });
            }
          }else{
            docref.update({
              'image4url': FieldValue.delete()
            });
            setState(() {
              urll4 = null;
            });
          }
        getimage();
      });
    }
  }
  Future<void> deleteimage5() async{
    var docSnapshot = await docref.get();
    if (docSnapshot.exists) {
      setState(() {
        Map<String,dynamic> data = new Map<String,dynamic>();
        data = docSnapshot.data();

          if(data.containsKey('image6url')) {
            docref.update({"image5url": data['image6url']});;
            docref.update({
              'image6url': FieldValue.delete()
            });
            setState(() {
              urll6 = null;
            });
          }else{
            docref.update({
              'image5url': FieldValue.delete()
            });
            setState(() {
              urll5 = null;
            });
          }
        getimage();
      });
    }
  }
  Future<void> deleteimage6() async{
    var docSnapshot = await docref.get();
    if (docSnapshot.exists) {
      setState(() {
        Map<String,dynamic> data = new Map<String,dynamic>();
        data = docSnapshot.data();
          docref.update({
            'image6url': FieldValue.delete()
          });
          setState(() {
            urll6 = null;
          });
        getimage();
      });
    }
  }




  @override
  void didChangeDependencies() {
    getimage();
    super.didChangeDependencies();
  }

  @override
  void initState() {
    getimage();
    super.initState();
  }

  Widget toprow(BuildContext context,double width){
    return Container(
      margin: EdgeInsets.only(right: width*0.375,top: 30,left: 15),                        
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: ()=> Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios,color: Colors.black,size: 24),
          ),
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
        ],
      ),
    );
  }
  Widget Mybasicinfo() {
    return Container(
        margin: EdgeInsets.only(left: 20),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                buildContainer(Image.asset("assets/icons/gym.png"), "180 cm", false),
                SizedBox(width: 10),
                buildContainer(Image.asset("assets/icons/gym.png"), "Active", false),
                SizedBox(width: 10),
                buildContainer(Image.asset("assets/icons/gym.png"), "Socially", false),
              ],
            ),
            SizedBox(height: 13,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                buildContainer(Image.asset("assets/icons/gym.png"), "I'm an Undergrad", false),
                SizedBox(width: 10),
                buildContainer(Image.asset("assets/icons/gym.png"), "Teen", false),
              ],
            ),
            SizedBox(height: 13,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                buildContainer(Image.asset("assets/icons/gym.png"), "looking for", false),
                SizedBox(width: 10),
                buildContainer(Image.asset("assets/icons/gym.png"), "Don't Want", false),
              ],
            ),
            SizedBox(height: 13,),
          ],
        )
    );
  }
  Widget MyIntrests() {
    return Container(
        margin: EdgeInsets.only(left: 20),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                buildContainer(Image.asset("assets/icons/gym.png"), "arts", false),
                SizedBox(width: 10),
                buildContainer(Image.asset("assets/icons/gym.png"), "Coffee", false),
                SizedBox(width: 10),
                buildContainer(Image.asset("assets/icons/gym.png"), "Beaches", false),
              ],
            ),
            SizedBox(height: 13,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                buildContainer(Image.asset("assets/icons/gym.png"), "Hiking Trips", false),
                SizedBox(width: 10),
                buildContainer(Image.asset("assets/icons/gym.png"), "Politcs", false),
              ],
            ),
            SizedBox(height: 13,),
          ],
        )
    );
  }

  Widget imagepick(){
    var ref = FirebaseStorage.instance
        .ref()
        .child('Images')
        .child(uid);
    return Column(
      children: <Widget>[
        SizedBox(
          height: 15,
        ),
        Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                GestureDetector(
                    onTap: () {
                      urll1 == null?_showPicker(context): (){};
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child:
                      urll1 == null ?
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        width: 100,
                        height: 150,
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [Color(0xffFD297B), Color(0xffFF655B)]),
                            ),
                            child: Icon(
                              Icons.add_photo_alternate_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ):
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Container(
                          child: Stack(
                              children: [
                                Image.network(
                                urll1,
                                width: 100,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                                urll2!=null?Container(
                                    margin: EdgeInsets.only(left: 4,top: 4),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [Color(0xffFD297B), Color(0xffFF655B)]),
                                    ),
                                    child: GestureDetector(
                                        onTap: (){
                                          setState(() {
                                              deleteimage1();
                                          });
                                        },
                                        child: Container(padding: EdgeInsets.all(2),child: Icon(Icons.close_rounded,color: Colors.white,size: 23,))
                                    )
                                ):Container(),
                              ]),
                        ),
                      ),
                    )
                ),
                AbsorbPointer(
                  absorbing: urll1==null?true:false,
                  child: urll1==null?
                  Container(
                    decoration: BoxDecoration(color: Colors.grey[200],
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],),
                    width: 100,
                    height: 150,
                  )
                      :GestureDetector(
                      onTap: () {
                        urll2 == null?_showPicker2(context):(){};
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 1.0), //(x,y)
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        child: urll2 == null ?
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            border: Border.all(color: Color(0xfffd436c),width: 4),
                          ),
                          width: 100,
                          height: 150,
                          child: Center(
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [Color(0xffFD297B), Color(0xffFF655B)]),
                              ),
                              child: Icon(
                                Icons.add_photo_alternate_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ):
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          child: Container(
                            child: Stack(
                                children: [Image.network(
                                  urll2,
                                  width: 100,
                                  height: 150,
                                  fit: BoxFit.cover,
                                ),
                                  Container(
                                      margin: EdgeInsets.only(left: 4,top: 4),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [Color(0xffFD297B), Color(0xffFF655B)]),
                                      ),
                                      child: GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              deleteimage2();
                                            });
                                          },
                                          child: Container(padding: EdgeInsets.all(2),child: Icon(Icons.close_rounded,color: Colors.white,size: 23,))
                                      )
                                  ),
                                ]),
                          ),
                        ),
                      )
                  ),
                ),
                AbsorbPointer(
                  absorbing: urll2==null?true:false,
                  child: urll2==null?
                  Container(
                    decoration: BoxDecoration(color: Colors.grey[200],
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],),
                    width: 100,
                    height: 150,
                  )
                      :GestureDetector(
                    onTap: () {
                      urll3 == null?_showPicker3(context):(){};
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: urll3 == null ?
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          border: Border.all(color: Color(0xfffd436c),width: 4),
                        ),
                        width: 100,
                        height: 150,
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [Color(0xffFD297B), Color(0xffFF655B)]),
                            ),
                            child: Icon(
                              Icons.add_photo_alternate_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ):
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Container(
                          child: Stack(
                              children: [Image.network(
                                urll3,
                                width: 100,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                                Container(
                                    margin: EdgeInsets.only(left: 4,top: 4),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [Color(0xffFD297B), Color(0xffFF655B)]),
                                    ),
                                    child: GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            deleteimage3();
                                            // _image3 = _image4;
                                            // _image4 = _image5;
                                            // _image5 = _image6;
                                            // _image6 = null;
                                          });
                                        },
                                        child: Container(padding: EdgeInsets.all(2),child: Icon(Icons.close_rounded,color: Colors.white,size: 23,))
                                    )
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
              Container(height: 25),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                AbsorbPointer(
                  absorbing: urll3==null?true:false,
                  child: urll3==null?
                  Container(
                    decoration: BoxDecoration(color: Colors.grey[200],
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],),
                    width: 100,
                    height: 150,
                  )
                      :GestureDetector(
                      onTap: () {
                        urll4 == null?_showPicker4(context):(){};
                      },
                      child:Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 1.0), //(x,y)
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        child: urll4 == null ?
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              border: Border.all(color: Color(0xfffd436c),width: 4),
                          ),
                          width: 100,
                          height: 150,
                          child: Center(
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [Color(0xffFD297B), Color(0xffFF655B)]),
                              ),
                              child: Icon(
                                Icons.add_photo_alternate_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ):
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          child: Container(
                            child: Stack(
                                children: [Image.network(
                                  urll4,
                                  width: 100,
                                  height: 150,
                                  fit: BoxFit.cover,
                                ),
                                  Container(
                                      margin: EdgeInsets.only(left: 4,top: 4),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [Color(0xffFD297B), Color(0xffFF655B)]),
                                      ),
                                      child: GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              deleteimage4();
                                            });
                                          },
                                          child: Container(padding: EdgeInsets.all(2),child: Icon(Icons.close_rounded,color: Colors.white,size: 23,))
                                      )
                                  ),
                                ]),
                          ),
                        ),
                      )
                  ),
                ),
                AbsorbPointer(
                  absorbing: urll4==null?true:false,
                  child: urll4==null?
                  Container(
                    decoration: BoxDecoration(color: Colors.grey[200],
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],),
                    width: 100,
                    height: 150,
                  )
                      :GestureDetector(
                    onTap: () {
                      urll5 == null?_showPicker5(context):(){};
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: urll5 == null ?
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          border: Border.all(color: Color(0xfffd436c),width: 4),
                        ),
                        width: 100,
                        height: 150,
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [Color(0xffFD297B), Color(0xffFF655B)]),
                            ),
                            child: Icon(
                              Icons.add_photo_alternate_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ):
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Container(
                          child: Stack(
                              children: [Image.network(
                                urll5,
                                width: 100,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                                Container(
                                    margin: EdgeInsets.only(left: 4,top: 4),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [Color(0xffFD297B), Color(0xffFF655B)]),
                                    ),
                                    child: GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            deleteimage5();
                                          });
                                        },
                                        child: Container(padding: EdgeInsets.all(2),child: Icon(Icons.close_rounded,color: Colors.white,size: 23,))
                                    )
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ),
                ),
                AbsorbPointer(
                  absorbing: urll5==null?true:false,
                  child: urll5==null?
                  Container(
                    decoration: BoxDecoration(color: Colors.grey[200],
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],),
                    width: 100,
                    height: 150,
                  )
                      :GestureDetector(
                    onTap: () {
                      urll6 == null?_showPicker6(context):(){};
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: urll6 == null ?
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          border: Border.all(color: Color(0xfffd436c),width: 4),
                        ),
                        width: 100,
                        height: 150,
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [Color(0xffFD297B), Color(0xffFF655B)]),
                            ),
                            child: Icon(
                              Icons.add_photo_alternate_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ):
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Container(
                          child: Stack(
                              children: [Image.network(
                                urll6,
                                width: 100,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                                Container(
                                    margin: EdgeInsets.only(left: 4,top: 4),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [Color(0xffFD297B), Color(0xffFF655B)]),
                                    ),
                                    child: GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            deleteimage6();
                                          });
                                        },
                                        child: Container(padding: EdgeInsets.all(2),child: Icon(Icons.close_rounded,color: Colors.white,size: 23,))
                                    )
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ),
                )
              ]),
              Container(height: 25),
            ])
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     home: Scaffold(
       body: SingleChildScrollView(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             toprow(context, width),
             SizedBox(height: 25),
             Container(
               margin: EdgeInsets.only(left: 20),
               child: Text("My basic info",
                   style: TextStyle(
                     fontFamily: 'Rubik',
                     color: Color(0xff333343),
                     fontSize: 20,
                     fontWeight: FontWeight.w500,
                     fontStyle: FontStyle.normal,
                     letterSpacing: 0.16,
                   )
               ),
             ),
             SizedBox(height: 10),
             Mybasicinfo(),
             SizedBox(height: 10),
             Container(
               margin: EdgeInsets.only(left: 20),
               child: Text("My Intrests",
                   style: TextStyle(
                     fontFamily: 'Rubik',
                     color: Color(0xff333343),
                     fontSize: 20,
                     fontWeight: FontWeight.w500,
                     fontStyle: FontStyle.normal,
                     letterSpacing: 0.16,
                   )
               ),
             ),
             SizedBox(height: 10),
             MyIntrests(),
             SizedBox(height: 10),
             Container(
               margin: EdgeInsets.only(left: 20),
               child: Text("Gallery",
                   style: TextStyle(
                     fontFamily: 'Rubik',
                     color: Color(0xff333343),
                     fontSize: 20,
                     fontWeight: FontWeight.w500,
                     fontStyle: FontStyle.normal,
                     letterSpacing: 0.16,
                   )
               ),
             ),
             SizedBox(height: 10),
             imagepick()
           ],
         ),
       ),
     ),
   );
  }
}