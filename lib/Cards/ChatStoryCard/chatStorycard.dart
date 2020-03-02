import 'package:flutter/material.dart';

class ChatStoryCard extends StatefulWidget {
  final index;
  ChatStoryCard(this.index);

  @override
  _ChatStoryCardState createState() => _ChatStoryCardState();
}

class _ChatStoryCardState extends State<ChatStoryCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //       builder: (context) => HotelSearchPage()),
          // );
        },
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 15, right: 0, top: 10, bottom: 5),
                padding: EdgeInsets.only(left: 0),
                decoration: BoxDecoration(
                  color: Colors.grey[300], // border color
                  shape: BoxShape.circle,
                ),
                child: Stack(
                  children: <Widget>[
                    ////// <<<<< Picture start >>>>> //////
                    Container(
                        child: CircleAvatar(
                      radius: 25.0,
                      backgroundColor: Colors.transparent,
                      backgroundImage: widget.index == 0
                          ? AssetImage("assets/images/grey.jpeg")
                          : widget.index == 0
                  ? AssetImage("assets/images/man2.jpg")
                  : widget.index == 1
                      ? AssetImage("assets/images/man.png")
                      : widget.index == 2
                          ? AssetImage("assets/images/man2.png")
                          : widget.index == 3
                              ? AssetImage("assets/images/man3.png")
                              : widget.index == 4
                                  ? AssetImage("assets/images/user.jpg")
                                  : AssetImage("assets/images/man4.jpg"),
                    )),
                    ////// <<<<< Picture end >>>>> //////
                    
                    ////// <<<<< Online light start >>>>> //////
                    widget.index == 3 || widget.index == 1
                        ? Container(
                            margin: EdgeInsets.only(left: 35),
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
                          )
                        : Container(),
                        ////// <<<<< Online light end >>>>> //////
                    
                    ////// <<<<< Story add start >>>>> //////
                    Center(
                      child: widget.index == 0
                          ? Container(
                              margin: EdgeInsets.only(left: 12, top: 12),
                              child: Icon(
                                Icons.add,
                                color: Colors.black.withOpacity(0.5),
                                size: 26,
                              ),
                            )
                          : Container(),
                    ),
                    ////// <<<<< Story add end >>>>> //////
                  ],
                ),
              ),

              ////// <<<<< Name start >>>>> //////
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 0, left: 15),
                    child: Text(
                      widget.index == 0
                          ? "Your Story"
                          : widget.index == 1
                              ? "John"
                              : widget.index == 2
                                  ? "David"
                                  : widget.index == 3
                                      ? "Simon"
                                      : widget.index == 4 ? "Mike" : "Daniel",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Oswald',
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Colors.white70),
                    ),
                  ),
                ],
              )
              ////// <<<<< Name end >>>>> //////
            ],
          ),
        ),
      ),
    );
  }
}
