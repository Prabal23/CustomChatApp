import 'package:chatapp_new/Cards/ChatListCard/chatListCard.dart';
import 'package:chatapp_new/Cards/ChatStoryCard/chatStorycard.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import '../../main.dart';
import 'ChattingPage/chattingPage.dart';
import 'dart:async';

class ChatPage extends StatefulWidget {
  @override
  ChatPageState createState() => ChatPageState();
}

class ChatPageState extends State<ChatPage> {
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
                        "Chat",
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
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0), topRight: Radius.circular(0))),
            margin: EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 0),
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
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(bottom: 10, top: 4),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  //mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        padding: EdgeInsets.all(10),
                                        margin: EdgeInsets.only(
                                            left: 10, right: 10, top: 5),
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.black.withOpacity(0.4),
                                            border: Border.all(
                                                color: Colors.black
                                                    .withOpacity(0.4),
                                                width: 0.5),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25))),
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                                margin:
                                                    EdgeInsets.only(left: 10),
                                                child: Icon(Icons.search,
                                                    color: Colors.white70,
                                                    size: 17)),
                                            Flexible(
                                              child: TextField(
                                                //controller: phoneController,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Oswald',
                                                ),
                                                decoration: InputDecoration(
                                                  hintText: "Search",
                                                  hintStyle: TextStyle(
                                                      color: Colors.white70,
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
                                              ),
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: 0, right: 0, top: 5, bottom: 0),
                        //color: back_new,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(left: 0),
                        height: 95,
                        child: new ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) =>
                              ChatStoryCard(index),
                          itemCount: 6,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                      )
                    ],
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return loading == false
                        ? ChatListCard(index)
                        : Container(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
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
                                top: 2.5, bottom: 2.5, left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                            baseColor: Colors.grey[700],
                                            highlightColor: Colors.grey[500],
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
                                                baseColor: Colors.grey[700],
                                                highlightColor:
                                                    Colors.grey[500],
                                                child: Container(
                                                  width: 150,
                                                  height: 22,
                                                  child: Container(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(top: 3),
                                                child: Shimmer.fromColors(
                                                  baseColor: Colors.grey[700],
                                                  highlightColor:
                                                      Colors.grey[500],
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
                          );
                  }, childCount: 5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
