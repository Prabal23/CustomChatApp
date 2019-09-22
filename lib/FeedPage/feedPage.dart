import 'package:chatapp_new/CreatePost/createPost.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';
import 'dart:async';
import 'package:shimmer/shimmer.dart';

class FeedPage extends StatefulWidget {
  @override
  FeedPageState createState() => FeedPageState();
}

class FeedPageState extends State<FeedPage> {
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
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(builder: (context) => ProfilePage()),
                                // );
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
                                          padding: EdgeInsets.all(10),
                                          margin: EdgeInsets.only(
                                              left: 10, right: 10, top: 5),
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.black.withOpacity(0.4),
                                              border: Border.all(
                                                  color: Colors.grey,
                                                  width: 0.5),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(25))),
                                          child: TextField(
                                            enabled: false,
                                            //controller: phoneController,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Oswald',
                                            ),
                                            decoration: InputDecoration(
                                              hintText: "What's in your mind?",
                                              hintStyle: TextStyle(
                                                  color: Colors.white70,
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
                              GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => HotelSearchPage()),
                              // );
                            },
                            child: new Container(
                              margin: EdgeInsets.only(
                                  left: 15, right: 5, top: 5, bottom: 5),
                              padding: EdgeInsets.only(left: 0),
                              height: 100,
                              width: 90,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: index == 0
                                      ? AssetImage("assets/images/man.png")
                                      : index == 1
                                          ? AssetImage("assets/images/man2.jpg")
                                          : index == 2
                                              ? AssetImage(
                                                  "assets/images/man.png")
                                              : index == 3
                                                  ? AssetImage(
                                                      "assets/images/man2.jpg")
                                                  : index == 4
                                                      ? AssetImage(
                                                          "assets/images/man.png")
                                                      : AssetImage(
                                                          "assets/images/man2.jpg"),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 3.0,
                                    color: Colors.black.withOpacity(.5),
                                    //offset: Offset(6.0, 7.0),
                                  ),
                                ],
                                // border: Border.all(width: 0.2, color: Colors.grey)
                              ),
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                      margin: EdgeInsets.only(left: 0),
                                      padding: EdgeInsets.only(left: 0),
                                      height: 110,
                                      width: 90,
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.3),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15.0)),
                                      )),
                                  index == 0
                                      ? Container(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: <Widget>[
                                              Icon(
                                                Icons.add,
                                                color: Colors.white,
                                                size: 26,
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: 0,
                                                    left: 10,
                                                    bottom: 5),
                                                child: Text(
                                                  "Add to story",
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontFamily: 'Oswald',
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      : Container(
                                          alignment: Alignment.bottomLeft,
                                          margin: EdgeInsets.only(
                                              top: 10, left: 10, bottom: 5),
                                          child: Text(
                                            index == 1
                                                ? "John Smith"
                                                : index == 2
                                                    ? "David Ryan"
                                                    : index == 3
                                                        ? "Simon Wright"
                                                        : index == 4
                                                            ? "Mike Johnson"
                                                            : "Daniel Smith",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontFamily: 'Oswald',
                                                fontWeight: FontWeight.w300),
                                          )),
                                ],
                              ),
                            ),
                          ),
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
                    return loading == false
                        ? Container(
                            padding: EdgeInsets.only(top: 20, bottom: 10),
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
                                top: 5, bottom: 5, left: 10, right: 10),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
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
                                            child: CircleAvatar(
                                              radius: 20.0,
                                              backgroundColor: Colors.white,
                                              backgroundImage: index % 2 == 0
                                                  ? AssetImage(
                                                      'assets/images/man.png')
                                                  : AssetImage(
                                                      'assets/images/man2.jpg'),
                                            ),
                                            decoration: new BoxDecoration(
                                              color: Colors
                                                  .grey[300], // border color
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                index % 2 == 0
                                                    ? "John Smith"
                                                    : "David Ryan",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.white,
                                                    fontFamily: 'Oswald',
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(top: 3),
                                                child: Text(
                                                  index % 2 == 0
                                                      ? "6 hr"
                                                      : "Aug 7 at 5:34 PM",
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontFamily: 'Oswald',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 11,
                                                      color: Colors.white54),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(right: 15),
                                        child: Icon(
                                          Icons.more_horiz,
                                          color: Colors.white60,
                                        )),
                                  ],
                                ),
                                Container(
                                    margin: EdgeInsets.only(
                                        left: 20, right: 20, top: 20),
                                    child: index % 2 == 0
                                        ? Text(
                                            "Hello everyone! this is my first status. i have made a social app with flutter. i hope you will like it. \nThank you",
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400),
                                          )
                                        : Column(
                                            children: <Widget>[
                                              Container(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  "Last week tour with friends",
                                                  textAlign: TextAlign.justify,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ),
                                              Container(
                                                  //color: Colors.red,
                                                  height: 200,
                                                  padding:
                                                      const EdgeInsets.all(0.0),
                                                  margin:
                                                      EdgeInsets.only(top: 10),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              "assets/images/f6.jpg"),
                                                          fit: BoxFit.cover)),
                                                  child: null),
                                            ],
                                          )),
                                Container(
                                    margin: EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        bottom: 0,
                                        top: 10),
                                    child: Divider(
                                      color: Colors.grey[400],
                                    )),
                                Container(
                                  margin: EdgeInsets.only(left: 20, top: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.all(3.0),
                                            child: Icon(
                                              index % 2 == 0
                                                  ? Icons.favorite
                                                  : Icons.favorite_border,
                                              size: 20,
                                              color: index % 2 == 0
                                                  ? Colors.redAccent
                                                  : Colors.white70,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 3),
                                            child: Text(
                                                index % 2 == 0 ? "200" : "105",
                                                style: TextStyle(
                                                    fontFamily: 'Oswald',
                                                    fontWeight: FontWeight.w300,
                                                    color: Colors.white70,
                                                    fontSize: 12)),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only(left: 15),
                                            padding: EdgeInsets.all(3.0),
                                            child: Icon(
                                              Icons.chat_bubble_outline,
                                              size: 20,
                                              color: Colors.white70,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 3),
                                            child: Text(
                                                index % 2 == 0 ? "123" : "89",
                                                style: TextStyle(
                                                    fontFamily: 'Oswald',
                                                    fontWeight: FontWeight.w300,
                                                    color: Colors.white70,
                                                    fontSize: 12)),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only(left: 15),
                                            padding: EdgeInsets.all(3.0),
                                            child: Icon(
                                              Icons.send,
                                              size: 20,
                                              color: Colors.white70,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 3),
                                            child: Text(
                                                index % 2 == 0 ? "43" : "21",
                                                style: TextStyle(
                                                    fontFamily: 'Oswald',
                                                    fontWeight: FontWeight.w300,
                                                    color: Colors.white70,
                                                    fontSize: 12)),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(
                            padding: EdgeInsets.only(top: 20, bottom: 10),
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
                                top: 5, bottom: 5, left: 10, right: 10),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
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
                                                //backgroundColor: Colors.white,
                                              ),
                                            ),
                                            decoration: new BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Shimmer.fromColors(
                                                baseColor: Colors.grey[700],
                                                highlightColor:
                                                    Colors.grey[500],
                                                child: Container(
                                                  width: 100,
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
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                        margin: EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                            top: 20,
                                            bottom: 0),
                                        child: Shimmer.fromColors(
                                          baseColor: Colors.grey[700],
                                          highlightColor: Colors.grey[500],
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 10,
                                            child: Container(
                                              color: Colors.black,
                                            ),
                                          ),
                                        )),
                                    Container(
                                        margin: EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                            top: 2,
                                            bottom: 5),
                                        child: Shimmer.fromColors(
                                          baseColor: Colors.grey[700],
                                          highlightColor: Colors.grey[500],
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                100,
                                            height: 10,
                                            child: Container(
                                              color: Colors.black,
                                            ),
                                          ),
                                        )),
                                  ],
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
