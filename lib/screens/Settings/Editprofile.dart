//@dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:icu/screens/smallsettings/SmallSettings.dart';
import 'package:icu/screens/smallsettings/genderscreen.dart';

class EditSettings extends StatefulWidget {
  @override
  _EditSettingsState createState() => _EditSettingsState();
}



class _EditSettingsState extends State<EditSettings> {
  String uid = FirebaseAuth.instance.currentUser.uid;
  String url,name,city,state,gender,description,height,university,job;
  int age;
  int _current = 0;
  bool verified = false;

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
        gender = data['gender'];
        description = data['Description'];
        height = data['height'];
        university = data['university'];
        job = data['job'];
      });
      Fluttertoast.showToast(msg: "aaaaaaa");
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
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15),
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
    );
  }
  Widget image(BuildContext context,double width,double height){
    return Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        width: width*0.549,
        height: height*0.36,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: (url!=null)?Image.network(url,fit: BoxFit.cover,):null,
        )
    );
  }





  @override
  Widget build(BuildContext context) {

   return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.white,
       centerTitle: true,
       automaticallyImplyLeading: true,
       leading: GestureDetector(
           onTap:()=> Navigator.pop(context),
           child: Icon(Icons.arrow_back_ios,color: Colors.black,)
       ),
       title: Text("Edit Profile",
           style: TextStyle(
             fontFamily: 'Rubik',
             color: Color(0xff333343),
             fontSize: 20,
             fontWeight: FontWeight.w500,
             fontStyle: FontStyle.normal,
           )
       ),
     ),
     body: (name!=null)?SingleChildScrollView(
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           toprow(context, MediaQuery.of(context).size.width),
           Center(child: image(context, MediaQuery.of(context).size.width, MediaQuery.of(context).size.height)),

           Container(
             margin: EdgeInsets.only(left: 20,top: 10),
             child: Text("Verification",
                 style: TextStyle(
                   fontFamily: 'Rubik',
                   color: Color(0xff333343),
                   fontSize: 18,
                   fontWeight: FontWeight.w600,
                   fontStyle: FontStyle.normal,
                   letterSpacing: 0.16,
                 )
             ),
           ),
           GestureDetector(
               onTap:(){
                 setState(() {
                   verified= true;
                 });
               },
               child: verified?Container(
                 height: 40,
                 margin: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                 padding: EdgeInsets.symmetric(horizontal: 12),

                 decoration: new BoxDecoration(
                     color: Color(0xfffe456b),
                     borderRadius: BorderRadius.circular(30),
                     border: Border.all(color: Color(0xffc7c7c8))
                 ),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text("Verified",
                         style: TextStyle(
                           fontFamily: 'Rubik',
                           color: Colors.white,
                           fontSize: 14,
                           fontWeight: FontWeight.w400,
                           fontStyle: FontStyle.normal,
                         )
                     ),
                     Icon(Icons.verified,size: 18,color: Colors.white,)
                   ],
                 ),
               ):Container(
                 height: 40,
                 margin: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                 padding: EdgeInsets.symmetric(horizontal: 12),

                 decoration: new BoxDecoration(
                     color: Color(0xffffffff),
                     borderRadius: BorderRadius.circular(30),
                     border: Border.all(color: Color(0xffc7c7c8))
                 ),
                 child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text("Verify Account",
                     style: TextStyle(
                       fontFamily: 'Rubik',
                       color: Color(0xff333343),
                       fontSize: 14,
                       fontWeight: FontWeight.w400,
                       fontStyle: FontStyle.normal,
                     )
                 ),
                 Icon(Icons.arrow_forward_ios_rounded,size: 18,)
               ],
             ),
           )
           ),

           Container(
             margin: EdgeInsets.only(left: 20,top: 10,bottom: 10),
             child: Text("My Basic Info",
                 style: TextStyle(
                   fontFamily: 'Rubik',
                   color: Color(0xff333343),
                   fontSize: 18,
                   fontWeight: FontWeight.w600,
                   fontStyle: FontStyle.normal,
                   letterSpacing: 0.16,
                 )
             ),
           ),

           Container(
             margin: EdgeInsets.only(left: 20,top: 10),
             child: Text("About $name",
                 style: TextStyle(
                   fontFamily: 'Rubik',
                   color: Color(0xff333343),
                   fontSize: 16,
                   fontWeight: FontWeight.w600,
                   fontStyle: FontStyle.normal,
                   letterSpacing: 0.16,
                 )
             ),
           ),
           GestureDetector(
               onTap:(){
                 Navigator.push(context,MaterialPageRoute(
                     builder:  (context) => smallsettings(appbartitle: "Description",heading:"Add Description",
                       subheading: (description==null||description.isEmpty)?"Add Your Description":"$description",
                       already: (description==null||description.isEmpty)?false:true,fieldname: "Description",numboard: false,)));
               },
               child: Container(
                 height: 40,
                 width: double.infinity,
                 margin: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                 padding: EdgeInsets.symmetric(horizontal: 12,),

                 decoration: new BoxDecoration(
                     color: Color(0xffffffff),
                     borderRadius: BorderRadius.circular(30),
                     border: Border.all(color: Color(0xffc7c7c8))
                 ),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     description.isEmpty?Text("Add Description",
                         style: TextStyle(
                           fontFamily: 'Rubik',
                           color: Colors.grey,
                           fontSize: 14,
                           fontWeight: FontWeight.w400,
                           fontStyle: FontStyle.normal,
                         )
                     ): Text("$description",
                         style: TextStyle(
                           fontFamily: 'Rubik',
                           color: Color(0xff333343),
                           fontSize: 14,
                           fontWeight: FontWeight.w400,
                           fontStyle: FontStyle.normal,
                         )
                     ),
                     Icon(Icons.arrow_forward_ios_rounded)
                   ],
                 ),
               )
           ),

           Container(
             margin: EdgeInsets.only(left: 20,top: 10),
             child: Text("Gender Identity",
                 style: TextStyle(
                   fontFamily: 'Rubik',
                   color: Color(0xff333343),
                   fontSize: 16,
                   fontWeight: FontWeight.w600,
                   fontStyle: FontStyle.normal,
                   letterSpacing: 0.16,
                 )
             ),
           ),
           GestureDetector(
               onTap:(){
                 Navigator.push(context,MaterialPageRoute(
                     builder:  (context) => genderscreen(appbartitle: "Gender",heading:"Select Your Gender",
                         fieldname: "gender",selected: "$gender",showme: false,)));
               },
               child: Container(
                 height: 40,
                 margin: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                 padding: EdgeInsets.symmetric(horizontal: 12),
                 decoration: new BoxDecoration(
                     color: Color(0xffffffff),
                     borderRadius: BorderRadius.circular(30),
                     border: Border.all(color: Color(0xffc7c7c8))
                 ),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text("$gender",
                         style: TextStyle(
                           fontFamily: 'Rubik',
                           color: Color(0xff333343),
                           fontSize: 14,
                           fontWeight: FontWeight.w400,
                           fontStyle: FontStyle.normal,
                         )
                     ),
                     Icon(Icons.arrow_forward_ios_rounded)
                   ],
                 ),
               )
           ),

           Container(
             margin: EdgeInsets.only(left: 20,top: 10),
             child: Text("Age",
                 style: TextStyle(
                   fontFamily: 'Rubik',
                   color: Color(0xff333343),
                   fontSize: 16,
                   fontWeight: FontWeight.w600,
                   fontStyle: FontStyle.normal,
                   letterSpacing: 0.16,
                 )
             ),
           ),
           GestureDetector(
               onTap:(){
                 Navigator.push(context,MaterialPageRoute(
                     builder:  (context) => smallsettings(appbartitle: "Age",heading:"Add your age",
                       subheading: (age==null||(String.fromCharCode(age).isEmpty))?"Enter Your Age(Years)":"$age",
                       already: (age==null||String.fromCharCode(age).isEmpty)?false:true,fieldname: "age",numboard: true,)));
               },
               child: Container(
                 height: 40,
                 margin: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                 padding: EdgeInsets.symmetric(horizontal: 12),

                 decoration: new BoxDecoration(
                     color: Color(0xffffffff),
                     borderRadius: BorderRadius.circular(30),
                     border: Border.all(color: Color(0xffc7c7c8))
                 ),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text("$age years",
                         style: TextStyle(
                           fontFamily: 'Rubik',
                           color: Color(0xff333343),
                           fontSize: 14,
                           fontWeight: FontWeight.w400,
                           fontStyle: FontStyle.normal,
                         )
                     ),
                     Icon(Icons.arrow_forward_ios_rounded)
                   ],
                 ),
               )
           ),

           Container(
             margin: EdgeInsets.only(left: 20,top: 10),
             child: Text("Height",
                 style: TextStyle(
                   fontFamily: 'Rubik',
                   color: Color(0xff333343),
                   fontSize: 16,
                   fontWeight: FontWeight.w600,
                   fontStyle: FontStyle.normal,
                   letterSpacing: 0.16,
                 )
             ),
           ),
           GestureDetector(
               onTap:(){
                 Navigator.push(context,MaterialPageRoute(
                     builder:  (context) => smallsettings(appbartitle: "Height",heading:"Add Height",
                       subheading: (height==null||height.isEmpty)?"Enter Your Height(cm)":"$height",
                       already: (height==null||height.isEmpty)?false:true,fieldname: "height",numboard: true,)));
               },
               child: Container(
                 height: 40,
                 margin: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                 padding: EdgeInsets.symmetric(horizontal: 12),

                 decoration: new BoxDecoration(
                     color: Color(0xffffffff),
                     borderRadius: BorderRadius.circular(30),
                     border: Border.all(color: Color(0xffc7c7c8))
                 ),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     (height==null||height.isEmpty)?Text("Add height",
                         style: TextStyle(
                           fontFamily: 'Rubik',
                           color: Colors.grey,
                           fontSize: 14,
                           fontWeight: FontWeight.w400,
                           fontStyle: FontStyle.normal,
                         )
                     ): Text("$height cm",
                         style: TextStyle(
                           fontFamily: 'Rubik',
                           color: Color(0xff333343),
                           fontSize: 14,
                           fontWeight: FontWeight.w400,
                           fontStyle: FontStyle.normal,
                         )
                     ),
                     Icon(Icons.arrow_forward_ios_rounded)
                    ],
                 ),
               )
           ),

           Container(
             margin: EdgeInsets.only(left: 20,top: 10,bottom: 10),
             child: Text("My Work & Education",
                 style: TextStyle(
                   fontFamily: 'Rubik',
                   color: Color(0xff333343),
                   fontSize: 18,
                   fontWeight: FontWeight.w600,
                   fontStyle: FontStyle.normal,
                   letterSpacing: 0.16,
                 )
             ),
           ),

           Container(
             margin: EdgeInsets.only(left: 20,top: 10),
             child: Text("Add University",
                 style: TextStyle(
                   fontFamily: 'Rubik',
                   color: Color(0xff333343),
                   fontSize: 16,
                   fontWeight: FontWeight.w600,
                   fontStyle: FontStyle.normal,
                   letterSpacing: 0.16,
                 )
             ),
           ),
           GestureDetector(
             onTap:(){
                 Navigator.push(context,MaterialPageRoute(
                     builder:  (context) => smallsettings(appbartitle: "Education",heading:"Add Education",subheading: (university==null||university.isEmpty)?"Add Your Instituion":"$university",already: (university==null||university.isEmpty)?false:true,fieldname: "university",numboard: false,)));
             },
               child: Container(
                 height: 40,
                 margin: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                 padding: EdgeInsets.symmetric(horizontal: 12),
                 decoration: new BoxDecoration(
                     color: Color(0xffffffff),
                     borderRadius: BorderRadius.circular(30),
                     border: Border.all(color: Color(0xffc7c7c8))
                 ),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     (university==null||university.isEmpty)?Text("Add University",
                         style: TextStyle(
                           fontFamily: 'Rubik',
                           color: Colors.grey,
                           fontSize: 14,
                           fontWeight: FontWeight.w400,
                           fontStyle: FontStyle.normal,
                         )
                     ): Text("$university",
                         style: TextStyle(
                           fontFamily: 'Rubik',
                           color: Color(0xff333343),
                           fontSize: 14,
                           fontWeight: FontWeight.w400,
                           fontStyle: FontStyle.normal,
                         )
                     ),
                     Icon(Icons.arrow_forward_ios_rounded)
                   ],
                 ),
               )
           ),

           Container(
             margin: EdgeInsets.only(left: 20,top: 10),
             child: Text("Occupation",
                 style: TextStyle(
                   fontFamily: 'Rubik',
                   color: Color(0xff333343),
                   fontSize: 16,
                   fontWeight: FontWeight.w600,
                   fontStyle: FontStyle.normal,
                   letterSpacing: 0.16,
                 )
             ),
           ),
           GestureDetector(
               onTap:(){
                 Navigator.push(context,MaterialPageRoute(
                     builder:  (context) => smallsettings(appbartitle: "Occupation",heading:"Add Occupation",
                       subheading: (job==null||job.isEmpty)?"Enter Your Occupation":"$job",
                       already: (job==null||job.isEmpty)?false:true,fieldname: "job",numboard: false,)));
               },
               child: Container(
                 height: 40,
                 margin: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                 padding: EdgeInsets.symmetric(horizontal: 12),

                 decoration: new BoxDecoration(
                     color: Color(0xffffffff),
                     borderRadius: BorderRadius.circular(30),
                     border: Border.all(color: Color(0xffc7c7c8))
                 ),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     (job==null||job.isEmpty)?Text("Add Your Occupation",
                         style: TextStyle(
                           fontFamily: 'Rubik',
                           color: Colors.grey,
                           fontSize: 14,
                           fontWeight: FontWeight.w400,
                           fontStyle: FontStyle.normal,
                         )
                     ): Text("$job",
                         style: TextStyle(
                           fontFamily: 'Rubik',
                           color: Color(0xff333343),
                           fontSize: 14,
                           fontWeight: FontWeight.w400,
                           fontStyle: FontStyle.normal,
                         )
                     ),
                     Icon(Icons.arrow_forward_ios_rounded)
                   ],
                 ),
               )
           ),

           // Container(
           //   margin: EdgeInsets.only(left: 20,top: 10),
           //   child: Text("My Location",
           //       style: TextStyle(
           //         fontFamily: 'Rubik',
           //         color: Color(0xff333343),
           //         fontSize: 16,
           //         fontWeight: FontWeight.w600,
           //         fontStyle: FontStyle.normal,
           //         letterSpacing: 0.16,
           //       )
           //   ),
           // ),
           // GestureDetector(
           //   // onTap:(){
           //   //   setState(() {
           //   //     verified= true;
           //   //   });
           //   // },
           //     child: Container(
           //       height: 40,
           //       margin: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
           //       padding: EdgeInsets.symmetric(horizontal: 12),
           //
           //       decoration: new BoxDecoration(
           //           color: Color(0xffffffff),
           //           borderRadius: BorderRadius.circular(30),
           //           border: Border.all(color: Color(0xffc7c7c8))
           //       ),
           //       child: Row(
           //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
           //         children: [
           //           Text("Current Location",
           //               style: TextStyle(
           //                 fontFamily: 'Rubik',
           //                 color: Color(0xff333343),
           //                 fontSize: 14,
           //                 fontWeight: FontWeight.w400,
           //                 fontStyle: FontStyle.normal,
           //               )
           //           ),
           //           Text ("$city,$state",
           //               style: TextStyle(
           //                 fontFamily: 'Rubik',
           //                 color: Color(0xff333343),
           //                 fontSize: 14,
           //                 fontWeight: FontWeight.w400,
           //                 fontStyle: FontStyle.normal,
           //               )
           //           ),
           //
           //         ],
           //       ),
           //     )
           // ),

         ],
       ),
     ):Container(),
   );
  }
}