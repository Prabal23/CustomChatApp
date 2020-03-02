import 'dart:async';

import 'package:chatapp_new/Cards/CommentCard/commentCard.dart';
import 'package:chatapp_new/MainScreens/ReplyPage/replyPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../main.dart';

class CommentPage extends StatefulWidget {
  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  TextEditingController editingController = new TextEditingController();
  TextEditingController comEditor = new TextEditingController();
  String comment = "", com = "";
  bool isEdit = false;
  int idx = -1;
  SharedPreferences sharedPreferences;
  String theme = "";
  Timer _timer;
  int _start = 3;
  bool loading = true;

  @override
  void initState() {
    sharedPrefcheck();
    timerCheck();
    editingController.text = "Comment";
    setState(() {
      comment = editingController.text;
    });
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

  void commentModalBottomSheet(context, int index) {
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
                    setState(() {
                      isEdit = true;
                      idx = index;
                    })
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
                          "Want to delete the comment?",
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
                        "Comments",
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
            child: CustomScrollView(
              slivers: <Widget>[
                SliverPadding(
                  padding: EdgeInsets.only(bottom: 40),
                  sliver: SliverList(
                    delegate: (SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return CommentCard(index);
                    }, childCount: 10)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.black.withOpacity(0.5),
        child: Row(
          children: <Widget>[
            // Container(
            //   margin: EdgeInsets.only(left: 10),
            //   child: Icon(
            //     Icons.attach_file,
            //     color: Colors.black38,
            //   ),
            // ),
            Flexible(
              child: Container(
                //height: 100,
                padding: EdgeInsets.all(0),
                margin: EdgeInsets.only(top: 5, left: 10, bottom: 5, right: 10),
                decoration: BoxDecoration(
                    // borderRadius:
                    //     BorderRadius.all(Radius.circular(100.0)),
                    borderRadius: new BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0)),
                    color: Colors.black.withOpacity(0.4),
                    border: Border.all(
                        width: 0.5, color: Colors.black.withOpacity(0.4))),
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: new ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: 120.0,
                        ),
                        child: new SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          reverse: true,
                          child: new TextField(
                            maxLines: null,
                            autofocus: false,
                            controller: comEditor,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Oswald',
                            ),
                            decoration: InputDecoration(
                              hintText: "Type a comment here...",
                              hintStyle: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 15,
                                  fontFamily: 'Oswald',
                                  fontWeight: FontWeight.w300),
                              contentPadding:
                                  EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
                              border: InputBorder.none,
                            ),
                            onChanged: (value) {
                              setState(() {
                                comment = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                    color: back_new, borderRadius: BorderRadius.circular(25)),
                margin: EdgeInsets.only(right: 10),
                padding: EdgeInsets.all(8),
                child: Icon(
                  Icons.send,
                  color: header,
                  size: 25,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
