import 'package:chatapp_new/ProfilePage/FriendsProfile/FriendDetailsPage/friendDetailsPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:async';

import '../../../main.dart';

class FriendProfileNewPage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<FriendProfileNewPage> {
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
                          "Profile",
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
                  image: AssetImage("assets/images/man.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: null,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.3)),
              child: null,
            ),
            // Container(
            //   width: MediaQuery.of(context).size.width,
            //   margin: EdgeInsets.only(top: 70),
            //   decoration: BoxDecoration(color: Colors.black.withOpacity(0.3), borderRadius: BorderRadius.only(
            //           topLeft: Radius.circular(25),
            //           topRight: Radius.circular(25))),
            //   child: null,
            // ),
            Container(
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0))),
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25))),
                        margin: EdgeInsets.only(top: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(top: 20, left: 20),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        "John Smith",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontFamily: 'Oswald',
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                  ],
                                )),
                            Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(top: 0, left: 20),
                                child: Text(
                                  "34 mutual friends",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 13,
                                      fontFamily: 'Oswald',
                                      fontWeight: FontWeight.w300),
                                )),
                            Row(
                              children: <Widget>[
                                Container(
                                  width: 30,
                                  margin: EdgeInsets.only(top: 10, left: 20),
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
                                          width: 0.5, color: Colors.white)),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: 10, left: 20, right: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        Stack(
                                          children: <Widget>[
                                            Container(
                                              margin:
                                                  EdgeInsets.only(left: 0),
                                              height: 50,
                                              //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                              padding: EdgeInsets.all(10.0),
                                              child: Icon(
                                                Icons.chat,
                                                color: header,
                                                size: 15,
                                              ),
                                              decoration: new BoxDecoration(
                                                color: header, // border color
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                            Container(
                                              margin:
                                                  EdgeInsets.only(left: 0),
                                              height: 50,
                                              //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                              padding: EdgeInsets.all(10.0),
                                              child: Icon(
                                                Icons.chat,
                                                color: header,
                                                size: 15,
                                              ),
                                              decoration: new BoxDecoration(
                                                color: sub_white.withOpacity(
                                                    0.7), // border color
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text("Message",
                                            style: TextStyle(
                                                color: header,
                                                fontFamily: "Oswald",
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400))
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
                                            color:
                                                Colors.white.withOpacity(0.6),
                                                size: 15,
                                          ),
                                          decoration: new BoxDecoration(
                                            color: Colors.grey.withOpacity(
                                                0.7), // border color
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        Text("Write something",
                                            style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.8),
                                                fontFamily: "Oswald",
                                                fontSize: 12))
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
                                            Icons.person_pin,
                                            color:
                                                Colors.white.withOpacity(0.6),
                                                size: 15,
                                          ),
                                          decoration: new BoxDecoration(
                                            color: Colors.grey.withOpacity(
                                                0.7), // border color
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                              margin: EdgeInsets.only(left: 15),
                                              child: Text("Unfriend",
                                                  style: TextStyle(
                                                      color: Colors.white
                                                          .withOpacity(0.8),
                                                      fontFamily: "Oswald",
                                                      fontSize: 12)),
                                            ),
                                                    Icon(Icons.arrow_drop_down, color: Colors.white, size: 14,)
                                          ],
                                        )
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
                                            Icons.add,
                                            color:
                                                Colors.white.withOpacity(0.6),
                                                size: 15,
                                          ),
                                          decoration: new BoxDecoration(
                                            color: Colors.grey.withOpacity(
                                                0.7), // border color
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        Text("Add to group",
                                            style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.8),
                                                fontFamily: "Oswald",
                                                fontSize: 12))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10, top: 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                //mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  // Expanded(
                                  //   child: GestureDetector(
                                  //     onTap: () {
                                  //       // Navigator.push(
                                  //       //   context,
                                  //       //   MaterialPageRoute(
                                  //       //       builder: (context) => LoginPage()),
                                  //       // );
                                  //     },
                                  //     child: Container(
                                  //         padding: EdgeInsets.all(10),
                                  //         margin: EdgeInsets.only(
                                  //             left: 20, right: 5),
                                  //         decoration: BoxDecoration(
                                  //             color: header,
                                  //             borderRadius: BorderRadius.all(
                                  //                 Radius.circular(15))),
                                  //         child: Text(
                                  //           "Login",
                                  //           style: TextStyle(
                                  //             color: Colors.white,
                                  //             fontSize: 17,
                                  //             fontFamily: 'BebasNeue',
                                  //           ),
                                  //           textAlign: TextAlign.center,
                                  //         )),
                                  //   ),
                                  // ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  FriendsProfilePage()),
                                        );
                                      },
                                      child: Container(
                                          padding: EdgeInsets.all(10),
                                          margin: EdgeInsets.only(
                                              left: 20, right: 20, top: 0,bottom: 10),
                                          decoration: BoxDecoration(
                                              color: back_new,
                                              // boxShadow: [
                                              //   BoxShadow(
                                              //     blurRadius: 5.0,
                                              //     color: Colors.black.withOpacity(.5),
                                              //     //offset: Offset(6.0, 7.0),
                                              //   ),
                                              // ],
                                              border: Border.all(
                                                  color: Colors.grey,
                                                  width: 0.5),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15))),
                                          child: Text(
                                            "View Profile",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontFamily: 'BebasNeue',
                                              fontWeight: FontWeight.bold
                                            ),
                                            textAlign: TextAlign.center,
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
