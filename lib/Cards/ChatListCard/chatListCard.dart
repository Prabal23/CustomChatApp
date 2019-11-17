import 'package:chatapp_new/MainScreens/ChatPage/ChattingPage/chattingPage.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class ChatListCard extends StatefulWidget {
  final index;

  ChatListCard(this.index);
  @override
  _ChatListCardState createState() => _ChatListCardState();
}

class _ChatListCardState extends State<ChatListCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ChattingPage()));
        },
        child: Container(
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
          margin: EdgeInsets.only(top: 2.5, bottom: 2.5, left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Container(
                  //color: Colors.red,
                  margin: EdgeInsets.only(left: 20, right: 10, top: 0),
                  padding: EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      ////// <<<<< Profile picture start >>>>> //////
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                        padding: EdgeInsets.all(1.0),
                        child: CircleAvatar(
                          radius: 20.0,
                          backgroundColor: Colors.white,
                          backgroundImage: widget.index == 0
                              ? AssetImage('assets/images/man.png')
                              : widget.index == 1
                                  ? AssetImage('assets/images/man2.jpg')
                                  : widget.index == 2
                                      ? AssetImage('assets/images/man.png')
                                      : widget.index == 3
                                          ? AssetImage('assets/images/man2.jpg')
                                          : AssetImage('assets/images/man.png'),
                        ),
                        decoration: new BoxDecoration(
                          color: Colors.grey[300], // border color
                          shape: BoxShape.circle,
                        ),
                      ),

                      ////// <<<<< Profile picture end >>>>> //////

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

                            ////// <<<<< Message start >>>>> //////
                            Container(
                              margin: EdgeInsets.only(top: 3),
                              child: Text(
                                widget.index == 0
                                    ? "See you tomorrow"
                                    : widget.index == 1
                                        ? "You : Bye"
                                        : widget.index == 2
                                            ? "I need to talk to you. Can we meet tomorrow?"
                                            : widget.index == 3
                                                ? "Good night"
                                                : "You : See you at office this monday",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontFamily: 'Oswald',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                    color: Colors.white70),
                              ),
                            ),
                            ////// <<<<< Message end >>>>> //////
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  ////// <<<<< Date start >>>>> //////
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    child: Text(
                      "Sep 15, 2019",
                      style: TextStyle(
                          fontFamily: 'Oswald',
                          fontWeight: FontWeight.w200,
                          fontSize: 10,
                          color: Colors.white),
                    ),
                  ),
                  ////// <<<<< Date end >>>>> //////

                  ////// <<<<< Number start >>>>> //////
                  widget.index % 2 == 0
                      ? Container(
                          decoration: BoxDecoration(
                              color: header,
                              borderRadius: BorderRadius.circular(5)),
                          padding: EdgeInsets.only(
                              left: 5, right: 5, top: 2, bottom: 2),
                          margin: EdgeInsets.only(right: 20, top: 5),
                          child: Text(
                            "2",
                            style: TextStyle(
                                fontFamily: 'Oswald',
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                                color: Colors.white),
                          ))
                      : Container(
                          padding: EdgeInsets.only(
                              left: 5, right: 5, top: 2, bottom: 2),
                          margin: EdgeInsets.only(right: 20, top: 20),
                        ),

                  ////// <<<<< Number end >>>>> //////
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
