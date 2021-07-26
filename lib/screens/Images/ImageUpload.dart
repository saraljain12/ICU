//@dart=2.9
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class ImageScreen extends StatefulWidget {
  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  File _image1,_image2,_image3,_image4,_image5,_image6;
  final _picker = ImagePicker();
  PickedFile image;
  TextEditingController _DescriptionController = TextEditingController();
  bool progress=false;

  _imgFromCamera1() async {
     image = await _picker.getImage(
        source: ImageSource.camera, imageQuality: 50
    );
    setState(() {
      _image1 = File(image.path);
    });
  }
  _imgFromGallery1() async {
    image = await  _picker.getImage(
        source: ImageSource.gallery, imageQuality: 50
    );
    setState(() {
      _image1 =File(image.path);
    });
  }
  _imgFromCamera2() async {
     image = await _picker.getImage(
        source: ImageSource.camera, imageQuality: 50
    );
    setState(() {
      _image2 = File(image.path);
    });
  }
  _imgFromGallery2() async {
     image = await  _picker.getImage(
        source: ImageSource.gallery, imageQuality: 50
    );

    setState(() {
      _image2 =File(image.path);
    });
  }
  _imgFromCamera3() async {
    final PickedFile image = await _picker.getImage(
        source: ImageSource.camera, imageQuality: 50
    );
    setState(() {
      _image3 = File(image.path);
    });
  }
  _imgFromGallery3() async {
    PickedFile image = await  _picker.getImage(
        source: ImageSource.gallery, imageQuality: 50
    );

    setState(() {
      _image3 =File(image.path);
    });
  }
  _imgFromCamera4() async {
    final PickedFile image = await _picker.getImage(
        source: ImageSource.camera, imageQuality: 50
    );
    setState(() {
      _image4 = File(image.path);
    });
  }
  _imgFromGallery4() async {
    PickedFile image = await  _picker.getImage(
        source: ImageSource.gallery, imageQuality: 50
    );

    setState(() {
      _image4 =File(image.path);
    });
  }
  _imgFromCamera5() async {
    final PickedFile image = await _picker.getImage(
        source: ImageSource.camera, imageQuality: 50
    );
    setState(() {
      _image5 = File(image.path);
    });
  }
  _imgFromGallery5() async {
    PickedFile image = await  _picker.getImage(
        source: ImageSource.gallery, imageQuality: 50
    );

    setState(() {
      _image5 =File(image.path);
    });
  }
  _imgFromCamera6() async {
    final PickedFile image = await _picker.getImage(
        source: ImageSource.camera, imageQuality: 50
    );
    setState(() {
      _image6 = File(image.path);
    });
  }
  _imgFromGallery6() async {
    PickedFile image = await  _picker.getImage(
        source: ImageSource.gallery, imageQuality: 50
    );

    setState(() {
      _image6 =File(image.path);
    });
  }

  Future<void> _doSomething() async {
    progress = true;
    final _fireStorage = FirebaseStorage.instance;
    final firebaseauth = FirebaseAuth.instance;
    String uid = firebaseauth.currentUser.uid;

   if(_image1!=null&&_image2!=null){
     DocumentReference docref =  FirebaseFirestore.instance.collection("Users").doc(
         FirebaseAuth.instance.currentUser.uid).collection("Information").doc("infor");

        await _fireStorage.ref().child('Images/$uid/image1').putFile(_image1).whenComplete(() async {
          String url1 = await _fireStorage.ref().child('Images/$uid/image1').getDownloadURL();
          await docref.update({"image1url" : url1});
        });

     await _fireStorage.ref().child('Images/$uid/image2').putFile(_image2).whenComplete(() async {
       String url1 = await _fireStorage.ref().child('Images/$uid/image2').getDownloadURL();
       await docref.update({"image2url" : url1});

     });
     if(_image3!=null){
         await _fireStorage.ref().child('Images/$uid/image3').putFile(_image3).whenComplete(() async {
           String url1 = await _fireStorage.ref().child('Images/$uid/image3').getDownloadURL();
           await docref.update({"image3url" : url1});
         });
     }
     if(_image4!=null){
       try{
           _fireStorage.ref().child('Images/$uid/image4').putFile(_image4).whenComplete(() async {
             String url1 = await _fireStorage.ref().child('Images/$uid/image4').getDownloadURL();
           await docref.update({"image3url" : url1});});
         }
        catch(Exception){
        Fluttertoast.showToast(msg: Exception.toString());
        }
     }
     if(_image5!=null){
       try{
            _fireStorage.ref().child('Images/$uid/image5').putFile(_image5).whenComplete(() async {
             String url5 = await _fireStorage.ref().child('Images/$uid/image5').getDownloadURL();
             await docref.update({"image5url" : url5});
         });
         }
        catch(Exception){
        Fluttertoast.showToast(msg: Exception.toString());
        }
     }
     if(_image6!=null){
       try{
            _fireStorage.ref().child('Images/$uid/image6').putFile(_image6).whenComplete(() async {
             String url6 =await  _fireStorage.ref().child('Images/$uid/image6').getDownloadURL();
             await docref.update({"image6url" : url6});

         });

       }
       catch(Exception){
         Fluttertoast.showToast(msg: Exception.toString());
       }
     }
     if(_DescriptionController.text.toString()!="null"){
       await docref.update({"Description":_DescriptionController.text});
     }
     progress = false;
     Navigator.pushReplacementNamed(context, '/QuestionScreen');
   }
   else{
     progress=false;
     Fluttertoast.showToast(msg: "Please select at least 2 images");
   }

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


  @override
  Widget build(BuildContext context) {
   return Material(
     child: (progress)?
     Opacity(
       opacity: 0.5,
       child: Stack(
           children: [
             Column(
               children: <Widget>[
                 SizedBox(
                   height: 32,
                 ),
                 Column(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children:[
                       Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                         GestureDetector(
                             onTap: () {
                               _image1 == null?_showPicker(context): (){};
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
                               child: _image1 == null ?
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
                                       children: [Image.file(
                                         _image1,
                                         width: 100,
                                         height: 150,
                                         fit: BoxFit.cover,
                                       ),
                                         Container(
                                             margin: EdgeInsets.only(left: 2,top: 2),
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
                                                     _image1 = _image2;
                                                     _image2 = _image3;
                                                     _image3 = _image4;
                                                     _image4 = _image5;
                                                     _image5 = _image6;
                                                     _image6 = null;
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
                         AbsorbPointer(
                           absorbing: _image1==null?true:false,
                           child: _image1==null?
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
                                 _image2 == null?_showPicker2(context):(){};
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
                                 child: _image2 == null ?
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
                                         children: [Image.file(
                                           _image2,
                                           width: 100,
                                           height: 150,
                                           fit: BoxFit.cover,
                                         ),
                                           Container(
                                               margin: EdgeInsets.only(left: 2,top: 2),
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
                                                       _image2 = _image3;
                                                       _image3 = _image4;
                                                       _image4 = _image5;
                                                       _image5 = _image6;
                                                       _image6 = null;
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
                           absorbing: _image2==null?true:false,
                           child: _image2==null?
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
                               _image3 == null?_showPicker3(context):(){};
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
                               child: _image3 == null ?
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
                                       children: [Image.file(
                                         _image3,
                                         width: 100,
                                         height: 150,
                                         fit: BoxFit.cover,
                                       ),
                                         Container(
                                             margin: EdgeInsets.only(left: 2,top: 2),
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
                                                     _image3 = _image4;
                                                     _image4 = _image5;
                                                     _image5 = _image6;
                                                     _image6 = null;
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
                           absorbing: _image3==null?true:false,
                           child: _image3==null?
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
                                 _image4 == null?_showPicker4(context):(){};
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
                                 child: _image4 == null ?
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
                                         children: [Image.file(
                                           _image4,
                                           width: 100,
                                           height: 150,
                                           fit: BoxFit.cover,
                                         ),
                                           Container(
                                               margin: EdgeInsets.only(left: 2,top: 2),
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
                                                       _image4 = _image5;
                                                       _image5 = _image6;
                                                       _image6 = null;
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
                           absorbing: _image4==null?true:false,
                           child: _image4==null?
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
                               _image5 == null?_showPicker5(context):(){};
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
                               child: _image5 == null ?
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
                                       children: [Image.file(
                                         _image5,
                                         width: 100,
                                         height: 150,
                                         fit: BoxFit.cover,
                                       ),
                                         Container(
                                             margin: EdgeInsets.only(left: 2,top: 2),
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
                                                     _image5 = _image6;
                                                     _image6 = null;
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
                           absorbing: _image5==null?true:false,
                           child: _image5==null?
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
                               _image6 == null?_showPicker6(context):(){};
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
                               child: _image6 == null ?
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
                                       children: [Image.file(
                                         _image6,
                                         width: 100,
                                         height: 150,
                                         fit: BoxFit.cover,
                                       ),
                                         Container(
                                             margin: EdgeInsets.only(left: 2,top: 2),
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
                                                     _image6 = null;
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
                       Container(
                         margin: EdgeInsets.symmetric(horizontal: 15),
                         child: TextFormField(
                           maxLines: 5,
                           controller: _DescriptionController,
                           keyboardType: TextInputType.multiline,
                           decoration: InputDecoration(
                             hintText: 'Description',
                             hintStyle: TextStyle(
                                 color: Colors.grey
                             ),
                             border: OutlineInputBorder(
                               borderRadius: BorderRadius.all(Radius.circular(20.0)),
                             ),
                           ),
                         ),
                       ),
                       Container(height: 25),
                       Container(
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(30),
                             gradient: LinearGradient(
                                 begin: Alignment.centerLeft,
                                 end: Alignment.centerRight,
                                 colors: [Color(0xfffd297b), Color(0xffff655b)]),

                             boxShadow: [BoxShadow(
                               color: Colors.grey,
                               offset: Offset(0.0, 1.0), //(x,y)
                               blurRadius: 6.0,
                             ),]
                         ),
                         width: 200,
                         height: 50,
                         child:TextButton(
                           onPressed: _doSomething,
                           child: Text('Continue',style: TextStyle(color: Colors.white),),
                         ),
                       ),
                     ])
               ],
             ),
             Center(child: CircularProgressIndicator(color: Colors.blue))
           ]),
     ):
       Column(
         children: <Widget>[
           SizedBox(
             height: 32,
           ),
           Column(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               crossAxisAlignment: CrossAxisAlignment.center,
               children:[

                 Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                   GestureDetector(
                       onTap: () {
                         _image1 == null?_showPicker(context): (){};
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
                         child: _image1 == null ?
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
                                 children: [Image.file(
                                   _image1,
                                   width: 100,
                                   height: 150,
                                   fit: BoxFit.cover,
                                 ),
                                   Container(
                                       margin: EdgeInsets.only(left: 2,top: 2),
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
                                               _image1 = _image2;
                                               _image2 = _image3;
                                               _image3 = _image4;
                                               _image4 = _image5;
                                               _image5 = _image6;
                                               _image6 = null;
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
                   AbsorbPointer(
                     absorbing: _image1==null?true:false,
                     child: _image1==null?
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
                           _image2 == null?_showPicker2(context):(){};
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
                           child: _image2 == null ?
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
                                   children: [Image.file(
                                     _image2,
                                     width: 100,
                                     height: 150,
                                     fit: BoxFit.cover,
                                   ),
                                     Container(
                                         margin: EdgeInsets.only(left: 2,top: 2),
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
                                                 _image2 = _image3;
                                                 _image3 = _image4;
                                                 _image4 = _image5;
                                                 _image5 = _image6;
                                                 _image6 = null;
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
                     absorbing: _image2==null?true:false,
                     child: _image2==null?
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
                         _image3 == null?_showPicker3(context):(){};
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
                         child: _image3 == null ?
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
                                 children: [Image.file(
                                   _image3,
                                   width: 100,
                                   height: 150,
                                   fit: BoxFit.cover,
                                 ),
                                   Container(
                                       margin: EdgeInsets.only(left: 2,top: 2),
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
                                               _image3 = _image4;
                                               _image4 = _image5;
                                               _image5 = _image6;
                                               _image6 = null;
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
                     absorbing: _image3==null?true:false,
                     child: _image3==null?
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
                           _image4 == null?_showPicker4(context):(){};
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
                           child: _image4 == null ?
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
                                   children: [Image.file(
                                     _image4,
                                     width: 100,
                                     height: 150,
                                     fit: BoxFit.cover,
                                   ),
                                     Container(
                                         margin: EdgeInsets.only(left: 2,top: 2),
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
                                                 _image4 = _image5;
                                                 _image5 = _image6;
                                                 _image6 = null;
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
                     absorbing: _image4==null?true:false,
                     child: _image4==null?
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
                         _image5 == null?_showPicker5(context):(){};
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
                         child: _image5 == null ?
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
                                 children: [Image.file(
                                   _image5,
                                   width: 100,
                                   height: 150,
                                   fit: BoxFit.cover,
                                 ),
                                   Container(
                                       margin: EdgeInsets.only(left: 2,top: 2),
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
                                               _image5 = _image6;
                                               _image6 = null;
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
                     absorbing: _image5==null?true:false,
                     child: _image5==null?
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
                         _image6 == null?_showPicker6(context):(){};
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
                         child: _image6 == null ?
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
                                 children: [Image.file(
                                   _image6,
                                   width: 100,
                                   height: 150,
                                   fit: BoxFit.cover,
                                 ),
                                   Container(
                                       margin: EdgeInsets.only(left: 2,top: 2),
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
                                               _image6 = null;
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
                 Container(
                   margin: EdgeInsets.symmetric(horizontal: 15),
                   child: TextFormField(
                     maxLines: 5,
                     controller: _DescriptionController,
                     keyboardType: TextInputType.multiline,
                     decoration: InputDecoration(
                       hintText: 'Description',
                       hintStyle: TextStyle(
                           color: Colors.grey
                       ),
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.all(Radius.circular(20.0)),
                       ),
                     ),
                   ),
                 ),
                 Container(height: 25),
                 Container(
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(30),
                       gradient: LinearGradient(
                           begin: Alignment.centerLeft,
                           end: Alignment.centerRight,
                           colors: [Color(0xfffd297b), Color(0xffff655b)]),

                       boxShadow: [BoxShadow(
                         color: Colors.grey,
                         offset: Offset(0.0, 1.0), //(x,y)
                         blurRadius: 6.0,
                       ),]
                   ),
                   width: 200,
                   height: 50,
                   child:TextButton(
                     onPressed: _doSomething,
                     child: Text('Continue',style: TextStyle(color: Colors.white),),
                   ),
                 ),
               ])
         ],
       )


     ,
   );
  }

}