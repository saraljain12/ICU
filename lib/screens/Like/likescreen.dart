import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(LikeScreen());
}

Widget LikesYou(BuildContext context,double width,double height){
  return Column( mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 30),
        Text("You don't have any likes yet.",
          style: TextStyle(
            fontFamily: 'Rubik',
            color: Color(0xff333343),
            fontSize: 22,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          )
      ),
        SizedBox(height: 8),
        Text("Get your first match with the \nfeatures below!",
        style: TextStyle(
          fontFamily: 'Rubik',
          color: Color(0xff333343),
          fontSize: 18,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,


        )
    ),
        SizedBox(height: 20),
        Container(
        width: width*0.82,
        height: height*0.47,
        decoration: new BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(
              color: Color(0x29000000),
              offset: Offset(0,0),
              blurRadius: 6,
              spreadRadius: 0
          ) ]
        ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 15),
                  Image.asset("assets/icons/heart.png",height: width*0.3,width: width*0.3),
                  SizedBox(height: 10),
                  Text("Send unlimited likes",
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        color: Color(0xff333343),
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                      )
                  ),
                  SizedBox(height: 5),
                  Text("Increase your matches with unlimited likes",textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        color: Color(0xff333343),
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      )
                  ),
                  SizedBox(height: (height*0.4046-width*0.3)-107),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        width: (width*0.82)-2,
                        height: height*0.0654,
                        margin: EdgeInsets.only(bottom: 1),
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10)),
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
                            )
                        ),
                         child: Center(
                           child: Text("SEND UNLIMITED LIKES",
                            style: TextStyle(
                              fontFamily: 'Rubik',
                              color: Color(0xffffffff),
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                            )
                          ),
                         ),
                    ),
                  )
                ],
              ),
            ),
  ]);
}
Widget Intros(BuildContext context,double width,double height){
  return Column( mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 30),
        Text("Send Customised Intro's",
            style: TextStyle(
              fontFamily: 'Rubik',
              color: Color(0xff333343),
              fontSize: 22,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
            )
        ),
        SizedBox(height: 8),
        Text("Get your first match with the \nfeatures below!",
            style: TextStyle(
              fontFamily: 'Rubik',
              color: Color(0xff333343),
              fontSize: 18,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,


            )
        ),
        SizedBox(height: 20),
        Container(
          width: width*0.82,
          height: height*0.47,
          decoration: new BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [BoxShadow(
                  color: Color(0x29000000),
                  offset: Offset(0,0),
                  blurRadius: 6,
                  spreadRadius: 0
              ) ]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 15),
              CircleAvatar(
                radius: width*0.15,
                backgroundImage: AssetImage("assets/images/girl1.jpg"),
                backgroundColor: Colors.transparent,
              ),SizedBox(height: 2),
              SizedBox(height: 10),
              Text("Send Customised Intro's",
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    color: Color(0xff333343),
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                  )
              ),
              SizedBox(height: 5),
              Text("Increase your matches with unlimited Intro's",textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    color: Color(0xff333343),
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )
              ),
              SizedBox(height: (height*0.4046-width*0.3)-109),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: (width*0.82)-2,
                  height: height*0.0654,
                  margin: EdgeInsets.only(bottom: 1),
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10)),
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
                      )
                  ),
                  child: Center(
                    child: Text("GET PREMIUM",
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          color: Color(0xffffffff),
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                        )
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ]);
}
Widget YouLike(BuildContext context,double width,double height){
  return Column( mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 30),
        Text("People you like",
            style: TextStyle(
              fontFamily: 'Rubik',
              color: Color(0xff333343),
              fontSize: 22,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
            )
        ),
        SizedBox(height: 8),
        Text("Send unlimited likes",
            style: TextStyle(
              fontFamily: 'Rubik',
              color: Color(0xff333343),
              fontSize: 18,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            )
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Opacity(
              opacity: 0.5,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
              height: height*0.6,
                child: GridView.count(
                  crossAxisCount: 2 ,
                  children: List.generate(6,(index){
                    return Container(
                      child: Card(
                        child: Image.asset("assets/images/girl1.jpg",fit: BoxFit.cover,),
                      ),
                    );
                  }),
                ),
              ),
            ),
            Container(
            width: width*0.82,
            height: height*0.47,
            decoration: new BoxDecoration(
                color: Color(0xffffffff),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(
                    color: Color(0x29000000),
                    offset: Offset(0,0),
                    blurRadius: 6,
                    spreadRadius: 0
                ) ]
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    height: (width*0.4)+15,
                    padding: EdgeInsets.symmetric(vertical: width*0.1),
                    width: double.infinity,
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xfffffc00),
                            Color(0xffffc850) ],
                          stops: [
                            0,
                            1
                          ],
                          begin: Alignment(-0.00, -1.00),
                          end: Alignment(0.00, 1.00),
                        )
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                        height: 70,
                        width: 50,
                        child: SvgPicture.asset("assets/icons/lightning.svg",fit: BoxFit.scaleDown)
                    ),
                ),
                SizedBox(height: 10),
                Text("Get Boost",
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      color: Color(0xff333343),
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    )
                ),
                SizedBox(height: 5),
                Text("Boost yourself! Be the top profile in your area",textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      color: Color(0xff333343),
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )
                ),
                SizedBox(height: (height*0.4046-width*0.4)-107),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: (width*0.82)-2,
                    height: height*0.0654,
                    margin: EdgeInsets.only(bottom: 1),
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10)),
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
                        )
                    ),
                    child: Center(
                      child: Text("GET BOOST",
                          style: TextStyle(
                            fontFamily: 'Rubik',
                            color: Color(0xffffffff),
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                          )
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ]
        ),
      ]);
}

class LikeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("LOVE",
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      color: Color(0xff333343),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    )
                ),
                Container(
                    width: 104,
                    height: 30,
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(41),
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
                        // angle: 90,
                        // scale: undefined,
                      ),
                      boxShadow: [BoxShadow(
                          color: Color(0x29000000),
                          offset: Offset(0,0),
                          blurRadius: 2,
                          spreadRadius: 0

                      ) ],
                    ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              padding:EdgeInsets.only(top: 3.5,bottom: 3.5),
                              child: SvgPicture.asset("assets/icons/lightning.svg",color: Colors.white,width: 23,)),
                          Text("Boost",
                              style: TextStyle(
                                fontFamily: 'Rubik',
                                color: Color(0xffffffff),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                letterSpacing: 0.16
                              )
                          )
                        ],
                      )
                )
              ],
            ),
            backgroundColor: Colors.white,
            bottom: TabBar(
              indicatorColor: Color(0xfffd3972),
              tabs: [
                Tab(child: Text("LIKES YOU",
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      color: Color(0xff333343),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    )
                ),
                ),
                Tab(
                  child: Text("INTROS",
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      color: Color(0xff333343),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    )
                  ),
                ),
                Tab(
                  child: Text("YOU LIKES",
                 style: TextStyle(
                    fontFamily: 'Rubik',
                    color: Color(0xff333343),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                      )
                  ),
                ),
              ],
            ),

          ),
          body: TabBarView(
            children: [
              LikesYou(context, width, height),
              Intros(context, width, height),
              YouLike(context, width, height)
            ],
          ),
        ),
      ),
    );
  }
}