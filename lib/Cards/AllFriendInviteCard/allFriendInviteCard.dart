import 'package:chatapp_new/MainScreens/ChatPage/ChattingPage/chattingPage.dart';
import 'package:chatapp_new/MainScreens/ProfilePage/FriendsProfile/FriendMainPage/friendsProfile.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:async';

import '../../main.dart';

class AllFriendInviteCard extends StatefulWidget {
  @override
  AllFriendInviteCardState createState() => AllFriendInviteCardState();
}

class AllFriendInviteCardState extends State<AllFriendInviteCard> {
  String result = '';
  Timer _timer;
  int _start = 3;
  bool loading = true;
  TextEditingController src = new TextEditingController();
  List frndName = [];
  List name = [
    "John Smith",
    "David Ryan",
    "Simon Wright",
    "Mike Johnson",
    "Daniel Smith"
  ];

  @override
  void initState() {
    timerCheck();
    print(user.length);
    frndName.addAll(name);
    super.initState();
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
    return Container(
      child: SliverPadding(
        padding: EdgeInsets.only(bottom: 15, top: 5),
        sliver: SliverList(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FriendProfileNewPage()));
              },
              child: loading == false
                  ? Container(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      decoration: BoxDecoration(
                        color: color == "1"
                            ? Colors.black.withOpacity(0.3)
                            : Colors.white.withOpacity(0.9),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              //color: Colors.red,
                              margin:
                                  EdgeInsets.only(left: 20, right: 20, top: 0),
                              padding: EdgeInsets.only(right: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Stack(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(right: 10),
                                        //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                        padding: EdgeInsets.all(1.0),
                                        child: CircleAvatar(
                                          radius: 20.0,
                                          backgroundColor: Colors.white,
                                          backgroundImage: index == 0
                                              ? AssetImage(
                                                  'assets/images/user.png')
                                              : index == 1
                                                  ? AssetImage(
                                                      'assets/images/man4.jpg')
                                                  : AssetImage(
                                                      'assets/images/user.png'),
                                        ),
                                        decoration: new BoxDecoration(
                                          color:
                                              Colors.grey[300], // border color
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 30),
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
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          index == 0
                                              ? "John Louis"
                                              : index == 1
                                                  ? "David King"
                                                  : "Daniel Ryan",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: color == "1"
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontFamily: 'Oswald',
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 3),
                                          child: Text(
                                            index == 0
                                                ? "6 mutual friends"
                                                : index == 1
                                                    ? "16 mutual friends"
                                                    : "34 mutual friends",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: 'Oswald',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 11,
                                                color: color == "1"
                                                    ? Colors.white54
                                                    : Colors.black54),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                                margin: EdgeInsets.only(right: 15),
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, top: 5, bottom: 5),
                                decoration: BoxDecoration(
                                    color: header,
                                    borderRadius: BorderRadius.circular(15),
                                    border:
                                        Border.all(color: header, width: 0.5)),
                                child: Text("Invite",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: 'Oswald',
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                        fontSize: 12))),
                          ),
                        ],
                      ),
                    )
                  : Container(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      decoration: BoxDecoration(
                        color: color == "1"
                            ? Colors.black.withOpacity(0.3)
                            : Colors.white.withOpacity(0.9),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              //color: Colors.red,
                              margin:
                                  EdgeInsets.only(left: 20, right: 20, top: 0),
                              padding: EdgeInsets.only(right: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                    padding: EdgeInsets.all(1.0),
                                    child: Shimmer.fromColors(
                                      baseColor: color == "1"
                                          ? Colors.grey[700]
                                          : Colors.grey[400],
                                      highlightColor: color == "1"
                                          ? Colors.grey[500]
                                          : Colors.grey[200],
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
                                          baseColor: color == "1"
                                              ? Colors.grey[700]
                                              : Colors.grey[400],
                                          highlightColor: color == "1"
                                              ? Colors.grey[500]
                                              : Colors.grey[200],
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
                                            baseColor: color == "1"
                                                ? Colors.grey[700]
                                                : Colors.grey[400],
                                            highlightColor: color == "1"
                                                ? Colors.grey[500]
                                                : Colors.grey[200],
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
                    ),
            );
          }, childCount: 3),
        ),
      ),
    );
  }
}
