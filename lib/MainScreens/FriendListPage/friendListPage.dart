import 'dart:async';

import 'package:chatapp_new/Cards/FriendChatCard/friendChatCard.dart';
import 'package:chatapp_new/Cards/FriendListCard/friendListCard.dart';
import 'package:chatapp_new/MainScreens/ChatPage/ChattingPage/chattingPage.dart';
import 'package:chatapp_new/MainScreens/ProfilePage/FriendsProfile/FriendMainPage/friendsProfile.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

import '../../main.dart';

class FriendListPage extends StatefulWidget {
  @override
  _FriendListPageState createState() => _FriendListPageState();
}

class _FriendListPageState extends State<FriendListPage> {
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
      appBar: AppBar(
        iconTheme:
            IconThemeData(color: color == "1" ? Colors.white : Colors.black54),
        //automaticallyImplyLeading: false,
        backgroundColor: color == "1"
            ? Colors.black.withOpacity(0.5)
            : Colors.white.withOpacity(0.7),
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
                        "All Friends",
                        style: TextStyle(
                            color: color == "1" ? Colors.white : Colors.black54,
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
                      return FriendListCard(index, loading);
                    }, childCount: 3),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
