import 'package:chatapp_new/MainScreens/ChatPage/ChattingPage/chattingPage.dart';
import 'package:chatapp_new/MainScreens/ProfilePage/FriendsProfile/FriendMainPage/friendsProfile.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../main.dart';

class FriendListCard extends StatefulWidget {
  final index;
  final loading;
  FriendListCard(this.index, this.loading);
  @override
  _FriendListCardState createState() => _FriendListCardState();
}

class _FriendListCardState extends State<FriendListCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => FriendProfileNewPage()));
        },
        child: widget.loading == false
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
                margin:
                    EdgeInsets.only(top: 2.5, bottom: 2.5, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        //color: Colors.red,
                        margin: EdgeInsets.only(left: 20, right: 20, top: 0),
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
                                    backgroundImage: widget.index == 0
                                        ? AssetImage('assets/images/user.png')
                                        : widget.index == 1
                                            ? AssetImage(
                                                'assets/images/man4.jpg')
                                            : AssetImage(
                                                'assets/images/user.png'),
                                  ),
                                  decoration: new BoxDecoration(
                                    color: Colors.grey[300], // border color
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
                                    color: Colors.greenAccent, // border color
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    widget.index == 0
                                        ? "John Louis"
                                        : widget.index == 1
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
                                      widget.index == 0
                                          ? "6 mutual friends"
                                          : widget.index == 1
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChattingPage()));
                      },
                      child: Container(
                          margin: EdgeInsets.only(right: 15),
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 5, bottom: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  color: color == "1" ? back_new : header,
                                  width: 0.5)),
                          child: Text("Message",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Oswald',
                                  fontWeight: FontWeight.w400,
                                  color: color == "1" ? back_new : header,
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
                margin:
                    EdgeInsets.only(top: 2.5, bottom: 2.5, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        //color: Colors.red,
                        margin: EdgeInsets.only(left: 20, right: 20, top: 0),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
      ),
    );
  }
}
