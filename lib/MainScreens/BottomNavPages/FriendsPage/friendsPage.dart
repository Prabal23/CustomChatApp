import 'package:chatapp_new/MainScreens/ChatPage/ChattingPage/chattingPage.dart';
import 'package:chatapp_new/MainScreens/FriendListPage/friendListPage.dart';
import 'package:chatapp_new/MainScreens/FriendRequestPage/friendRequestPage.dart';
import 'package:chatapp_new/MainScreens/FriendSuggestionPage/friendSuggestionPage.dart';
import 'package:chatapp_new/MainScreens/ProfilePage/FriendsProfile/FriendMainPage/friendsProfile.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:async';

import '../../../main.dart';

class FriendsPage extends StatefulWidget {
  @override
  FriendsPageState createState() => FriendsPageState();
}

class FriendsPageState extends State<FriendsPage> {
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
      //backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: background == "1"
                    ? color == "1"
                        ? AssetImage("assets/images/black.jpg")
                        : AssetImage("assets/images/white.jpg")
                    : theme == "1" || theme == null
                        ? AssetImage("assets/images/f4.jpg")
                        : theme == "2"
                            ? AssetImage("assets/images/f.jpg")
                            : theme == "3"
                                ? AssetImage("assets/images/f6.jpg")
                                : theme == "4"
                                    ? AssetImage("assets/images/f5.jpg")
                                    : theme == "5"
                                        ? AssetImage(
                                            "assets/images/friend8.jpg")
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
            decoration: BoxDecoration(
                color: color == "1"
                    ? Colors.black.withOpacity(0.3)
                    : Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0), topRight: Radius.circular(0))),
            margin: EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 0),
            child: CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Column(
                    children: <Widget>[
                      Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(top: 15, left: 20),
                          child: Text(
                            "Requests",
                            style: TextStyle(
                                color: background == "1"
                                    ? color == "1"
                                        ? Colors.white
                                        : Colors.black54
                                    : Colors.white,
                                fontSize: 18,
                                fontFamily: 'Oswald',
                                fontWeight: FontWeight.normal),
                          )),
                      Row(
                        children: <Widget>[
                          Container(
                            width: 30,
                            margin: EdgeInsets.only(top: 10, left: 20),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                color: background == "1"
                                    ? color == "1"
                                        ? Colors.white
                                        : Colors.black54
                                    : Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 3.0,
                                    color: background == "1"
                                        ? color == "1"
                                            ? Colors.white
                                            : Colors.black54
                                        : Colors.white,
                                    //offset: Offset(6.0, 7.0),
                                  ),
                                ],
                                border: Border.all(
                                    width: 0.5,
                                    color: background == "1"
                                        ? color == "1"
                                            ? Colors.white
                                            : Colors.black54
                                        : Colors.white)),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(
                                  top: 12, left: 20, bottom: 10),
                              child: Text(
                                "2 requests",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: background == "1"
                                        ? color == "1"
                                            ? Colors.white70
                                            : Colors.black45
                                        : Colors.white,
                                    fontSize: 13,
                                    fontFamily: 'Oswald',
                                    fontWeight: FontWeight.w400),
                              )),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          FriendRequestPage()));
                            },
                            child: Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(
                                    top: 12, right: 20, bottom: 10),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      "Show all",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: background == "1"
                                              ? color == "1"
                                                  ? back_new
                                                  : Colors.black54
                                              : back_new,
                                          fontSize: 13,
                                          fontFamily: 'Oswald',
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 3),
                                      child: Icon(Icons.chevron_right,
                                          color: background == "1"
                                              ? color == "1"
                                                  ? back_new
                                                  : Colors.black54
                                              : back_new,
                                          size: 17),
                                    )
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FriendProfileNewPage()));
                      },
                      child: loading == false
                          ? Container(
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                color: color == "1"
                                    ? Colors.black.withOpacity(0.3)
                                    : Colors.white.withOpacity(0.9),
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
                                  top: 2.5, bottom: 2.5, left: 20, right: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      //color: Colors.red,
                                      margin: EdgeInsets.only(
                                          left: 20, right: 20, top: 0),
                                      padding: EdgeInsets.only(right: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only(right: 10),
                                            //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                            padding: EdgeInsets.all(1.0),
                                            child: CircleAvatar(
                                              radius: 20.0,
                                              backgroundColor: Colors.white,
                                              backgroundImage: index == 0
                                                  ? AssetImage(
                                                      'assets/images/man2.png')
                                                  : AssetImage(
                                                      'assets/images/man3.png'),
                                            ),
                                            decoration: new BoxDecoration(
                                              color: Colors
                                                  .grey[300], // border color
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  index == 0
                                                      ? "Richard"
                                                      : "Mark Louis",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: color == "1"
                                                          ? Colors.white
                                                          : Colors.black,
                                                      fontFamily: 'Oswald',
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(top: 3),
                                                  child: Text(
                                                    index == 0
                                                        ? "6 mutual friends"
                                                        : "34 mutual friends",
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontFamily: 'Oswald',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 11,
                                                        color: color == "1"
                                                            ? Colors.white54
                                                            : Colors.black54),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Container(
                                          decoration: BoxDecoration(
                                              color: back_new,
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          padding: EdgeInsets.all(2),
                                          margin: EdgeInsets.only(right: 15),
                                          child: Icon(
                                            Icons.done,
                                            color: Colors.black,
                                            size: 15,
                                          )),
                                      Container(
                                          decoration: BoxDecoration(
                                              color: header,
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          padding: EdgeInsets.all(2),
                                          margin: EdgeInsets.only(right: 15),
                                          child: Icon(
                                            Icons.close,
                                            color: Colors.white,
                                            size: 15,
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          : Container(
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                color: color == "1"
                                    ? Colors.black.withOpacity(0.3)
                                    : Colors.white.withOpacity(0.9),
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
                                  top: 2.5, bottom: 2.5, left: 20, right: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      //color: Colors.red,
                                      margin: EdgeInsets.only(
                                          left: 20, right: 20, top: 0),
                                      padding: EdgeInsets.only(right: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only(right: 10),
                                            //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                            padding: EdgeInsets.all(1.0),
                                            child: Shimmer.fromColors(
                                              baseColor: color == "1"
                                                  ? Colors.grey[700]
                                                  : Colors.grey[400],
                                              highlightColor: color == "1"
                                                  ? Colors.grey[500]
                                                  : Colors.grey[200],
                                              child: CircleAvatar(
                                                radius: 20.0,
                                                backgroundColor: Colors.white,
                                              ),
                                            ),
                                            decoration: new BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Shimmer.fromColors(
                                                  baseColor: color == "1"
                                                      ? Colors.grey[700]
                                                      : Colors.grey[400],
                                                  highlightColor: color == "1"
                                                      ? Colors.grey[500]
                                                      : Colors.grey[200],
                                                  child: Container(
                                                    width: 150,
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
                                                    baseColor: color == "1"
                                                        ? Colors.grey[700]
                                                        : Colors.grey[400],
                                                    highlightColor: color == "1"
                                                        ? Colors.grey[500]
                                                        : Colors.grey[200],
                                                    child: Container(
                                                      width: 90,
                                                      height: 12,
                                                      child: Container(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    );
                  }, childCount: 2),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: <Widget>[
                      Container(
                          width: 50,
                          margin: EdgeInsets.only(
                              top: 20, left: 25, right: 25, bottom: 0),
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
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(top: 20, left: 20),
                          child: Text(
                            "Suggestions",
                            style: TextStyle(
                                color: background == "1"
                                    ? color == "1"
                                        ? Colors.white
                                        : Colors.black54
                                    : Colors.white,
                                fontSize: 18,
                                fontFamily: 'Oswald',
                                fontWeight: FontWeight.normal),
                          )),
                      Row(
                        children: <Widget>[
                          Container(
                            width: 30,
                            margin: EdgeInsets.only(top: 10, left: 20),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                color: background == "1"
                                    ? color == "1"
                                        ? Colors.white
                                        : Colors.black54
                                    : Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 3.0,
                                    color: background == "1"
                                        ? color == "1"
                                            ? Colors.white
                                            : Colors.black54
                                        : Colors.white,
                                    //offset: Offset(6.0, 7.0),
                                  ),
                                ],
                                border: Border.all(
                                    width: 0.5,
                                    color: background == "1"
                                        ? color == "1"
                                            ? Colors.white
                                            : Colors.black54
                                        : Colors.white)),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(
                                  top: 12, left: 20, bottom: 10),
                              child: Text(
                                "1 suggestion",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: background == "1"
                                        ? color == "1"
                                            ? Colors.white70
                                            : Colors.black45
                                        : Colors.white,
                                    fontSize: 13,
                                    fontFamily: 'Oswald',
                                    fontWeight: FontWeight.w400),
                              )),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          FriendSuggestionPage()));
                            },
                            child: Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(
                                    top: 12, right: 20, bottom: 10),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      "Show all",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: background == "1"
                                              ? color == "1"
                                                  ? back_new
                                                  : Colors.black54
                                              : back_new,
                                          fontSize: 13,
                                          fontFamily: 'Oswald',
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 3),
                                      child: Icon(Icons.chevron_right,
                                          color: background == "1"
                                              ? color == "1"
                                                  ? back_new
                                                  : Colors.black54
                                              : back_new,
                                          size: 17),
                                    )
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FriendProfileNewPage()));
                      },
                      child: loading == false
                          ? Container(
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                color: color == "1"
                                    ? Colors.black.withOpacity(0.3)
                                    : Colors.white.withOpacity(0.9),
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
                                  top: 2.5, bottom: 2.5, left: 20, right: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      //color: Colors.red,
                                      margin: EdgeInsets.only(
                                          left: 20, right: 20, top: 0),
                                      padding: EdgeInsets.only(right: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only(right: 10),
                                            //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                            padding: EdgeInsets.all(1.0),
                                            child: CircleAvatar(
                                              radius: 20.0,
                                              backgroundColor: Colors.white,
                                              backgroundImage: AssetImage(
                                                  'assets/images/user.png'),
                                            ),
                                            decoration: new BoxDecoration(
                                              color: Colors
                                                  .grey[300], // border color
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  "Mark Richardson",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: color == "1"
                                                          ? Colors.white
                                                          : Colors.black,
                                                      fontFamily: 'Oswald',
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(top: 3),
                                                  child: Text(
                                                    "4 mutual friends",
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontFamily: 'Oswald',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 11,
                                                        color: color == "1"
                                                            ? Colors.white54
                                                            : Colors.black54),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Container(
                                          decoration: BoxDecoration(
                                              color: back_new,
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          padding: EdgeInsets.all(2),
                                          margin: EdgeInsets.only(right: 15),
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.black,
                                            size: 15,
                                          )),
                                      // Container(
                                      //     margin: EdgeInsets.only(right: 15),
                                      //     padding: EdgeInsets.only(
                                      //         left: 10, right: 10, top: 5, bottom: 5),
                                      //     decoration: BoxDecoration(
                                      //         borderRadius: BorderRadius.circular(15),
                                      //         border: Border.all(
                                      //             color: back_new, width: 0.3)),
                                      //     child: Text("Cancel",
                                      //         textAlign: TextAlign.center,
                                      //         style: TextStyle(
                                      //             fontFamily: 'Oswald',
                                      //             fontWeight: FontWeight.w300,
                                      //             color: back_new,
                                      //             fontSize: 12))),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          : Container(
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                color: color == "1"
                                    ? Colors.black.withOpacity(0.3)
                                    : Colors.white.withOpacity(0.9),
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
                                  top: 2.5, bottom: 2.5, left: 20, right: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      //color: Colors.red,
                                      margin: EdgeInsets.only(
                                          left: 20, right: 20, top: 0),
                                      padding: EdgeInsets.only(right: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only(right: 10),
                                            //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                            padding: EdgeInsets.all(1.0),
                                            child: Shimmer.fromColors(
                                              baseColor: color == "1"
                                                  ? Colors.grey[700]
                                                  : Colors.grey[400],
                                              highlightColor: color == "1"
                                                  ? Colors.grey[500]
                                                  : Colors.grey[200],
                                              child: CircleAvatar(
                                                radius: 20.0,
                                                backgroundColor: Colors.white,
                                              ),
                                            ),
                                            decoration: new BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Shimmer.fromColors(
                                                  baseColor: color == "1"
                                                      ? Colors.grey[700]
                                                      : Colors.grey[400],
                                                  highlightColor: color == "1"
                                                      ? Colors.grey[500]
                                                      : Colors.grey[200],
                                                  child: Container(
                                                    width: 150,
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
                                                    baseColor: color == "1"
                                                        ? Colors.grey[700]
                                                        : Colors.grey[400],
                                                    highlightColor: color == "1"
                                                        ? Colors.grey[500]
                                                        : Colors.grey[200],
                                                    child: Container(
                                                      width: 90,
                                                      height: 12,
                                                      child: Container(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    );
                  }, childCount: 1),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: <Widget>[
                      Container(
                          width: 50,
                          margin: EdgeInsets.only(
                              top: 20, left: 25, right: 25, bottom: 0),
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
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(top: 20, left: 20),
                          child: Text(
                            "Friends",
                            style: TextStyle(
                                color: background == "1"
                                    ? color == "1"
                                        ? Colors.white
                                        : Colors.black54
                                    : Colors.white,
                                fontSize: 18,
                                fontFamily: 'Oswald',
                                fontWeight: FontWeight.normal),
                          )),
                      Row(
                        children: <Widget>[
                          Container(
                            width: 30,
                            margin: EdgeInsets.only(top: 10, left: 20),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                color: background == "1"
                                    ? color == "1"
                                        ? Colors.white
                                        : Colors.black54
                                    : Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 3.0,
                                    color: background == "1"
                                        ? color == "1"
                                            ? Colors.white
                                            : Colors.black54
                                        : Colors.white,
                                    //offset: Offset(6.0, 7.0),
                                  ),
                                ],
                                border: Border.all(
                                    width: 0.5,
                                    color: background == "1"
                                        ? color == "1"
                                            ? Colors.white
                                            : Colors.black54
                                        : Colors.white)),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(
                                  top: 12, left: 20, bottom: 10),
                              child: Text(
                                "3 friends",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: background == "1"
                                        ? color == "1"
                                            ? Colors.white70
                                            : Colors.black45
                                        : Colors.white,
                                    fontSize: 13,
                                    fontFamily: 'Oswald',
                                    fontWeight: FontWeight.w400),
                              )),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FriendListPage()));
                            },
                            child: Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(
                                    top: 12, right: 20, bottom: 10),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      "Show all",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: background == "1"
                                              ? color == "1"
                                                  ? back_new
                                                  : Colors.black54
                                              : back_new,
                                          fontSize: 13,
                                          fontFamily: 'Oswald',
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 3),
                                      child: Icon(Icons.chevron_right,
                                          color: background == "1"
                                              ? color == "1"
                                                  ? back_new
                                                  : Colors.black54
                                              : back_new,
                                          size: 17),
                                    )
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(bottom: 25),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      FriendProfileNewPage()));
                        },
                        child: loading == false
                            ? Container(
                                padding: EdgeInsets.only(top: 10, bottom: 10),
                                decoration: BoxDecoration(
                                  color: color == "1"
                                      ? Colors.black.withOpacity(0.3)
                                      : Colors.white.withOpacity(0.9),
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
                                    top: 2.5, bottom: 2.5, left: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        //color: Colors.red,
                                        margin: EdgeInsets.only(
                                            left: 20, right: 20, top: 0),
                                        padding: EdgeInsets.only(right: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Stack(
                                              children: <Widget>[
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      right: 10),
                                                  //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                                  padding: EdgeInsets.all(1.0),
                                                  child: CircleAvatar(
                                                    radius: 20.0,
                                                    backgroundColor:
                                                        Colors.white,
                                                    backgroundImage: index == 0
                                                        ? AssetImage(
                                                            'assets/images/user.png')
                                                        : index == 1
                                                            ? AssetImage(
                                                                'assets/images/man4.jpg')
                                                            : AssetImage(
                                                                'assets/images/user.png'),
                                                  ),
                                                  decoration: new BoxDecoration(
                                                    color: Colors.grey[
                                                        300], // border color
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 30),
                                                  //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                                  padding: EdgeInsets.all(1.0),
                                                  child: CircleAvatar(
                                                    radius: 5.0,
                                                    backgroundColor:
                                                        Colors.greenAccent,
                                                    //backgroundImage: AssetImage('assets/user.png'),
                                                  ),
                                                  decoration: new BoxDecoration(
                                                    color: Colors
                                                        .greenAccent, // border color
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    index == 0
                                                        ? "John Louis"
                                                        : index == 1
                                                            ? "David King"
                                                            : "Daniel Ryan",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: color == "1"
                                                            ? Colors.white
                                                            : Colors.black,
                                                        fontFamily: 'Oswald',
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  Container(
                                                    margin:
                                                        EdgeInsets.only(top: 3),
                                                    child: Text(
                                                      index == 0
                                                          ? "6 mutual friends"
                                                          : index == 1
                                                              ? "16 mutual friends"
                                                              : "34 mutual friends",
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontFamily: 'Oswald',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 11,
                                                          color: color == "1"
                                                              ? Colors.white54
                                                              : Colors.black54),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ChattingPage()));
                                      },
                                      child: Container(
                                          margin: EdgeInsets.only(right: 15),
                                          padding: EdgeInsets.only(
                                              left: 10,
                                              right: 10,
                                              top: 5,
                                              bottom: 5),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              border: Border.all(
                                                  color: color == "1"
                                                      ? back_new
                                                      : header,
                                                  width: 0.5)),
                                          child: Text("Message",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily: 'Oswald',
                                                  fontWeight: FontWeight.w400,
                                                  color: color == "1"
                                                      ? back_new
                                                      : header,
                                                  fontSize: 12))),
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                padding: EdgeInsets.only(top: 10, bottom: 10),
                                decoration: BoxDecoration(
                                  color: color == "1"
                                      ? Colors.black.withOpacity(0.3)
                                      : Colors.white.withOpacity(0.9),
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
                                    top: 2.5, bottom: 2.5, left: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
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
                                                baseColor: color == "1"
                                                    ? Colors.grey[700]
                                                    : Colors.grey[400],
                                                highlightColor: color == "1"
                                                    ? Colors.grey[500]
                                                    : Colors.grey[200],
                                                child: CircleAvatar(
                                                  radius: 20.0,
                                                  backgroundColor: Colors.white,
                                                ),
                                              ),
                                              decoration: new BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Shimmer.fromColors(
                                                    baseColor: color == "1"
                                                        ? Colors.grey[700]
                                                        : Colors.grey[400],
                                                    highlightColor: color == "1"
                                                        ? Colors.grey[500]
                                                        : Colors.grey[200],
                                                    child: Container(
                                                      width: 150,
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
                                                      baseColor: color == "1"
                                                          ? Colors.grey[700]
                                                          : Colors.grey[400],
                                                      highlightColor: color ==
                                                              "1"
                                                          ? Colors.grey[500]
                                                          : Colors.grey[200],
                                                      child: Container(
                                                        width: 90,
                                                        height: 12,
                                                        child: Container(
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      );
                    }, childCount: 3),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
