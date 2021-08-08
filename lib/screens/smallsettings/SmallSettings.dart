//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class smallsettings extends StatefulWidget {
  String appbartitle,heading,subheading;
  bool already;
  smallsettings({ this.appbartitle,this.heading,this.subheading,this.already});

  @override
  _smallsettingsState createState() => _smallsettingsState(appbartitle: appbartitle,heading: heading,subheading: subheading,already: already);

}
class _smallsettingsState extends State<smallsettings> {
  String appbartitle,heading,subheading;
  bool already;
  TextEditingController _controller = TextEditingController();
  String x;

  _smallsettingsState({ this.appbartitle,this.heading,this.subheading,this.already});

  @override
  Widget build(BuildContext context) {
    if(already){
      _controller.text = subheading;
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          automaticallyImplyLeading: true,
          leading: GestureDetector(
              onTap:()=> Navigator.pop(context),
              child: Icon(Icons.arrow_back_ios,color: Colors.black,)
          ),
          title: Text(heading,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 15,top: 10),
              child: Text(heading,
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
            Container(
              alignment: Alignment.center,
               margin: EdgeInsets.symmetric(horizontal: 2,vertical: 10),
               padding: EdgeInsets.symmetric(horizontal: 12),
               child: TextFormField(
                 style: TextStyle(fontSize: 18),
                 textAlign: TextAlign.start,
                 controller: _controller,
                 decoration: InputDecoration(
                   contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 15),
                   hintText: already?"":Text(subheading,style: TextStyle(color: Colors.grey),),
                   focusedBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.all(Radius.circular(50)),
                     borderSide: BorderSide(
                         color: Colors.pink,
                         width: 0.5
                     ),
                   ),
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.all(Radius.circular(50)),
                     borderSide: BorderSide(
                       color: Colors.grey,
                       width: 0.5,
                     ),
                   ),
                 ),
               ),
             ),
          ],
        ),
      )
    );
  }
}