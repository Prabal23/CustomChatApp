import 'package:chatapp_new/MainScreens/ProfilePage/FriendsProfile/FriendMainPage/friendsProfile.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../main.dart';

class FriendReqCard extends StatefulWidget {
  final index;
  final loading;
  FriendReqCard(this.index, this.loading);
  @override
  _FriendReqCardState createState() => _FriendReqCardState();
}

class _FriendReqCardState extends State<FriendReqCard> {
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
                margin:
                    EdgeInsets.only(top: 2.5, bottom: 2.5, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 20, right: 20, top: 0),
                        padding: EdgeInsets.only(right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            ////// <<<<< Pic start >>>>> //////
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              padding: EdgeInsets.all(1.0),
                              child: CircleAvatar(
                                radius: 20.0,
                                backgroundColor: Colors.white,
                                backgroundImage: widget.index == 0
                                    ? AssetImage('assets/images/man.png')
                                    : widget.index == 1
                                        ? AssetImage('assets/images/man2.jpg')
                                        : widget.index == 2
                                            ? AssetImage(
                                                'assets/images/man.png')
                                            : widget.index == 3
                                                ? AssetImage(
                                                    'assets/images/man2.jpg')
                                                : AssetImage(
                                                    'assets/images/man.png'),
                              ),
                              decoration: new BoxDecoration(
                                color: Colors.grey[300], // border color
                                shape: BoxShape.circle,
                              ),
                            ),
                            ////// <<<<< Pic end >>>>> //////
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  ////// <<<<< Name start >>>>> //////
                                  Text(
                                    widget.index == 0
                                        ? "John Smith"
                                        : widget.index == 1
                                            ? "David Ryan"
                                            : widget.index == 2
                                                ? "Simon Wright"
                                                : widget.index == 3
                                                    ? "Mike Johnson"
                                                    : "Daniel Smith",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontFamily: 'Oswald',
                                        fontWeight: FontWeight.w400),
                                  ),
                                  ////// <<<<< Name end >>>>> //////

                                  ////// <<<<< Mutual start >>>>> //////
                                  Container(
                                    margin: EdgeInsets.only(top: 3),
                                    child: Text(
                                      widget.index == 0
                                          ? "6 mutual friends"
                                          : widget.index == 1
                                              ? "16 mutual friends"
                                              : widget.index == 2
                                                  ? "26 mutual friends"
                                                  : widget.index == 3
                                                      ? "32 mutual friends"
                                                      : "34 mutual friends",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontFamily: 'Oswald',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 11,
                                          color: Colors.white54),
                                    ),
                                  ),
                                  ////// <<<<< Mutual end >>>>> //////
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        ////// <<<<< Accept start >>>>> //////
                        Container(
                            decoration: BoxDecoration(
                                color: back_new,
                                borderRadius: BorderRadius.circular(25)),
                            padding: EdgeInsets.all(2),
                            margin: EdgeInsets.only(right: 15),
                            child: Icon(
                              Icons.done,
                              color: Colors.black,
                              size: 15,
                            )),
                        ////// <<<<< Accept end >>>>> //////

                        ////// <<<<< Reject start >>>>> //////
                        Container(
                            decoration: BoxDecoration(
                                color: header,
                                borderRadius: BorderRadius.circular(25)),
                            padding: EdgeInsets.all(2),
                            margin: EdgeInsets.only(right: 15),
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 15,
                            )),
                        ////// <<<<< Reject end >>>>> //////
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Shimmer.fromColors(
                                    baseColor: Colors.grey[700],
                                    highlightColor: Colors.grey[500],
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
                                      highlightColor: Colors.grey[500],
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
