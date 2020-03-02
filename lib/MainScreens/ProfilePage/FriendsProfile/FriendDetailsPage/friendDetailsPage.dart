import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:async';

import '../../../../main.dart';

class FriendsProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<FriendsProfilePage> {
  SharedPreferences sharedPreferences;
  String theme = "";
  Timer _timer;
  int _start = 3;
  bool loading = true;

  @override
  void initState() {
    sharedPrefcheck();
    timerCheck();
    super.initState();
  }

  void sharedPrefcheck() async {
    sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
      theme = sharedPreferences.getString("theme");
    });
    //print(theme);
  }

  void timerCheck() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
            setState(() {
              loading = false;
            });
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          //automaticallyImplyLeading: false,
          backgroundColor: Colors.black.withOpacity(0.5),
          title: Container(
            margin: EdgeInsets.only(top: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 5, right: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      //color: Colors.black.withOpacity(0.5),
                    ),
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Profile Details",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Oswald',
                              fontWeight: FontWeight.normal),
                        )),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[],
        ),
        body: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: theme == "1" || theme == null
                      ? AssetImage("assets/images/f4.jpg")
                      : theme == "2"
                          ? AssetImage("assets/images/f.jpg")
                          : theme == "3"
                              ? AssetImage("assets/images/f6.jpg")
                              : theme == "4"
                                  ? AssetImage("assets/images/f5.jpg")
                                  : theme == "5"
                                      ? AssetImage("assets/images/friend8.jpg")
                                      : theme == "6"
                                          ? AssetImage("assets/images/f2.jpg")
                                          : theme == "7"
                                              ? AssetImage(
                                                  "assets/images/f9.jpg")
                                              : theme == "8"
                                                  ? AssetImage(
                                                      "assets/images/f10.png")
                                                  : theme == "9"
                                                      ? AssetImage(
                                                          "assets/images/pattern1.jpg")
                                                      : theme == "10"
                                                          ? AssetImage(
                                                              "assets/images/pattern2.jpg")
                                                          : AssetImage(
                                                              "assets/images/white.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: null,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5)),
              child: null,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.4)),
              child: null,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0))),
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverToBoxAdapter(
                      child: SingleChildScrollView(
                    child: Container(
                        child: Column(
                      children: <Widget>[
                        SafeArea(
                          child: Stack(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Container(
                                      height: 200,
                                      padding: const EdgeInsets.all(0.0),
                                      margin: EdgeInsets.only(
                                          top: 15, left: 15, right: 15),
                                      decoration: BoxDecoration(
                                          //color: header,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(15),
                                              topRight: Radius.circular(15)),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/f7.jpg'),
                                              fit: BoxFit.cover)),
                                      child: null),
                                  Container(
                                      height: 200,
                                      padding: const EdgeInsets.all(0.0),
                                      margin: EdgeInsets.only(
                                          top: 15, left: 15, right: 15),
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.2),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15)),
                                      ),
                                      child: null),
                                ],
                              ),
                              Center(
                                child: Container(
                                  margin: EdgeInsets.only(right: 0, top: 135),
                                  //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                  padding: EdgeInsets.all(5.0),
                                  child: CircleAvatar(
                                    radius: 65.0,
                                    backgroundColor: Colors.transparent,
                                    backgroundImage:
                                        AssetImage('assets/images/man.png'),
                                  ),
                                  decoration: new BoxDecoration(
                                    color: Colors.grey[300], // border color
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            margin:
                                EdgeInsets.only(top: 10, right: 20, left: 20),
                            child: Text(
                              "David Ryan",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Oswald",
                                  color: Colors.white),
                            )),
                        Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Text(
                              "Simple guy with a big heart",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: "Oswald"),
                            )),
                        // Container(
                        //   margin: EdgeInsets.only(top: 5),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //     children: <Widget>[
                        //       Expanded(
                        //         child: Container(
                        //           margin: EdgeInsets.only(
                        //               left: 15, top: 15, right: 5),
                        //           padding: EdgeInsets.all(5.0),
                        //           decoration: new BoxDecoration(
                        //               color: header.withOpacity(0.8),
                        //               border:
                        //                   Border.all(width: 0.5, color: header),
                        //               borderRadius:
                        //                   BorderRadius.all(Radius.circular(5))),
                        //           child: Row(
                        //             mainAxisAlignment: MainAxisAlignment.center,
                        //             children: <Widget>[
                        //               Icon(
                        //                 Icons.label_important,
                        //                 color: Colors.white,
                        //                 size: 15,
                        //               ),
                        //               Container(
                        //                 margin: EdgeInsets.only(left: 5),
                        //                 child: Text(
                        //                   "Timeline",
                        //                   style: TextStyle(
                        //                       color: Colors.white,
                        //                       fontFamily: "Oswald",
                        //                       fontWeight: FontWeight.w300,
                        //                       fontSize: 14),
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       ),
                        //       Expanded(
                        //         child: Container(
                        //           margin: EdgeInsets.only(
                        //               left: 5, right: 5, top: 15),
                        //           padding: EdgeInsets.all(5.0),
                        //           decoration: new BoxDecoration(
                        //               color: back_new.withOpacity(0.8),
                        //               border: Border.all(
                        //                   width: 0.5, color: Colors.white),
                        //               borderRadius:
                        //                   BorderRadius.all(Radius.circular(5))),
                        //           child: Row(
                        //             mainAxisAlignment: MainAxisAlignment.center,
                        //             children: <Widget>[
                        //               Icon(
                        //                 Icons.info_outline,
                        //                 color: Colors.black,
                        //                 size: 15,
                        //               ),
                        //               Container(
                        //                 margin: EdgeInsets.only(left: 5),
                        //                 child: Text(
                        //                   "About",
                        //                   style: TextStyle(
                        //                       color: Colors.black,
                        //                       fontFamily: "Oswald",
                        //                       fontWeight: FontWeight.w300,
                        //                       fontSize: 14),
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       ),
                        //       Expanded(
                        //         child: Container(
                        //           margin: EdgeInsets.only(
                        //               left: 5, right: 15, top: 15),
                        //           padding: EdgeInsets.all(5.0),
                        //           decoration: new BoxDecoration(
                        //               color: back_new.withOpacity(0.8),
                        //               border: Border.all(
                        //                   width: 0.5, color: Colors.white),
                        //               borderRadius:
                        //                   BorderRadius.all(Radius.circular(5))),
                        //           child: Row(
                        //             mainAxisAlignment: MainAxisAlignment.center,
                        //             children: <Widget>[
                        //               Icon(
                        //                 Icons.group,
                        //                 color: Colors.black,
                        //                 size: 17,
                        //               ),
                        //               Container(
                        //                 margin: EdgeInsets.only(left: 5),
                        //                 child: Text(
                        //                   "Friends",
                        //                   style: TextStyle(
                        //                       color: Colors.black,
                        //                       fontFamily: "Oswald",
                        //                       fontWeight: FontWeight.w300,
                        //                       fontSize: 14),
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // Container(
                        //   margin: EdgeInsets.only(top: 0),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //     children: <Widget>[
                        //       Expanded(
                        //         child: Container(
                        //           margin: EdgeInsets.only(
                        //               left: 15, top: 10, right: 5),
                        //           padding: EdgeInsets.all(5.0),
                        //           decoration: new BoxDecoration(
                        //               color: back_new.withOpacity(0.8),
                        //               border: Border.all(
                        //                   width: 0.5, color: Colors.white),
                        //               borderRadius:
                        //                   BorderRadius.all(Radius.circular(5))),
                        //           child: Row(
                        //             mainAxisAlignment: MainAxisAlignment.center,
                        //             children: <Widget>[
                        //               Icon(
                        //                 Icons.photo,
                        //                 color: Colors.black,
                        //                 size: 15,
                        //               ),
                        //               Container(
                        //                 margin: EdgeInsets.only(left: 5),
                        //                 child: Text(
                        //                   "Photos",
                        //                   style: TextStyle(
                        //                       color: Colors.black,
                        //                       fontFamily: "Oswald",
                        //                       fontWeight: FontWeight.w300,
                        //                       fontSize: 14),
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       ),
                        //       Expanded(
                        //         child: Container(
                        //           margin: EdgeInsets.only(
                        //               left: 5, right: 5, top: 10),
                        //           padding: EdgeInsets.all(5.0),
                        //           decoration: new BoxDecoration(
                        //               color: back_new.withOpacity(0.8),
                        //               border: Border.all(
                        //                   width: 0.5, color: Colors.white),
                        //               borderRadius:
                        //                   BorderRadius.all(Radius.circular(5))),
                        //           child: Row(
                        //             mainAxisAlignment: MainAxisAlignment.center,
                        //             children: <Widget>[
                        //               Icon(
                        //                 Icons.event_available,
                        //                 color: Colors.black,
                        //                 size: 15,
                        //               ),
                        //               Container(
                        //                 margin: EdgeInsets.only(left: 5),
                        //                 child: Text(
                        //                   "Events",
                        //                   style: TextStyle(
                        //                       color: Colors.black,
                        //                       fontFamily: "Oswald",
                        //                       fontWeight: FontWeight.w300,
                        //                       fontSize: 14),
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       ),
                        //       Expanded(
                        //         child: Container(
                        //           margin: EdgeInsets.only(
                        //               left: 5, right: 15, top: 10),
                        //           padding: EdgeInsets.all(5.0),
                        //           decoration: new BoxDecoration(
                        //               color: back_new.withOpacity(0.8),
                        //               border: Border.all(
                        //                   width: 0.5, color: Colors.white),
                        //               borderRadius:
                        //                   BorderRadius.all(Radius.circular(5))),
                        //           child: Row(
                        //             mainAxisAlignment: MainAxisAlignment.center,
                        //             children: <Widget>[
                        //               Icon(
                        //                 Icons.more_horiz,
                        //                 color: Colors.black,
                        //                 size: 17,
                        //               ),
                        //               Container(
                        //                 margin: EdgeInsets.only(left: 5),
                        //                 child: Text(
                        //                   "More",
                        //                   style: TextStyle(
                        //                       color: Colors.black,
                        //                       fontFamily: "Oswald",
                        //                       fontWeight: FontWeight.w300,
                        //                       fontSize: 14),
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        Container(
                          margin: EdgeInsets.only(top: 30, left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Stack(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(left: 0),
                                          height: 50,
                                          //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                          padding: EdgeInsets.all(5.0),
                                          child: Icon(
                                            Icons.add,
                                            color: header,
                                          ),
                                          decoration: new BoxDecoration(
                                            color: header, // border color
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 0),
                                          height: 50,
                                          //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                          padding: EdgeInsets.all(5.0),
                                          child: Icon(
                                            Icons.add,
                                            color: header,
                                          ),
                                          decoration: new BoxDecoration(
                                            color: sub_white.withOpacity(
                                                0.7), // border color
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text("Add to story",
                                        style: TextStyle(
                                            color: header,
                                            fontFamily: "Oswald",
                                            fontSize: 13))
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(left: 0),
                                      height: 50,
                                      //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                      padding: EdgeInsets.all(10.0),
                                      child: Icon(
                                        Icons.send,
                                        color: Colors.white.withOpacity(0.6),
                                        size: 15,
                                      ),
                                      decoration: new BoxDecoration(
                                        color: Colors.grey
                                            .withOpacity(0.7), // border color
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    Text("Create Post",
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.8),
                                            fontFamily: "Oswald",
                                            fontSize: 13))
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(left: 0),
                                      height: 50,
                                      //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                      padding: EdgeInsets.all(10.0),
                                      child: Icon(
                                        Icons.edit,
                                        color: Colors.white.withOpacity(0.6),
                                        size: 15,
                                      ),
                                      decoration: new BoxDecoration(
                                        color: Colors.grey
                                            .withOpacity(0.7), // border color
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    Text("Edit Profile",
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.8),
                                            fontFamily: "Oswald",
                                            fontSize: 13))
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(left: 0),
                                      height: 50,
                                      //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                      padding: EdgeInsets.all(5.0),
                                      child: Icon(
                                        Icons.more_horiz,
                                        color: Colors.white.withOpacity(0.6),
                                      ),
                                      decoration: new BoxDecoration(
                                        color: Colors.grey
                                            .withOpacity(0.7), // border color
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    Text("More",
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.8),
                                            fontFamily: "Oswald",
                                            fontSize: 13))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            width: 50,
                            margin: EdgeInsets.only(
                                top: 25, left: 25, right: 25, bottom: 0),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                color: header,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 1.0,
                                    color: header,
                                    //offset: Offset(6.0, 7.0),
                                  ),
                                ],
                                border: Border.all(width: 0.5, color: header))),
                        Container(
                          margin: EdgeInsets.only(left: 15, right: 15, top: 20),
                          child: Row(
                            children: <Widget>[
                              Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Icon(Icons.work,
                                      size: 17, color: Colors.white)),
                              Expanded(
                                child: Text.rich(
                                  TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text:
                                              "Former Android Application Developer at",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontFamily: "Oswald",
                                              fontWeight: FontWeight.w300)),
                                      TextSpan(
                                          text: " IT Lab Solutions Ltd",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontFamily: "Oswald",
                                              fontWeight: FontWeight.w400)),
                                      // can add more TextSpans here...
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15, right: 15, top: 10),
                          child: Row(
                            children: <Widget>[
                              Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Icon(Icons.work,
                                      size: 17, color: Colors.white)),
                              Expanded(
                                child: Text.rich(
                                  TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: "Former student at",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontFamily: "Oswald",
                                              fontWeight: FontWeight.w300)),
                                      TextSpan(
                                          text:
                                              " Computer Science and Engineering",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontFamily: "Oswald",
                                              fontWeight: FontWeight.w400)),
                                      // can add more TextSpans here...
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                          child: Row(
                            children: <Widget>[
                              Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Icon(Icons.book,
                                      size: 17, color: Colors.white)),
                              Expanded(
                                child: Text.rich(
                                  TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: "Studied at",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontFamily: "Oswald",
                                              fontWeight: FontWeight.w300)),
                                      TextSpan(
                                          text: " Leading University, Sylhet",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontFamily: "Oswald",
                                              fontWeight: FontWeight.w400)),
                                      // can add more TextSpans here...
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                          child: Row(
                            children: <Widget>[
                              Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Icon(Icons.book,
                                      size: 17, color: Colors.white)),
                              Expanded(
                                child: Text.rich(
                                  TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: "Studied at",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontFamily: "Oswald",
                                              fontWeight: FontWeight.w300)),
                                      TextSpan(
                                          text: " MC College, Sylhet",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontFamily: "Oswald",
                                              fontWeight: FontWeight.w400)),
                                      // can add more TextSpans here...
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                          child: Row(
                            children: <Widget>[
                              Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Icon(Icons.book,
                                      size: 17, color: Colors.white)),
                              Expanded(
                                child: Text.rich(
                                  TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: "Studied at",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontFamily: "Oswald",
                                              fontWeight: FontWeight.w300)),
                                      TextSpan(
                                          text:
                                              " Sylhet Govt. Pilot High School, Sylhet",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontFamily: "Oswald",
                                              fontWeight: FontWeight.w400)),
                                      // can add more TextSpans here...
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                          child: Row(
                            children: <Widget>[
                              Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Icon(Icons.more_horiz,
                                      size: 17, color: Colors.white)),
                              Expanded(
                                child: Text.rich(
                                  TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: "See Your About Info",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontFamily: "Oswald",
                                              fontWeight: FontWeight.w300)),

                                      // can add more TextSpans here...
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Container(
                        //     alignment: Alignment.center,
                        //     width: MediaQuery.of(context).size.width,
                        //     padding: EdgeInsets.all(10),
                        //     decoration: BoxDecoration(
                        //         color: header.withOpacity(0.8),
                        //         borderRadius:
                        //             BorderRadius.all(Radius.circular(5))),
                        //     margin: EdgeInsets.all(15),
                        //     child: Text("Edit Public Details",
                        //         style: TextStyle(
                        //             color: Colors.white,
                        //             fontFamily: "Oswald",
                        //             fontWeight: FontWeight.w300,
                        //             fontSize: 16))),

                        // Container(
                        //     width: 50,
                        //     margin: EdgeInsets.only(
                        //         top: 25, left: 25, right: 25, bottom: 0),
                        //     decoration: BoxDecoration(
                        //         borderRadius:
                        //             BorderRadius.all(Radius.circular(15.0)),
                        //         color: header,
                        //         boxShadow: [
                        //           BoxShadow(
                        //             blurRadius: 1.0,
                        //             color: header,
                        //             //offset: Offset(6.0, 7.0),
                        //           ),
                        //         ],
                        //         border: Border.all(width: 0.5, color: header))),
                        // Container(
                        //   margin:
                        //       EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 10),
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: <Widget>[
                        //       Row(
                        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //         children: <Widget>[
                        //           Text("Friends",
                        //               style: TextStyle(
                        //                   color: Colors.black,
                        //                   fontWeight: FontWeight.bold,
                        //                   fontSize: 20)),
                        //           Text(
                        //             "All Friends",
                        //             style: TextStyle(color: header, fontSize: 17),
                        //           )
                        //         ],
                        //       ),
                        //       Container(
                        //         margin: EdgeInsets.only(top: 3),
                        //         child: Text(
                        //           "250 Friends",
                        //           style: TextStyle(color: Colors.black54, fontSize: 15),
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // ),
                        // // Container(
                        // //     alignment: Alignment.center,
                        // //     width: MediaQuery.of(context).size.width,
                        // //     padding: EdgeInsets.all(10),
                        // //     decoration: BoxDecoration(
                        // //         color: Colors.grey.withOpacity(0.2),
                        // //         borderRadius: BorderRadius.all(Radius.circular(5))),
                        // //     margin: EdgeInsets.all(10),
                        // //     child: Text("See All Friends",
                        // //         style: TextStyle(
                        // //             color: Colors.black,
                        // //             fontWeight: FontWeight.bold,
                        // //             fontSize: 16))),
                        // Container(
                        //     height: 2,
                        //     margin: EdgeInsets.only(top: 10, bottom: 20),
                        //     child: Divider(
                        //       color: Colors.grey[300],
                        //     )),
                        // Container(
                        //   margin:
                        //       EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 10),
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: <Widget>[
                        //       Row(
                        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //         children: <Widget>[
                        //           Text("Photos",
                        //               style: TextStyle(
                        //                   color: Colors.black,
                        //                   fontWeight: FontWeight.bold,
                        //                   fontSize: 20)),
                        //           Text(
                        //             "See Photos",
                        //             style: TextStyle(color: header, fontSize: 17),
                        //           )
                        //         ],
                        //       ),
                        //       Container(
                        //         margin: EdgeInsets.only(top: 3),
                        //         child: Text(
                        //           "12 Albums",
                        //           style: TextStyle(color: Colors.black54, fontSize: 15),
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // ),
                        // Container(
                        //     height: 2,
                        //     margin: EdgeInsets.only(top: 10, bottom: 20),
                        //     child: Divider(
                        //       color: Colors.grey[300],
                        //     )),
                        // Container(
                        //   margin:
                        //       EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 10),
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: <Widget>[
                        //       Row(
                        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //         children: <Widget>[
                        //           Text("Events",
                        //               style: TextStyle(
                        //                   color: Colors.black,
                        //                   fontWeight: FontWeight.bold,
                        //                   fontSize: 20)),
                        //           Text(
                        //             "See Events",
                        //             style: TextStyle(color: header, fontSize: 17),
                        //           )
                        //         ],
                        //       ),
                        //       Container(
                        //         margin: EdgeInsets.only(top: 3),
                        //         child: Text(
                        //           "3 Events This Week",
                        //           style: TextStyle(color: Colors.black54, fontSize: 15),
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // ),
                        // Container(
                        //     height: 2,
                        //     margin: EdgeInsets.only(top: 10, bottom: 20),
                        //     child: Divider(
                        //       color: Colors.grey[300],
                        //     )),
                        Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          //color: sub_white,
                          child: Container(
                            //color: Colors.white,
                            child: Column(
                              children: <Widget>[
                                Container(
                                    width: 50,
                                    margin: EdgeInsets.only(
                                        top: 20,
                                        left: 25,
                                        right: 25,
                                        bottom: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15.0)),
                                        color: header,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 1.0,
                                            color: header,
                                            //offset: Offset(6.0, 7.0),
                                          ),
                                        ],
                                        border: Border.all(
                                            width: 0.5, color: header))),
                                Column(
                                  children: <Widget>[
                                    Container(
                                        alignment: Alignment.centerLeft,
                                        margin:
                                            EdgeInsets.only(top: 15, left: 20),
                                        child: Text(
                                          "Friends",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontFamily: 'Oswald',
                                              fontWeight: FontWeight.normal),
                                        )),
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          width: 30,
                                          margin: EdgeInsets.only(
                                              top: 10, left: 20),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15.0)),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 3.0,
                                                  color: Colors.white,
                                                  //offset: Offset(6.0, 7.0),
                                                ),
                                              ],
                                              border: Border.all(
                                                  width: 0.5,
                                                  color: Colors.white)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                            alignment: Alignment.centerLeft,
                                            margin: EdgeInsets.only(
                                                top: 12, left: 20, bottom: 0),
                                            child: Text(
                                              "238 friends",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  color: Colors.white70,
                                                  fontSize: 13,
                                                  fontFamily: 'Oswald',
                                                  fontWeight: FontWeight.w400),
                                            )),
                                        GestureDetector(
                                          onTap: () {
                                            // Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //         builder: (context) => GroupAddPage()));
                                          },
                                          child: Container(
                                              alignment: Alignment.centerLeft,
                                              margin: EdgeInsets.only(
                                                  top: 12,
                                                  right: 20,
                                                  bottom: 0),
                                              child: Row(
                                                children: <Widget>[
                                                  Text(
                                                    "See all",
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        color: back_new,
                                                        fontSize: 13,
                                                        fontFamily: 'Oswald',
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  Container(
                                                    margin:
                                                        EdgeInsets.only(top: 3),
                                                    child: Icon(
                                                        Icons.chevron_right,
                                                        color: back_new,
                                                        size: 17),
                                                  )
                                                ],
                                              )),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
                  )),
                  SliverPadding(
                    padding: EdgeInsets.only(right: 20, left: 5),
                    sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 120.0,
                        mainAxisSpacing: 0.0,
                        crossAxisSpacing: 0.0,
                        childAspectRatio: 1.0,
                      ),
                      delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => HotelSearchPage()),
                            // );
                          },
                          child: new Container(
                            margin: EdgeInsets.only(
                                left: 15, right: 0, top: 5, bottom: 10),
                            padding: EdgeInsets.only(left: 0),
                            height: 100,
                            width: 90,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: index == 0
                                    ? AssetImage("assets/images/man.png")
                                    : index == 1
                                        ? AssetImage("assets/images/man2.jpg")
                                        : index == 2
                                            ? AssetImage(
                                                "assets/images/man.png")
                                            : index == 3
                                                ? AssetImage(
                                                    "assets/images/man2.jpg")
                                                : index == 4
                                                    ? AssetImage(
                                                        "assets/images/man.png")
                                                    : AssetImage(
                                                        "assets/images/man2.jpg"),
                                fit: BoxFit.cover,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3.0,
                                  color: Colors.black.withOpacity(.5),
                                  //offset: Offset(6.0, 7.0),
                                ),
                              ],
                              // border: Border.all(width: 0.2, color: Colors.grey)
                            ),
                            child: Stack(
                              children: <Widget>[
                                Container(
                                    margin: EdgeInsets.only(left: 0),
                                    padding: EdgeInsets.only(left: 0),
                                    height: 110,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.3),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                    )),
                                Container(
                                    alignment: Alignment.bottomLeft,
                                    margin: EdgeInsets.only(
                                        top: 10, left: 10, bottom: 5),
                                    child: Text(
                                      index == 0
                                          ? "Jason Jordan"
                                          : index == 1
                                              ? "John Smith"
                                              : index == 2
                                                  ? "David Ryan"
                                                  : index == 3
                                                      ? "Simon Wright"
                                                      : index == 4
                                                          ? "Mike Johnson"
                                                          : "Daniel Smith",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontFamily: 'Oswald',
                                          fontWeight: FontWeight.w300),
                                    )),
                              ],
                            ),
                          ),
                        );
                      }, childCount: loading ? 1 : 6),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            width: 50,
                            margin: EdgeInsets.only(
                                top: 20, left: 25, right: 25, bottom: 20),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                color: header,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 1.0,
                                    color: header,
                                    //offset: Offset(6.0, 7.0),
                                  ),
                                ],
                                border: Border.all(width: 0.5, color: header))),
                      ],
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.only(right: 20, left: 5),
                    sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200.0,
                        mainAxisSpacing: 0.0,
                        crossAxisSpacing: 0.0,
                        childAspectRatio: 1.0,
                      ),
                      delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => HotelSearchPage()),
                            // );
                          },
                          child: new Container(
                            margin: EdgeInsets.only(
                                left: 15, right: 0, top: 5, bottom: 10),
                            padding: EdgeInsets.only(left: 0),
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: index == 0
                                    ? AssetImage("assets/images/f6.jpg")
                                    : AssetImage("assets/images/f7.jpg"),
                                fit: BoxFit.cover,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3.0,
                                  color: Colors.black.withOpacity(.5),
                                  //offset: Offset(6.0, 7.0),
                                ),
                              ],
                              // border: Border.all(width: 0.2, color: Colors.grey)
                            ),
                            child: Stack(
                              children: <Widget>[
                                Container(
                                    margin: EdgeInsets.only(left: 0),
                                    padding: EdgeInsets.only(left: 0),
                                    height: 160,
                                    width: 170,
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.3),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                    )),
                                Container(
                                    alignment: Alignment.bottomLeft,
                                    margin: EdgeInsets.only(
                                        top: 10, left: 10, bottom: 5),
                                    child: Text(
                                      index == 0 ? "Photos" : "Events",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontFamily: 'Oswald',
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                          ),
                        );
                      }, childCount: 2),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                width: 50,
                                margin: EdgeInsets.only(
                                    top: 15, left: 25, right: 25, bottom: 10),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    color: header,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 1.0,
                                        color: header,
                                        //offset: Offset(6.0, 7.0),
                                      ),
                                    ],
                                    border:
                                        Border.all(width: 0.5, color: header))),
                          ],
                        ),
                        Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(top: 15, left: 20),
                            child: Text(
                              "Timeline",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Oswald',
                                  fontWeight: FontWeight.normal),
                            )),
                        Row(
                          children: <Widget>[
                            Container(
                              width: 30,
                              margin: EdgeInsets.only(
                                  top: 10, left: 20, bottom: 10),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 3.0,
                                      color: Colors.white,
                                      //offset: Offset(6.0, 7.0),
                                    ),
                                  ],
                                  border: Border.all(
                                      width: 0.5, color: Colors.white)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return loading == false
                          ? Container(
                              padding: EdgeInsets.only(top: 20, bottom: 10),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(15),
                                //border: Border.all(width: 0.8, color: Colors.grey[300]),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 1.0,
                                    color: Colors.black38,
                                    //offset: Offset(6.0, 7.0),
                                  ),
                                ],
                              ),
                              margin: EdgeInsets.only(
                                  top: 5, bottom: 5, left: 20, right: 20),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        //color: Colors.red,
                                        margin: EdgeInsets.only(
                                            left: 20, right: 20, top: 0),
                                        padding: EdgeInsets.only(right: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              margin:
                                                  EdgeInsets.only(right: 10),
                                              //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                              padding: EdgeInsets.all(1.0),
                                              child: CircleAvatar(
                                                radius: 20.0,
                                                backgroundColor: Colors.white,
                                                backgroundImage: index % 2 == 0
                                                    ? AssetImage(
                                                        'assets/images/man.png')
                                                    : AssetImage(
                                                        'assets/images/man2.jpg'),
                                              ),
                                              decoration: new BoxDecoration(
                                                color: Colors
                                                    .grey[300], // border color
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  index % 2 == 0
                                                      ? "John Smith"
                                                      : "David Ryan",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.white,
                                                      fontFamily: 'Oswald',
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(top: 3),
                                                  child: Text(
                                                    index % 2 == 0
                                                        ? "6 hr"
                                                        : "Aug 7 at 5:34 PM",
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontFamily: 'Oswald',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 11,
                                                        color: Colors.white54),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(right: 15),
                                          child: Icon(
                                            Icons.more_horiz,
                                            color: Colors.white60,
                                          )),
                                    ],
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(
                                          left: 20, right: 20, top: 20),
                                      child: index % 2 == 0
                                          ? Text(
                                              "Hello everyone! this is my first status. i have made a social app with flutter. i hope you will like it. \nThank you",
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400),
                                            )
                                          : Column(
                                              children: <Widget>[
                                                Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "Last week tour with friends",
                                                    textAlign:
                                                        TextAlign.justify,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                                Container(
                                                    //color: Colors.red,
                                                    height: 200,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            0.0),
                                                    margin: EdgeInsets.only(
                                                        top: 10),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                "assets/images/f6.jpg"),
                                                            fit: BoxFit.cover)),
                                                    child: null),
                                              ],
                                            )),
                                  Container(
                                      margin: EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                          bottom: 0,
                                          top: 10),
                                      child: Divider(
                                        color: Colors.grey[400],
                                      )),
                                  Container(
                                    margin: EdgeInsets.only(left: 20, top: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.all(3.0),
                                              child: Icon(
                                                index % 2 == 0
                                                    ? Icons.favorite
                                                    : Icons.favorite_border,
                                                size: 20,
                                                color: index % 2 == 0
                                                    ? Colors.redAccent
                                                    : Colors.white70,
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 3),
                                              child: Text(
                                                  index % 2 == 0
                                                      ? "200"
                                                      : "105",
                                                  style: TextStyle(
                                                      fontFamily: 'Oswald',
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: Colors.white70,
                                                      fontSize: 12)),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Container(
                                              margin: EdgeInsets.only(left: 15),
                                              padding: EdgeInsets.all(3.0),
                                              child: Icon(
                                                Icons.chat_bubble_outline,
                                                size: 20,
                                                color: Colors.white70,
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 3),
                                              child: Text(
                                                  index % 2 == 0 ? "123" : "89",
                                                  style: TextStyle(
                                                      fontFamily: 'Oswald',
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: Colors.white70,
                                                      fontSize: 12)),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Container(
                                              margin: EdgeInsets.only(left: 15),
                                              padding: EdgeInsets.all(3.0),
                                              child: Icon(
                                                Icons.send,
                                                size: 20,
                                                color: Colors.white70,
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 3),
                                              child: Text(
                                                  index % 2 == 0 ? "43" : "21",
                                                  style: TextStyle(
                                                      fontFamily: 'Oswald',
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: Colors.white70,
                                                      fontSize: 12)),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container(
                              padding: EdgeInsets.only(top: 20, bottom: 10),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(15),
                                //border: Border.all(width: 0.8, color: Colors.grey[300]),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 1.0,
                                    color: Colors.black38,
                                    //offset: Offset(6.0, 7.0),
                                  ),
                                ],
                              ),
                              margin: EdgeInsets.only(
                                  top: 5, bottom: 5, left: 10, right: 10),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        //color: Colors.red,
                                        margin: EdgeInsets.only(
                                            left: 20, right: 20, top: 0),
                                        padding: EdgeInsets.only(right: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              margin:
                                                  EdgeInsets.only(right: 10),
                                              //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                              padding: EdgeInsets.all(1.0),
                                              child: Shimmer.fromColors(
                                                baseColor: Colors.grey[700],
                                                highlightColor:
                                                    Colors.grey[500],
                                                child: CircleAvatar(
                                                  radius: 20.0,
                                                  //backgroundColor: Colors.white,
                                                ),
                                              ),
                                              decoration: new BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Shimmer.fromColors(
                                                  baseColor: Colors.grey[700],
                                                  highlightColor:
                                                      Colors.grey[500],
                                                  child: Container(
                                                    width: 100,
                                                    height: 22,
                                                    child: Container(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(top: 3),
                                                  child: Shimmer.fromColors(
                                                    baseColor: Colors.grey[700],
                                                    highlightColor:
                                                        Colors.grey[500],
                                                    child: Container(
                                                      width: 50,
                                                      height: 12,
                                                      child: Container(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                          margin: EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                              top: 20,
                                              bottom: 0),
                                          child: Shimmer.fromColors(
                                            baseColor: Colors.grey[700],
                                            highlightColor: Colors.grey[500],
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 10,
                                              child: Container(
                                                color: Colors.black,
                                              ),
                                            ),
                                          )),
                                      Container(
                                          margin: EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                              top: 2,
                                              bottom: 5),
                                          child: Shimmer.fromColors(
                                            baseColor: Colors.grey[700],
                                            highlightColor: Colors.grey[500],
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  100,
                                              height: 10,
                                              child: Container(
                                                color: Colors.black,
                                              ),
                                            ),
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            );
                    }, childCount: 2),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
