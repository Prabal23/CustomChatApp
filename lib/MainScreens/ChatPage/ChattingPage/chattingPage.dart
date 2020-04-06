import 'package:chatapp_new/Cards/FriendChatCard/friendChatCard.dart';
import 'package:chatapp_new/Cards/MyChatCard/myChatCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../main.dart';

List<String> messages = [];

class ChattingPage extends StatefulWidget {
  @override
  ChattingPageState createState() => new ChattingPageState();
}

class ChattingPageState extends State<ChattingPage> {
  int _current = 0;
  int _isBack = 0;
  String result = '', msg = '', date = '', st = '';
  TextEditingController msgController = new TextEditingController();
  //ScrollController _scrollController = new ScrollController();

  int selected;
  var now = new DateTime.now();
  DateTime _date = DateTime.now();

  SharedPreferences sharedPreferences;
  String theme = "";

  @override
  void initState() {
    setState(() {
      date = DateFormat("MMM dd, yyyy").format(now);
      //messages.add(date);
      //st = "1";
    });
    sharedPrefcheck();
    super.initState();
  }

  void sharedPrefcheck() async {
    sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
      theme = sharedPreferences.getString("theme");
    });
    //print(theme);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 0, left: 0),
                      //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                      padding: EdgeInsets.all(1.0),
                      child: CircleAvatar(
                        radius: 16.0,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage('assets/images/user.jpg'),
                      ),
                      decoration: new BoxDecoration(
                        color: Colors.grey[300], // border color
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, bottom: 5),
                      //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                      padding: EdgeInsets.all(1.0),
                      child: CircleAvatar(
                        radius: 3.0,
                        backgroundColor: Colors.greenAccent,
                        //backgroundImage: AssetImage('assets/user.png'),
                      ),
                      decoration: new BoxDecoration(
                        color: Colors.greenAccent, // border color
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 10, right: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    //color: Colors.black.withOpacity(0.5),
                  ),
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Simon Paul",
                        style: TextStyle(
                            color: color == "1" ? Colors.white : Colors.black54,
                            fontSize: 16,
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
          SafeArea(
            child: new Container(
                padding: EdgeInsets.all(0.0),
                //color: chat_page_back,
                //color: chat_back,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: color == "1"
                                ? Colors.black.withOpacity(0.3)
                                : Colors.white.withOpacity(0.7),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(0))),
                        child: ListView.builder(
                            //controller: _scrollController,
                            itemCount: messages.length,
                            //reverse: true,
                            itemBuilder: (BuildContext context, int index) =>
                                GestureDetector(
                                    onTap: () {
                                      // setState(() {
                                      //   selected = index;
                                      // });
                                    },
                                    child: index % 2 == 0
                                        ? MyChatCard(index)
                                        // Container(
                                        //     child: ListTile(
                                        //       title: index == 0
                                        //           ? Container(
                                        //               alignment:
                                        //                   Alignment.center,
                                        //               child: Text(
                                        //                   "${messages[index]}",
                                        //                   style: TextStyle(
                                        //                       color: Colors
                                        //                           .white70,
                                        //                       fontSize: 12,
                                        //                       fontFamily:
                                        //                           'Oswald',
                                        //                       fontWeight:
                                        //                           FontWeight
                                        //                               .w400)),
                                        //             )
                                        //           : MyChatCard(index),
                                        //     ),
                                        //   )
                                        : FriendChatCard(index))),
                      ),
                    ),
                    // Container(
                    //   height: 2,
                    //   child: Divider(
                    //     color: Colors.grey,
                    //   ),
                    // ),
                    Container(
                      color: color == "1"
                          ? Colors.black.withOpacity(0.5)
                          : Colors.white.withOpacity(0.9),
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
                              margin: EdgeInsets.only(
                                  top: 5, left: 10, bottom: 5, right: 10),
                              decoration: BoxDecoration(
                                  // borderRadius:
                                  //     BorderRadius.all(Radius.circular(100.0)),
                                  borderRadius: new BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                      bottomLeft: Radius.circular(20.0),
                                      bottomRight: Radius.circular(20.0)),
                                  color: color == "1"
                                      ? Colors.black.withOpacity(0.4)
                                      : Colors.white70,
                                  border: Border.all(
                                      width: 0.5,
                                      color: Colors.black.withOpacity(0.4))),
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
                                          controller: msgController,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Oswald',
                                          ),
                                          decoration: InputDecoration(
                                            hintText: "Type a message here...",
                                            hintStyle: TextStyle(
                                                color: color == "1"
                                                    ? Colors.white70
                                                    : Colors.black54,
                                                fontSize: 15,
                                                fontFamily: 'Oswald',
                                                fontWeight: FontWeight.w300),
                                            contentPadding: EdgeInsets.fromLTRB(
                                                10.0, 10.0, 20.0, 10.0),
                                            border: InputBorder.none,
                                          ),
                                          onChanged: (value) {
                                            setState(() {
                                              msg = value;
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
                            onTap: () {
                              if (msg != '') {
                                int dex = messages.length;
                                double idex = dex.toDouble();
                                print(idex);
                                setState(() {
                                  //messages.insert(0, msg);
                                  messages.add(msg);
                                  //print("success");
                                  msgController.text = '';
                                  st = "2";
                                  // _scrollController.animateTo(
                                  //   idex,
                                  //   curve: Curves.easeOut,
                                  //   duration: const Duration(milliseconds: 300),
                                  // );
                                });
                              } else {}
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: back_new,
                                  borderRadius: BorderRadius.circular(25)),
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
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
