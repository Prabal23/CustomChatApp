import 'package:chatapp_new/MainScreens/CommentPage/commentPage.dart';
import 'package:chatapp_new/MainScreens/CreatePost/createPost.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../main.dart';

class MyFeedCard extends StatefulWidget {
  final index;
  final loading;
  MyFeedCard(this.loading, this.index);

  @override
  _MyFeedCardState createState() => _MyFeedCardState();
}

class _MyFeedCardState extends State<MyFeedCard> {
  int no, likeNum = 0;
  List likeArr = [0, 0];

  void _statusModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                // Text('React to this post',
                //       style: TextStyle(fontWeight: FontWeight.normal)),
                new ListTile(
                  leading: new Icon(Icons.edit),
                  title: new Text('Edit',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontFamily: "Oswald")),
                  onTap: () => {
                    Navigator.pop(context),
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CreatePost()))
                  },
                ),
                new ListTile(
                  leading: new Icon(
                    Icons.delete,
                    color: Colors.redAccent,
                  ),
                  title: new Text('Delete',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.redAccent,
                          fontFamily: "Oswald")),
                  onTap: () => {Navigator.pop(context), _showDeleteDialog()},
                ),
              ],
            ),
          );
        });
  }

  Future<Null> _showDeleteDialog() async {
    return showDialog<Null>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return new AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          title: Center(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text(
                          "Want to delete the post?",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                              fontFamily: 'Oswald',
                              fontWeight: FontWeight.w400),
                        )),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                Navigator.of(context).pop();
                              });
                            },
                            child: Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.only(
                                    left: 0, right: 5, top: 20, bottom: 0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.grey, width: 0.5),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Text(
                                  "No",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 17,
                                    fontFamily: 'BebasNeue',
                                  ),
                                  textAlign: TextAlign.center,
                                )),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                Navigator.of(context).pop();
                              });
                            },
                            child: Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.only(
                                    left: 5, right: 0, top: 20, bottom: 0),
                                decoration: BoxDecoration(
                                    color: header,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Text(
                                  "Yes",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontFamily: 'BebasNeue',
                                  ),
                                  textAlign: TextAlign.center,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.loading == false
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
              margin: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        //color: Colors.red,
                        margin: EdgeInsets.only(left: 20, right: 20, top: 0),
                        padding: EdgeInsets.only(right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            ////// <<<<< Picture start >>>>> //////
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                              padding: EdgeInsets.all(1.0),
                              child: CircleAvatar(
                                radius: 20.0,
                                backgroundColor: Colors.white,
                                backgroundImage: widget.index % 2 == 0
                                    ? AssetImage('assets/images/man2.jpg')
                                    : AssetImage('assets/images/man2.jpg'),
                              ),
                              decoration: new BoxDecoration(
                                color: Colors.grey[300], // border color
                                shape: BoxShape.circle,
                              ),
                            ),
                            ////// <<<<< Picture end >>>>> //////

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                ////// <<<<< Name start >>>>> //////
                                Text(
                                  "Paul Brian",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontFamily: 'Oswald',
                                      fontWeight: FontWeight.w400),
                                ),
                                ////// <<<<< Name start >>>>> //////

                                ////// <<<<< Time start >>>>> //////
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  child: Text(
                                    widget.index % 2 == 0
                                        ? "6 hr"
                                        : "Aug 7 at 5:34 PM",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontFamily: 'Oswald',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 11,
                                        color: Colors.white54),
                                  ),
                                ),
                                ////// <<<<< Time end >>>>> //////
                              ],
                            ),
                          ],
                        ),
                      ),
                      ////// <<<<< More start >>>>> //////
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _statusModalBottomSheet(context);
                          });
                        },
                        child: Container(
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.only(right: 15),
                            child: Icon(
                              Icons.more_horiz,
                              color: Colors.white60,
                            )),
                      ),
                      ////// <<<<< More end >>>>> //////
                    ],
                  ),

                  ////// <<<<< Post start >>>>> //////
                  Container(
                      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: widget.index % 2 == 0
                          ? Container(
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                "Honesty is the best policy",
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                            )
                          : Column(
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Tour of nearest hill",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                Container(
                                    //color: Colors.red,
                                    height: 200,
                                    padding: const EdgeInsets.all(0.0),
                                    margin: EdgeInsets.only(top: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/f7.jpg"),
                                            fit: BoxFit.cover)),
                                    child: null),
                              ],
                            )),
                  ////// <<<<< Post end >>>>> //////
                  Container(
                      margin: EdgeInsets.only(
                          left: 20, right: 20, bottom: 0, top: 10),
                      child: Divider(
                        color: Colors.grey[400],
                      )),
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 5),
                    padding: EdgeInsets.all(7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        ////// <<<<< Like start >>>>> //////
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              likeNum++;
                              if (widget.index == 0) {
                                if (likeNum % 2 == 0) {
                                  likeArr.insert(0, 0);
                                } else {
                                  likeArr.insert(0, 1);
                                }
                              } else {
                                if (likeNum % 2 == 0) {
                                  likeArr.insert(1, 0);
                                } else {
                                  likeArr.insert(1, 1);
                                }
                              }
                            });
                          },
                          child: Container(
                            child: Row(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(3.0),
                                  child: Icon(
                                    likeArr[widget.index] != 0
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    size: 20,
                                    color: likeArr[widget.index] != 0
                                        ? Colors.redAccent
                                        : Colors.white70,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 3),
                                  child: Text("${likeArr[widget.index]}",
                                      style: TextStyle(
                                          fontFamily: 'Oswald',
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white70,
                                          fontSize: 12)),
                                )
                              ],
                            ),
                          ),
                        ),
                        ////// <<<<< Like end >>>>> //////

                        ////// <<<<< Comment start >>>>> //////
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CommentPage()));
                          },
                          child: Container(
                            child: Row(
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
                                      widget.index % 2 == 0 ? "123" : "89",
                                      style: TextStyle(
                                          fontFamily: 'Oswald',
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white70,
                                          fontSize: 12)),
                                )
                              ],
                            ),
                          ),
                        ),
                        ////// <<<<< Comment end >>>>> //////

                        ////// <<<<< Share start >>>>> //////
                        Container(
                          child: Row(
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
                                child: Text(widget.index % 2 == 0 ? "43" : "21",
                                    style: TextStyle(
                                        fontFamily: 'Oswald',
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white70,
                                        fontSize: 12)),
                              )
                            ],
                          ),
                        ),
                        ////// <<<<< Share end >>>>> //////
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
              margin: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
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
                                  //backgroundColor: Colors.white,
                                ),
                              ),
                              decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Shimmer.fromColors(
                                  baseColor: Colors.grey[700],
                                  highlightColor: Colors.grey[500],
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
                                    highlightColor: Colors.grey[500],
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
                              left: 20, right: 20, top: 20, bottom: 0),
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey[700],
                            highlightColor: Colors.grey[500],
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 10,
                              child: Container(
                                color: Colors.black,
                              ),
                            ),
                          )),
                      Container(
                          margin: EdgeInsets.only(
                              left: 20, right: 20, top: 2, bottom: 5),
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey[700],
                            highlightColor: Colors.grey[500],
                            child: Container(
                              width: MediaQuery.of(context).size.width - 100,
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
            ),
    );
  }
}
