import 'package:chatapp_new/MainScreens/ChatPage/ChattingPage/chattingPage.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class FriendChatCard extends StatefulWidget {
  final index;

  FriendChatCard(this.index);
  @override
  _FriendChatCardState createState() => _FriendChatCardState();
}

class _FriendChatCardState extends State<FriendChatCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: ListTile(
          title: Container(
            margin: EdgeInsets.only(left: 0, right: 0, top: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ////// <<<<< Picture start >>>>> //////
                Container(
                  margin: EdgeInsets.only(right: 5),
                  padding: EdgeInsets.all(1.0),
                  child: CircleAvatar(
                    radius: 12.0,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/images/man.png'),
                  ),
                  decoration: new BoxDecoration(
                    color: Colors.grey, // border color
                    shape: BoxShape.circle,
                  ),
                ),
                ////// <<<<< Picture end >>>>> //////
                
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ////// <<<<< Message start >>>>> //////
                        Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(top: 0, right: 70),
                          decoration: new BoxDecoration(
                            color: back_new,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(width: 0.1, color: Colors.grey),
                          ),
                          //color: Colors.white,
                          child: Text(
                            "${messages[widget.index]}",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontFamily: 'Oswald',
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        ////// <<<<< Message end >>>>> //////
                        
                        ////// <<<<< Time start >>>>> //////
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "4:17 PM",
                                style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.white70,
                                    fontFamily: 'Oswald',
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                        ),
                        ////// <<<<< Time end >>>>> //////
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
