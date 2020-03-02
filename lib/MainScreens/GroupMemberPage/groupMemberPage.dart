import 'dart:async';

import 'package:chatapp_new/Cards/AllMembersCard/allMembersCard.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../main.dart';

class GroupMemberPage extends StatefulWidget {
  @override
  _GroupMemberPageState createState() => _GroupMemberPageState();
}

class _GroupMemberPageState extends State<GroupMemberPage> {
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
                        "Group Members",
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
                                            ? AssetImage("assets/images/f9.jpg")
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
                ////// <<<<< All Friend Option >>>>> //////
                SliverToBoxAdapter(
                  child: Column(
                    children: <Widget>[
                      ////// <<<<< Friend Number >>>>> //////
                      Container(
                        margin: EdgeInsets.only(top: 12, left: 20, bottom: 7),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Container(
                                child: Text(
                              "6",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'Oswald',
                                  fontWeight: FontWeight.w400),
                            )),
                            Container(
                                margin: EdgeInsets.only(bottom: 3),
                                child: Text(
                                  " members",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 13,
                                      fontFamily: 'Oswald',
                                      fontWeight: FontWeight.w400),
                                )),
                          ],
                        ),
                      ),

                      ////// <<<<< Divider 5 >>>>> //////
                      Row(
                        children: <Widget>[
                          Container(
                            width: 30,
                            margin:
                                EdgeInsets.only(top: 0, left: 20, bottom: 12),
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

                ////// <<<<< All Members Card >>>>> //////
                AllMembersCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
