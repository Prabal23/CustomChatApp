import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:async';
import '../../main.dart';

class GroupAddPage extends StatefulWidget {
  @override
  _GroupAddPageState createState() => new _GroupAddPageState();
}

class _GroupAddPageState extends State<GroupAddPage> {
  int _current = 0;
  int _isBack = 0;
  String result = '';
  bool _isChecked = false;
  List<String> user = [];
  var users;
  SharedPreferences sharedPreferences;
  String theme = "";
  Timer _timer;
  int _start = 3;
  bool loading = true;
  TextEditingController src = new TextEditingController();
  List<String> name = [
    "John Smith",
    "David Ryan",
    "Simon Wright",
    "Mike Johnson",
    "Daniel Smith"
  ];
  var friendname = List<String>();

  @override
  void initState() {
    print(user.length);
    sharedPrefcheck();
    timerCheck();
    friendname.addAll(name);
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

  void filterSearchResults(String query) {
    List<String> dummySearchList = List<String>();
    dummySearchList.addAll(name);
    if (query.isNotEmpty) {
      List<String> dummyListData = List<String>();
      dummySearchList.forEach((item) {
        if (item.toLowerCase().contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        friendname.clear();
        friendname.addAll(dummyListData);
        //print(friendname);
      });
      return;
    } else {
      setState(() {
        friendname.clear();
        friendname.addAll(name);
        //print(friendname);
      });
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
                          "Create Group",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Oswald',
                              fontWeight: FontWeight.normal),
                        )),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(right: 10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Next",
                      style: TextStyle(
                          color: header,
                          fontSize: 15,
                          fontFamily: 'Oswald',
                          fontWeight: FontWeight.normal),
                    )),
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
                                              ? AssetImage(
                                                  "assets/images/f9.jpg")
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
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0))),
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverToBoxAdapter(
                    child: Column(
                      children: <Widget>[
                        Container(
                          //color: Colors.white,
                          child: Container(
                            margin: EdgeInsets.only(
                                top: 10, bottom: 10, left: 20, right: 10),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  //color: Colors.red,
                                  child: Center(
                                    child: Container(
                                      margin: EdgeInsets.only(right: 0),
                                      //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                      padding: EdgeInsets.all(0.5),
                                      child: CircleAvatar(
                                        radius: 30.0,
                                        backgroundColor: Colors.transparent,
                                        backgroundImage: AssetImage(
                                            'assets/images/add_image.jpg'),
                                      ),
                                      decoration: new BoxDecoration(
                                        color: Colors.grey[300], // border color
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    //color: Colors.white,
                                    margin: EdgeInsets.only(top: 5),
                                    padding: EdgeInsets.only(top: 0, bottom: 0),
                                    decoration: BoxDecoration(
                                      //color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(0)),
                                      //border: Border.all(width: 0.5, color: Colors.grey[400]),
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                bottom: 10, top: 4),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              //mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    padding: EdgeInsets.all(10),
                                                    margin: EdgeInsets.only(
                                                        left: 10,
                                                        right: 10,
                                                        top: 5),
                                                    decoration: BoxDecoration(
                                                        color: Colors.black
                                                            .withOpacity(0.4),
                                                        border: Border.all(
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.4),
                                                            width: 0.5),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    25))),
                                                    child: Row(
                                                      children: <Widget>[
                                                        Flexible(
                                                          child: TextField(
                                                            //controller: phoneController,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontFamily:
                                                                  'Oswald',
                                                            ),
                                                            decoration:
                                                                InputDecoration(
                                                              hintText:
                                                                  "Group Name",
                                                              hintStyle: TextStyle(
                                                                  color: Colors
                                                                      .white70,
                                                                  fontSize: 15,
                                                                  fontFamily:
                                                                      'Oswald',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300),
                                                              //labelStyle: TextStyle(color: Colors.white70),
                                                              contentPadding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          10.0,
                                                                          1,
                                                                          20.0,
                                                                          1),
                                                              border:
                                                                  InputBorder
                                                                      .none,
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
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                            width: 50,
                            margin: EdgeInsets.only(
                                top: 5, left: 25, right: 25, bottom: 0),
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
                          margin: EdgeInsets.only(bottom: 10, top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            //mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.only(
                                      left: 20, right: 20, top: 0),
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.7),
                                      border: Border.all(
                                          color: Colors.grey, width: 0.5),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                          margin: EdgeInsets.only(left: 5),
                                          child: Icon(Icons.search,
                                              color: Colors.black45, size: 20)),
                                      Flexible(
                                        child: TextField(
                                          onChanged: (value) {
                                            filterSearchResults(value);
                                          },
                                          controller: src,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          style: TextStyle(
                                            color: Colors.black87,
                                            fontFamily: 'Oswald',
                                          ),
                                          decoration: InputDecoration(
                                            hintText: "Search friend",
                                            hintStyle: TextStyle(
                                                color: Colors.black45,
                                                fontSize: 15,
                                                fontFamily: 'Oswald',
                                                fontWeight: FontWeight.w300),
                                            //labelStyle: TextStyle(color: Colors.white70),
                                            contentPadding: EdgeInsets.fromLTRB(
                                                10.0, 2.5, 20.0, 2.5),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(top: 10, left: 20),
                                child: Text(
                                  "Friends",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: 'Oswald',
                                      fontWeight: FontWeight.normal),
                                )),
                            Row(
                              children: <Widget>[
                                Container(
                                  width: 30,
                                  margin: EdgeInsets.only(
                                      top: 10, left: 20, bottom: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
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
                        user.length != 0
                            ? Container(
                                margin: EdgeInsets.only(
                                    left: 0, right: 0, top: 5, bottom: 15),
                                //color: Colors.white,
                                width: MediaQuery.of(context).size.width,
                                //padding: EdgeInsets.only(left: 15),
                                height: 60,
                                child: new ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder:
                                      (BuildContext context, int index) =>
                                          new Container(
                                    //color: Colors.white,
                                    margin: EdgeInsets.only(
                                        left: 20, right: 0, top: 5),
                                    padding: EdgeInsets.all(0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      //color: Colors.white,
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          users.removeAt(index);
                                          user = users;
                                          //print(images.length);
                                        });
                                      },
                                      child: Container(
                                        child: Column(
                                          children: <Widget>[
                                            Container(
                                              margin: EdgeInsets.only(right: 0),
                                              //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                              padding: EdgeInsets.all(1.0),
                                              child: CircleAvatar(
                                                radius: 25.0,
                                                backgroundColor:
                                                    Colors.transparent,
                                                backgroundImage: AssetImage(
                                                    'assets/images/man2.jpg'),
                                              ),
                                              decoration: new BoxDecoration(
                                                color: Colors
                                                    .white, // border color
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  itemCount: user.length,
                                ),
                              )
                            : Container(),
                        // Container(
                        //     width: 50,
                        //     margin: EdgeInsets.only(
                        //         top: 10, left: 25, right: 25, bottom: 10),
                        //     decoration: BoxDecoration(
                        //         borderRadius:
                        //             BorderRadius.all(Radius.circular(15.0)),
                        //         color: header,
                        //         boxShadow: [
                        //           BoxShadow(
                        //             blurRadius: 1.0,
                        //             color: header,
                        //             //offset: Offset(6.0, 7.0),
                        //           ),
                        //         ],
                        //         border: Border.all(width: 0.5, color: header))),
                      ],
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.only(bottom: 15, top: 5),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        return loading == false
                            ? Container(
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
                                    top: 2.5, bottom: 2.5, left: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        //color: Colors.red,
                                        margin: EdgeInsets.only(
                                            left: 15, right: 20, top: 0),
                                        padding: EdgeInsets.only(right: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Stack(
                                              children: <Widget>[
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      right: 10),
                                                  //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                                  padding: EdgeInsets.all(1.0),
                                                  child: CircleAvatar(
                                                    radius: 20.0,
                                                    backgroundColor:
                                                        Colors.white,
                                                    backgroundImage: index == 0
                                                        ? AssetImage(
                                                            'assets/images/man.png')
                                                        : index == 1
                                                            ? AssetImage(
                                                                'assets/images/man2.jpg')
                                                            : index == 2
                                                                ? AssetImage(
                                                                    'assets/images/man.png')
                                                                : index == 3
                                                                    ? AssetImage(
                                                                        'assets/images/man2.jpg')
                                                                    : AssetImage(
                                                                        'assets/images/man.png'),
                                                  ),
                                                  decoration: new BoxDecoration(
                                                    color: Colors.grey[
                                                        300], // border color
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 30),
                                                  //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                                  padding: EdgeInsets.all(1.0),
                                                  child: CircleAvatar(
                                                    radius: 5.0,
                                                    backgroundColor:
                                                        Colors.greenAccent,
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
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    friendname[index],
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.white,
                                                        fontFamily: 'Oswald',
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  Container(
                                                    margin:
                                                        EdgeInsets.only(top: 3),
                                                    child: Text(
                                                      index == 0
                                                          ? "6 mutual friends"
                                                          : index == 1
                                                              ? "16 mutual friends"
                                                              : index == 2
                                                                  ? "26 mutual friends"
                                                                  : index == 3
                                                                      ? "32 mutual friends"
                                                                      : "34 mutual friends",
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontFamily: 'Oswald',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 11,
                                                          color:
                                                              Colors.white54),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              user.add("value $index");
                                              users = user.toList();
                                            });
                                          },
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  color: back_new,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25)),
                                              padding: EdgeInsets.all(2),
                                              margin:
                                                  EdgeInsets.only(right: 15),
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.black,
                                                size: 15,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ],
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                              margin:
                                                  EdgeInsets.only(right: 10),
                                              //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                              padding: EdgeInsets.all(1.0),
                                              child: Shimmer.fromColors(
                                                baseColor: Colors.grey[700],
                                                highlightColor:
                                                    Colors.grey[500],
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
                                                    margin:
                                                        EdgeInsets.only(top: 3),
                                                    child: Shimmer.fromColors(
                                                      baseColor:
                                                          Colors.grey[700],
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
                      }, childCount: friendname.length),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
