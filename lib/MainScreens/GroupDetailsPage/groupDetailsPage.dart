import 'dart:async';

import 'package:chatapp_new/MainScreens/BottomNavPages/MainPage/myProfile.dart';
import 'package:chatapp_new/MainScreens/CreatePost/createPost.dart';
import 'package:chatapp_new/MainScreens/GroupMemberPage/groupMemberPage.dart';
import 'package:chatapp_new/MainScreens/InviteGroupMemberPage/inviteGroupMemberPage.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GroupDetailsPage extends StatefulWidget {
  @override
  _GroupDetailsPageState createState() => _GroupDetailsPageState();
}

class _GroupDetailsPageState extends State<GroupDetailsPage> {
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
                        "Group Details",
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
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        ////// <<<<< Cover Photo >>>>> //////
                        Container(
                          margin: EdgeInsets.only(top: 0, left: 0, right: 0),
                          child: Container(
                            height: 220,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/images/f4.jpg"),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(0),
                                    topRight: Radius.circular(0))),
                            child: null,
                          ),
                        ),

                        ////// <<<<< Group by >>>>> //////
                        Container(
                          padding: EdgeInsets.only(top: 0, left: 10, right: 0),
                          alignment: Alignment.centerLeft,
                          height: 30,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: color == "1"
                                  ? Colors.grey[600]
                                  : Colors.white.withOpacity(0.9)),
                          child: Text(
                            "Group by Bijoya Banik",
                            style: TextStyle(
                                color: color == "1"
                                    ? Colors.white
                                    : Colors.black54,
                                fontSize: 15,
                                fontFamily: 'Oswald',
                                fontWeight: FontWeight.w300),
                          ),
                        ),

                        ////// <<<<< About Button >>>>> //////
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                              margin: EdgeInsets.only(top: 15, bottom: 20),
                              alignment: Alignment.centerLeft,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  // color: Colors.red
                                  ),
                              child: Column(
                                children: <Widget>[
                                  ////// <<<<< Group Title >>>>> //////
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                            "Flutter Rajjo",
                                            style: TextStyle(
                                                color: background == "1"
                                                    ? color == "1"
                                                        ? Colors.white
                                                        : Colors.black54
                                                    : Colors.white,
                                                fontSize: 23,
                                                fontFamily: 'Oswald',
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        Container(
                                            child: Icon(
                                          Icons.keyboard_arrow_right,
                                          color: background == "1"
                                              ? color == "1"
                                                  ? Colors.white
                                                  : Colors.black54
                                              : Colors.white,
                                          size: 27,
                                        ))
                                      ],
                                    ),
                                  ),

                                  ////// <<<<< Group Members >>>>> //////
                                  Container(
                                    child: Text(
                                      "Secret Group - 6 Memeber",
                                      style: TextStyle(
                                          color: background == "1"
                                              ? color == "1"
                                                  ? Colors.white70
                                                  : Colors.black45
                                              : Colors.white,
                                          fontSize: 15,
                                          fontFamily: 'Oswald',
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              )),
                        ),
