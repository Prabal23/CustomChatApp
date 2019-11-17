import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:async';

import '../../main.dart';

class NotifyPage extends StatefulWidget {
  @override
  NotifyPageState createState() => NotifyPageState();
}

class NotifyPageState extends State<NotifyPage> {
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
                        "Notification",
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
                      // Container(
                      //     alignment: Alignment.centerLeft,
                      //     margin: EdgeInsets.only(top: 15, left: 20),
                      //     child: Text(
                      //       "Notification",
                      //       style: TextStyle(
                      //           color: Colors.white,
                      //           fontSize: 18,
                      //           fontFamily: 'Oswald',
                      //           fontWeight: FontWeight.normal),
                      //     )),
                      // Row(
                      //   children: <Widget>[
                      //     Container(
                      //       width: 30,
                      //       margin:
                      //           EdgeInsets.only(top: 10, left: 20, bottom: 15),
                      //       decoration: BoxDecoration(
                      //           borderRadius:
                      //               BorderRadius.all(Radius.circular(15.0)),
                      //           color: Colors.white,
                      //           boxShadow: [
                      //             BoxShadow(
                      //               blurRadius: 3.0,
                      //               color: Colors.white,
                      //               //offset: Offset(6.0, 7.0),
                      //             ),
                      //           ],
                      //           border: Border.all(
                      //               width: 0.5, color: Colors.white)),
                      //     ),
                      //   ],
                      // ),
                      Container(
                        margin: EdgeInsets.only(bottom: 15),
                      )
                    ],
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return loading == false
                        ? Container(
                            padding: EdgeInsets.only(top: 0, bottom: 0),
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
                            child: Container(
                              margin: EdgeInsets.all(15),
                              child: Row(
                                children: <Widget>[
                                  Stack(
                                    children: <Widget>[
                                      Container(
                                        margin:
                                            EdgeInsets.only(right: 0, top: 0),
                                        //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                        padding: EdgeInsets.all(1.0),
                                        child: CircleAvatar(
                                          radius: 25.0,
                                          backgroundColor: Colors.transparent,
                                          backgroundImage: index % 2 == 0
                                              ? AssetImage(
                                                  'assets/images/man.png')
                                              : AssetImage(
                                                  'assets/images/man2.jpg'),
                                        ),
                                        decoration: new BoxDecoration(
                                          color:
                                              Colors.grey[300], // border color
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      index % 2 == 0
                                          ? Container(
                                              margin: EdgeInsets.only(
                                                  left: 33, top: 35),
                                              padding: EdgeInsets.all(5.0),
                                              decoration: new BoxDecoration(
                                                color: Colors
                                                    .redAccent, // border color
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                Icons.favorite,
                                                size: 12,
                                                color: Colors.white,
                                              ),
                                            )
                                          : Container(
                                              margin: EdgeInsets.only(
                                                  left: 33, top: 35),
                                              padding: EdgeInsets.all(4.0),
                                              decoration: new BoxDecoration(
                                                color: header, // border color
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                Icons.comment,
                                                size: 13,
                                                color: Colors.white,
                                              ),
                                            ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text.rich(
                                            TextSpan(
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: index % 2 == 0
                                                        ? "David Ryan"
                                                        : "Jason Smith",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontFamily: 'Oswald',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    )),
                                                TextSpan(
                                                    text: index % 2 == 0
                                                        ? " liked a photo that you're tagged in"
                                                        : " reacted to your photo",
                                                    style: TextStyle(
                                                      color: Colors.white60,
                                                      fontSize: 15,
                                                      fontFamily: 'Oswald',
                                                      fontWeight:
                                                          FontWeight.w300,
                                                    )),
                                                // can add more TextSpans here...
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 5),
                                            child: Text(
                                              index % 2 == 0
                                                  ? "Just now"
                                                  : "1 day ago",
                                              style: TextStyle(
                                                  color: index % 2 == 0
                                                      ? header
                                                      : Colors.white54,
                                                  fontFamily: 'Oswald',
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 12),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                      margin:
                                          EdgeInsets.only(left: 12, right: 0),
                                      child: Icon(
                                        Icons.more_horiz,
                                        color: Colors.white54,
                                      ))
                                ],
                              ),
                            ),
                          )
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
                                              radius: 25.0,
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
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 15,
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
                                                    width: 150,
                                                    height: 15,
                                                    child: Container(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(top: 10),
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
                                        ),
                                      ],
                                    ),
                                  ),
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
      ),
    );
  }
}
