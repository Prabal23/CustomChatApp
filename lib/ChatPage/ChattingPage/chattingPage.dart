import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import '../../main.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  List<String> messages = [];
  int selected;
  var now = new DateTime.now();
  DateTime _date = DateTime.now();

  SharedPreferences sharedPreferences;
  String theme = "";

  @override
  void initState() {
    setState(() {
      date = DateFormat("MMM dd, yyyy").format(now);
      messages.add(date);
      st = "1";
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
        iconTheme: IconThemeData(color: Colors.white),
        //automaticallyImplyLeading: false,
        backgroundColor: Colors.black.withOpacity(0.5),
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
                        backgroundImage: AssetImage('assets/images/man2.jpg'),
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
                        "User's name",
                        style: TextStyle(
                            color: Colors.white,
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
                            color: Colors.black.withOpacity(0.3),
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
                                        ? Container(
                                            child: ListTile(
                                              title: index == 0
                                                  ? Container(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                          "${messages[index]}",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white70,
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  'Oswald',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400)),
                                                    )
                                                  : Container(
                                                      margin: EdgeInsets.only(
                                                          left: 0,
                                                          right: 0,
                                                          top: 0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          Expanded(
                                                            child: Container(
                                                              //margin: EdgeInsets.only(top: 5),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .end,
                                                                children: <
                                                                    Widget>[
                                                                  Container(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            10),
                                                                    margin: EdgeInsets.only(
                                                                        top: 0,
                                                                        left:
                                                                            70),
                                                                    decoration:
                                                                        new BoxDecoration(
                                                                      //color: header,
                                                                      color:
                                                                          header,
                                                                      borderRadius:
                                                                          BorderRadius.all(
                                                                              Radius.circular(10)),
                                                                      border: Border.all(
                                                                          width:
                                                                              0.1,
                                                                          color:
                                                                              my_chat),
                                                                    ),
                                                                    //color: Colors.white,
                                                                    child: Text(
                                                                      "${messages[index]}",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                          color: Colors
                                                                              .white,
                                                                          fontFamily:
                                                                              'Oswald',
                                                                          fontWeight:
                                                                              FontWeight.w400),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    margin: EdgeInsets
                                                                        .only(
                                                                            top:
                                                                                5),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .end,
                                                                      children: <
                                                                          Widget>[
                                                                        Text(
                                                                          "4:17 PM",
                                                                          style: TextStyle(
                                                                              fontSize: 11,
                                                                              color: Colors.white70,
                                                                              fontFamily: 'Oswald',
                                                                              fontWeight: FontWeight.w300),
                                                                        ),
                                                                        Container(
                                                                          margin:
                                                                              EdgeInsets.only(left: 3),
                                                                          child: messages.length == index + 1
                                                                              ? Container(
                                                                                  decoration: BoxDecoration(color: Colors.grey[400], borderRadius: BorderRadius.all(Radius.circular(10))),
                                                                                  padding: EdgeInsets.all(2),
                                                                                  //color: Colors.grey[400],
                                                                                  child: Icon(
                                                                                    Icons.done,
                                                                                    size: 8,
                                                                                    color: Colors.white,
                                                                                  ))
                                                                              : Container(
                                                                                  margin: EdgeInsets.only(right: 0),
                                                                                  //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                                                                  padding: EdgeInsets.all(1.0),
                                                                                  child: CircleAvatar(
                                                                                    radius: 5.0,
                                                                                    backgroundColor: Colors.white,
                                                                                    backgroundImage: AssetImage('assets/images/man.png'),
                                                                                  ),
                                                                                  decoration: new BoxDecoration(
                                                                                    color: Colors.grey, // border color
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                ),
                                                                        )
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
                                            ),
                                          )
                                        : Container(
                                            child: ListTile(
                                              title: Container(
                                                margin: EdgeInsets.only(
                                                    left: 0, right: 0, top: 0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          right: 5),
                                                      //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                                      padding:
                                                          EdgeInsets.all(1.0),
                                                      child: CircleAvatar(
                                                        radius: 12.0,
                                                        backgroundColor:
                                                            Colors.white,
                                                        backgroundImage: AssetImage(
                                                            'assets/images/man.png'),
                                                      ),
                                                      decoration:
                                                          new BoxDecoration(
                                                        color: Colors
                                                            .grey, // border color
                                                        shape: BoxShape.circle,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        //margin: EdgeInsets.only(top: 5),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: <Widget>[
                                                            Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(10),
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      top: 0,
                                                                      right:
                                                                          70),
                                                              decoration:
                                                                  new BoxDecoration(
                                                                color: back_new,
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10)),
                                                                border: Border.all(
                                                                    width: 0.1,
                                                                    color: Colors
                                                                        .grey),
                                                              ),
                                                              //color: Colors.white,
                                                              child: Text(
                                                                "${messages[index]}",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    color: Colors
                                                                        .black,
                                                                    fontFamily:
                                                                        'Oswald',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              ),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(top: 5),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: <
                                                                    Widget>[
                                                                  Text(
                                                                    "4:17 PM",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            11,
                                                                        color: Colors
                                                                            .white70,
                                                                        fontFamily:
                                                                            'Oswald',
                                                                        fontWeight:
                                                                            FontWeight.w300),
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
                                            ),
                                          ))),
                      ),
                    ),
                    // Container(
                    //   height: 2,
                    //   child: Divider(
                    //     color: Colors.grey,
                    //   ),
                    // ),
                    Container(
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
                                  color: Colors.black.withOpacity(0.4),
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
                                                color: Colors.white70,
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