//////

                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ////// <<<<< Group Members Photo Button >>>>> //////
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              GroupMemberPage()));
                                },
                                child: Container(
                                  width: 160,
                                  margin: EdgeInsets.only(right: 10),
                                  alignment: Alignment.centerRight,
                                  // color: Colors.blue,
                                  child: Stack(
                                    children: <Widget>[
                                      Container(
                                        alignment: Alignment.topLeft,
                                        child: ClipOval(
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey
                                                          .withOpacity(0.5),
                                                      width: 1),
                                                  shape: BoxShape.circle),
                                              child: CircleAvatar(
                                                backgroundImage: AssetImage(
                                                    "assets/images/man3.png"),
                                              )),
                                        ),
                                      ),
                                      Positioned(
                                        left: 30,
                                        child: Container(
                                          alignment: Alignment.topLeft,
                                          child: ClipOval(
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.grey[300],
                                                        width: 1),
                                                    shape: BoxShape.circle),
                                                child: CircleAvatar(
                                                  backgroundImage: AssetImage(
                                                      "assets/images/user.jpg"),
                                                )),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 60,
                                        child: Container(
                                          alignment: Alignment.topLeft,
                                          child: ClipOval(
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.grey
                                                            .withOpacity(0.5),
                                                        width: 1),
                                                    shape: BoxShape.circle),
                                                child: CircleAvatar(
                                                  backgroundImage: AssetImage(
                                                      "assets/images/man2.png"),
                                                )),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 90,
                                        child: Container(
                                          alignment: Alignment.topLeft,
                                          child: ClipOval(
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.grey
                                                            .withOpacity(0.5),
                                                        width: 1),
                                                    shape: BoxShape.circle),
                                                child: CircleAvatar(
                                                  backgroundImage: AssetImage(
                                                      "assets/images/man.png"),
                                                )),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 120,
                                        child: Container(
                                          alignment: Alignment.topLeft,
                                          child: ClipOval(
                                            child: Stack(
                                              children: <Widget>[
                                                Image.asset(
                                                  "assets/images/user.png",
                                                  height: 40,
                                                  width: 40,
                                                  fit: BoxFit.cover,
                                                ),
                                                Positioned(
                                                  child: ClipOval(
                                                    child: Container(
                                                        height: 40,
                                                        width: 40,
                                                        color: color == "1"
                                                            ? Colors.black
                                                                .withOpacity(
                                                                    0.3)
                                                            : Colors.white
                                                                .withOpacity(
                                                                    0.4),
                                                        child: Icon(
                                                          Icons.more_horiz,
                                                          color: Colors.white,
                                                        )),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              ////// <<<<< Invite Members Button >>>>> //////

                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            InviteGroupMemberPage()),
                                  );
                                },
                                child: Container(
                                    padding: EdgeInsets.only(
                                        left: 10,
                                        right: 20,
                                        top: 10,
                                        bottom: 10),
                                    //margin: EdgeInsets.only(left: 20, right: 20),
                                    decoration: BoxDecoration(
                                        color: header,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          child: Icon(Icons.add,
                                              color: Colors.white, size: 17),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 3),
                                          child: Text(
                                            "Invite",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontFamily: 'BebasNeue',
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          //color: Colors.white,
                          margin: EdgeInsets.only(top: 5),
                          padding: EdgeInsets.only(top: 0, bottom: 0),
                          decoration: BoxDecoration(
                            //color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(0)),
                            //border: Border.all(width: 0.5, color: Colors.grey[400]),
                          ),
                          child: Row(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProfileNewPage()),
                                  );
                                },
                                child: Container(
                                  child: Stack(
                                    children: <Widget>[
                                      Container(
                                        margin:
                                            EdgeInsets.only(right: 0, left: 15),
                                        //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                        padding: EdgeInsets.all(1.0),
                                        child: CircleAvatar(
                                          radius: 21.0,
                                          backgroundColor: Colors.transparent,
                                          backgroundImage: AssetImage(
                                              'assets/images/man2.jpg'),
                                        ),
                                        decoration: new BoxDecoration(
                                          color:
                                              Colors.grey[300], // border color
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 45),
                                        //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                        padding: EdgeInsets.all(1.0),
                                        child: CircleAvatar(
                                          radius: 5.0,
                                          backgroundColor: Colors.greenAccent,
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
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CreatePost()));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 10, top: 4),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      //mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            padding: EdgeInsets.all(10),
                                            margin: EdgeInsets.only(
                                                left: 10, right: 10, top: 5),
                                            decoration: BoxDecoration(
                                                color: color == "1"
                                                    ? Colors.black
                                                        .withOpacity(0.4)
                                                    : Colors.white
                                                        .withOpacity(0.6),
                                                border: Border.all(
                                                    color: Colors.grey,
                                                    width: 0.5),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(25))),
                                            child: TextField(
                                              enabled: false,
                                              //controller: phoneController,
                                              style: TextStyle(
                                                color: color == "1"
                                                    ? Colors.white
                                                    : Colors.black54,
                                                fontFamily: 'Oswald',
                                              ),
                                              decoration: InputDecoration(
                                                hintText:
                                                    "What's in your mind?",
                                                hintStyle: TextStyle(
                                                    color: color == "1"
                                                        ? Colors.white70
                                                        : Colors.black54,
                                                    fontSize: 15,
                                                    fontFamily: 'Oswald',
                                                    fontWeight:
                                                        FontWeight.w300),
                                                //labelStyle: TextStyle(color: Colors.white70),
                                                contentPadding:
                                                    EdgeInsets.fromLTRB(
                                                        10.0, 1, 20.0, 1),
                                                border: InputBorder.none,
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CreatePost()),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: back_new,
                                      borderRadius: BorderRadius.circular(25)),
                                  margin: EdgeInsets.only(right: 10),
                                  padding: EdgeInsets.all(11),
                                  child: Icon(
                                    Icons.photo,
                                    color: header,
                                    size: 25,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ///////////// <<<<< END >>>>> ////////////

                        ////// <<<<< Divider 1 >>>>> //////
                        Container(
                            width: 50,
                            margin: EdgeInsets.only(
                                top: 5, left: 25, right: 25, bottom: 10),
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
                ),
                //Posts card
                //CreatePostCard()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
