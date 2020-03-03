import 'package:chatapp_new/Forms/CreatePostForm/createPostForm.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:async';

import '../../main.dart';

class CreatePost extends StatefulWidget {
  @override
  CreatePostState createState() => CreatePostState();
}

class CreatePostState extends State<CreatePost> {
  SharedPreferences sharedPreferences;
  String theme = "";
  Timer _timer, _postTimer;
  int _start = 3, line = 1, _postStart = 2;
  bool loading = true;
  String post = '', chk = "";
  String status = "1";

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

  void postTimerCheck() {
    const oneSec = const Duration(seconds: 1);
    _postTimer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_postStart < 1) {
            timer.cancel();
            setState(() {
              chk = "";
            });
          } else {
            _postStart = _postStart - 1;
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
                        "Create Post",
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
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
                color: color == "1"
                    ? Colors.black.withOpacity(0.3)
                    : Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0), topRight: Radius.circular(0))),
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                    color: color == "1"
                    ? Colors.black.withOpacity(0.5)
                    : Colors.white.withOpacity(0.75),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                margin: EdgeInsets.only(top: 30),
                child: CreatePostForm(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // void snackBar(BuildContext context) {
  //   print(post);
  //   if (post != "") {
  //     // var snackBar = SnackBar(
  //     //   content: Text('Posted Successfully!'),
  //     //   action: SnackBarAction(
  //     //     label: 'OK',
  //     //     onPressed: () {},
  //     //   ),
  //     // );

  //     // Scaffold.of(context).showSnackBar(snackBar);
  //     Scaffold.of(context).showSnackBar(SnackBar(
  //       content: Text('Show Snackbar'),
  //       duration: Duration(seconds: 3),
  //     ));
  //   }
  // }
}
