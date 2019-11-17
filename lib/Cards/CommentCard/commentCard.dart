import 'package:chatapp_new/MainScreens/ReplyPage/replyPage.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class CommentCard extends StatefulWidget {
  final index;
  CommentCard(this.index);

  @override
  _CommentCardState createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  TextEditingController editingController = new TextEditingController();
  TextEditingController comEditor = new TextEditingController();
  String comment = "", com = "";
  bool isEdit = false;
  int idx = -1;
  int _start = 3;
  bool loading = true;

  @override
  void initState() {
    editingController.text = "Comment";
    setState(() {
      comment = editingController.text;
    });
    super.initState();
  }

  void commentModalBottomSheet(context, int index) {
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
                    setState(() {
                      isEdit = true;
                      idx = index;
                    })
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
                          "Want to delete the comment?",
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
      child: Container(
        color: Colors.black.withOpacity(0.2),
        padding: EdgeInsets.only(
            top: widget.index == 0 ? 20 : 0, bottom: 5, left: 20),
        margin: EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 0),
        child: Column(
          children: <Widget>[
            widget.index == 0 ? Container() : Divider(),
            Container(
              margin: EdgeInsets.only(
                  left: 0, right: 0, bottom: 0, top: widget.index == 0 ? 0 : 5),
              padding: EdgeInsets.only(right: 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ////// <<<<< pic start >>>>> //////
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    padding: EdgeInsets.all(1.0),
                    child: CircleAvatar(
                      radius: 15.0,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("assets/images/user.png"),
                    ),
                    decoration: new BoxDecoration(
                      color: Colors.grey[300],
                      shape: BoxShape.circle,
                    ),
                  ),
                  ////// <<<<< pic end >>>>> //////

                  Expanded(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ////// <<<<< Name start >>>>> //////
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    child: Text(
                                      "John Smith",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: back_new,
                                          fontFamily: 'Oswald',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      GestureDetector(
                                        onTap: () {
                                          commentModalBottomSheet(
                                              context, widget.index);
                                        },
                                        child: Container(
                                            margin: EdgeInsets.only(right: 15),
                                            // color: Colors.blue,
                                            child: Icon(
                                              Icons.more_horiz,
                                              color: Colors.white,
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          ////// <<<<< Name end >>>>> //////
                          Container(
                              margin: EdgeInsets.only(
                                left: 0,
                                right: 20,
                                top: 3,
                              ),
                              child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    child: idx == widget.index && isEdit == true
                                        ? Row(
                                            children: <Widget>[
                                              Flexible(
                                                child: new ConstrainedBox(
                                                  constraints: BoxConstraints(
                                                    maxHeight: 120.0,
                                                  ),
                                                  child:
                                                      new SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    reverse: true,
                                                    child: new TextField(
                                                      maxLines: null,
                                                      autofocus: true,
                                                      controller:
                                                          editingController,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily: 'Oswald',
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      decoration:
                                                          InputDecoration(
                                                        hintText:
                                                            "Type a comment here...",
                                                        hintStyle: TextStyle(
                                                            color:
                                                                Colors.white60,
                                                            fontSize: 13,
                                                            fontFamily:
                                                                'Oswald',
                                                            fontWeight:
                                                                FontWeight
                                                                    .w300),
                                                        contentPadding:
                                                            EdgeInsets.fromLTRB(
                                                                0.0,
                                                                10.0,
                                                                20.0,
                                                                10.0),
                                                        border:
                                                            InputBorder.none,
                                                      ),
                                                      onChanged: (value) {
                                                        setState(() {
                                                          comment = value;
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                child: Row(
                                                  children: <Widget>[
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          isEdit = false;
                                                        });
                                                      },
                                                      child: Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  right: 10),
                                                          child: Icon(
                                                              Icons.done,
                                                              color: Colors
                                                                  .greenAccent,
                                                              size: 18)),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          isEdit = false;
                                                        });
                                                      },
                                                      child: Container(
                                                          child: Icon(
                                                              Icons.close,
                                                              color: Colors
                                                                  .redAccent,
                                                              size: 18)),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          )
                                        : Container(
                                            margin: EdgeInsets.only(top: 0),
                                            child: Text(
                                              comment,
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.white,
                                                  fontFamily: "OSwald",
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                  ))),
                          Container(
                            margin: EdgeInsets.only(left: 0, top: 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 0),
                                  child: Text("6h ago",
                                      style: TextStyle(
                                          fontFamily: 'Oswald',
                                          fontWeight: FontWeight.w400,
                                          color: header,
                                          fontSize: 12)),
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  margin: EdgeInsets.only(left: 20, top: 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.all(3.0),
                                              child: Icon(
                                                Icons.thumb_up,
                                                size: 13,
                                                color: Colors.white70,
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 3),
                                              child: Text("2",
                                                  style: TextStyle(
                                                      color: Colors.white70,
                                                      fontSize: 12)),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        margin: EdgeInsets.only(left: 15),
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.all(3.0),
                                              child: Icon(
                                                Icons.comment,
                                                size: 13,
                                                color: Colors.white70,
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 3),
                                              child: Text("5",
                                                  style: TextStyle(
                                                      color: Colors.white70,
                                                      fontSize: 12)),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              replyPage();
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(top: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text("View replies...",
                                      style: TextStyle(
                                          fontFamily: 'Oswald',
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                          fontSize: 12)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void replyPage() {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new ReplyPage();
        },
        fullscreenDialog: true));
  }
}
