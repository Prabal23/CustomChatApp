import 'package:chatapp_new/Cards/FeedCard/feedCard.dart';
import 'package:chatapp_new/Cards/FeedStorycard/feedStorycard.dart';
import 'package:chatapp_new/MainScreens/BottomNavPages/MainPage/myProfile.dart';
import 'package:chatapp_new/MainScreens/CommentPage/commentPage.dart';
import 'package:chatapp_new/MainScreens/CreatePost/createPost.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:shimmer/shimmer.dart';

import '../../../main.dart';

class FeedPage extends StatefulWidget {
  @override
  FeedPageState createState() => FeedPageState();
}

class FeedPageState extends State<FeedPage> {
  SharedPreferences sharedPreferences;
  String theme = "";
  Timer _timer;
  int _start = 3;
  int no, likeNum = 0;
  List likeArr = [0, 0];
  bool loading = true;

  @override
  void initState() {
    setState(() {
      no = 2;
    });
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

  void _statusModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                // Text('React to this post',
                //       style: TextStyle(fontWeight: FontWeight.normal)),
                new ListTile(
                  leading: new Icon(Icons.edit),
                  title: new Text('Edit',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontFamily: "Oswald")),
                  onTap: () => {
                    Navigator.pop(context),
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CreatePost()))
                  },
                ),
                new ListTile(
                  leading: new Icon(
                    Icons.delete,
                    color: Colors.redAccent,
                  ),
                  title: new Text('Delete',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.redAccent,
                          fontFamily: "Oswald")),
                  onTap: () => {Navigator.pop(context), _showDeleteDialog()},
                ),
              ],
            ),
          );
        });
  }

  Future<Null> _showDeleteDialog() async {
    return showDialog<Null>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return new AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          title: Center(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text(
                          "Want to delete the post?",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                              fontFamily: 'Oswald',
                              fontWeight: FontWeight.w400),
                        )),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                Navigator.of(context).pop();
                              });
                            },
                            child: Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.only(
                                    left: 0, right: 5, top: 20, bottom: 0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.grey, width: 0.5),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Text(
                                  "No",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 17,
                                    fontFamily: 'BebasNeue',
                                  ),
                                  textAlign: TextAlign.center,
                                )),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                Navigator.of(context).pop();
                              });
                            },
                            child: Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.only(
                                    left: 5, right: 0, top: 20, bottom: 0),
                                decoration: BoxDecoration(
                                    color: header,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Text(
                                  "Yes",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontFamily: 'BebasNeue',
                                  ),
                                  textAlign: TextAlign.center,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
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
            child: CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Column(
                    children: <Widget>[
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
                                        color: Colors.grey[300], // border color
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
                                        color:
                                            Colors.greenAccent, // border color
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
                                          builder: (context) => CreatePost()));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 10, top: 4),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    //mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          padding: EdgeInsets.only(
                                              left: 10, right: 10),
                                          margin: EdgeInsets.only(
                                              left: 10, right: 10, top: 5),
                                          decoration: BoxDecoration(
                                              color: color == "1"
                                                  ? Colors.black
                                                      .withOpacity(0.4)
                                                  : Colors.white
                                                      .withOpacity(0.7),
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
                                              hintText: "What's in your mind?",
                                              hintStyle: TextStyle(
                                                  color: color == "1"
                                                      ? Colors.white70
                                                      : Colors.black45,
                                                  fontSize: 15,
                                                  fontFamily: 'Oswald',
                                                  fontWeight: FontWeight.w300),
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
                      Container(
                          width: 50,
                          margin: EdgeInsets.only(
                              top: 10, left: 25, right: 25, bottom: 10),
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
                        margin: EdgeInsets.only(
                            left: 0, right: 0, top: 5, bottom: 10),
                        //color: sub_white,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(left: 0),
                        height: 110,
                        child: new ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) =>
                              FeedStorycard(index),
                          itemCount: loading ? 1 : 6,
                        ),
                      ),
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
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return FeedCard(loading, index);
                  }, childCount: 2),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
