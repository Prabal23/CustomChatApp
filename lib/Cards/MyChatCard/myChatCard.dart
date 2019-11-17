import 'package:chatapp_new/MainScreens/ChatPage/ChattingPage/chattingPage.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class MyChatCard extends StatefulWidget {
  final index;
  MyChatCard(this.index);
  @override
  _MyChatCardState createState() => _MyChatCardState();
}

class _MyChatCardState extends State<MyChatCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 0, right: 0, top: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  ////// <<<<< Message start >>>>> //////
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(top: 0, left: 70),
                    decoration: new BoxDecoration(
                      color: header,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(width: 0.1, color: my_chat),
                    ),
                    child: Text(
                      "${messages[widget.index]}",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontFamily: 'Oswald',
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  ////// <<<<< Message end >>>>> //////
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        ////// <<<<< Time start >>>>> //////
                        Text(
                          "4:17 PM",
                          style: TextStyle(
                              fontSize: 11,
                              color: Colors.white70,
                              fontFamily: 'Oswald',
                              fontWeight: FontWeight.w300),
                        ),
                        ////// <<<<< Time end >>>>> //////
                        Container(
                          margin: EdgeInsets.only(left: 3),
                          child: messages.length == widget.index + 1

                              ////// <<<<< Sent start >>>>> //////
                              ? Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey[400],
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  padding: EdgeInsets.all(2),
                                  child: Icon(
                                    Icons.done,
                                    size: 8,
                                    color: Colors.white,
                                  ))
                              ////// <<<<< Sent end >>>>> //////
                              :
                              ////// <<<<< Seen start >>>>> //////
                              Container(
                                  margin: EdgeInsets.only(right: 0),
                                  padding: EdgeInsets.all(1.0),
                                  child: CircleAvatar(
                                    radius: 5.0,
                                    backgroundColor: Colors.white,
                                    backgroundImage:
                                        AssetImage('assets/images/man.png'),
                                  ),
                                  decoration: new BoxDecoration(
                                    color: Colors.grey,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                          ////// <<<<< Seen end >>>>> //////
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
    );
  }
}
