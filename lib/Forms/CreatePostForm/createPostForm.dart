import 'dart:async';

import 'package:chatapp_new/MainScreens/CreatePost/createPost.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class CreatePostForm extends StatefulWidget {
  @override
  _CreatePostFormState createState() => _CreatePostFormState();
}

class _CreatePostFormState extends State<CreatePostForm> {
  String post = '', chk = "";
  String status = "1";
  int _start = 3, line = 1, _postStart = 2;
  bool loading = true;
  Timer _timer, _postTimer;

  void _statusModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                  leading: new Icon(Icons.public),
                  title: new Text('Public',
                      style: TextStyle(fontWeight: FontWeight.normal)),
                  trailing: status == "1"
                      ? Icon(Icons.done, color: header)
                      : Icon(Icons.done, color: Colors.transparent),
                  onTap: () => {
                    setState(() {
                      status = "1";
                    }),
                    Navigator.pop(context)
                  },
                ),
                new ListTile(
                  leading: new Icon(Icons.lock_outline),
                  title: new Text('Only Me',
                      style: TextStyle(fontWeight: FontWeight.normal)),
                  trailing: status == "2"
                      ? Icon(Icons.done, color: header)
                      : Icon(Icons.done, color: Colors.transparent),
                  onTap: () => {
                    setState(() {
                      status = "2";
                    }),
                    Navigator.pop(context)
                  },
                ),
                new ListTile(
                  leading: new Icon(Icons.group),
                  title: new Text('Friends',
                      style: TextStyle(fontWeight: FontWeight.normal)),
                  trailing: status == "3"
                      ? Icon(Icons.done, color: header)
                      : Icon(Icons.done, color: Colors.transparent),
                  onTap: () => {
                    setState(() {
                      status = "3";
                    }),
                    Navigator.pop(context)
                  },
                ),
              ],
            ),
          );
        });
  }

  void postCheck() {
    if (post != "") {
      if (chk == "") {
        setState(() {
          chk = "1";
        });
        postTimerCheck();
      } else {}
    }
  }

  void postTimerCheck() {
    const oneSec = const Duration(seconds: 1);
    _postTimer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_postStart < 1) {
            timer.cancel();
            setState(() {
              chk = "";
            });
          } else {
            _postStart = _postStart - 1;
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: 70,
                      height: 70,
                      margin: EdgeInsets.only(top: 15, left: 20),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/man2.jpg"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(top: 10, left: 10),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      "David Ryan",
                                      maxLines: 1,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontFamily: 'Oswald',
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                ],
                              )),
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    _statusModalBottomSheet(context);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        top: 0, right: 5, left: 10),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 0.3, color: Colors.white70),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(left: 5),
                                          child: Icon(
                                            status == "1"
                                                ? Icons.public
                                                : status == "2"
                                                    ? Icons.lock_outline
                                                    : Icons.group,
                                            size: 12,
                                            color: Colors.white70,
                                          ),
                                        ),
                                        Container(
                                            margin: EdgeInsets.only(left: 5),
                                            child: Text(
                                              status == "1"
                                                  ? "Public"
                                                  : status == "2"
                                                      ? "Only Me"
                                                      : "Friends",
                                              style: TextStyle(
                                                  color: Colors.white70,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w300,
                                                  fontFamily: "Oswald"),
                                            )),
                                        Icon(
                                          Icons.arrow_drop_down,
                                          size: 25,
                                          color: Colors.white70,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // Container(
                                //   margin: EdgeInsets.only(
                                //       top: 0, left: 5, right: 15),
                                //   decoration: BoxDecoration(
                                //       border: Border.all(
                                //           width: 0.3, color: Colors.white70),
                                //       borderRadius: BorderRadius.all(
                                //           Radius.circular(10))),
                                //   child: Row(
                                //     mainAxisAlignment: MainAxisAlignment.center,
                                //     children: <Widget>[
                                //       Container(
                                //         margin: EdgeInsets.only(left: 5),
                                //         child: Icon(
                                //           Icons.add,
                                //           size: 12,
                                //           color: Colors.white70,
                                //         ),
                                //       ),
                                //       Container(
                                //           margin: EdgeInsets.only(left: 5),
                                //           child: Text(
                                //             "Album",
                                //             style: TextStyle(
                                //                 color: Colors.white70,
                                //                 fontSize: 12,
                                //                 fontWeight: FontWeight.w300,
                                //                 fontFamily: "Oswald"),
                                //           )),
                                //       Icon(
                                //         Icons.arrow_drop_down,
                                //         size: 25,
                                //         color: Colors.white70,
                                //       ),
                                //     ],
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                //height: 150,
                padding: EdgeInsets.all(0),
                margin:
                    EdgeInsets.only(top: 25, left: 20, bottom: 5, right: 20),
                decoration: BoxDecoration(
                  borderRadius: new BorderRadius.only(
                      topLeft: Radius.circular(5.0),
                      topRight: Radius.circular(5.0),
                      bottomLeft: Radius.circular(5.0),
                      bottomRight: Radius.circular(5.0)),
                  color: Colors.white.withOpacity(0.7),
                  //border: Border.all(width: 0.2, color: Colors.grey)),
                ),
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: 200.0,
                        ),
                        child: new SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          //reverse: true,
                          child: Container(
                            //height: 100,
                            child: new TextField(
                              maxLines: null,
                              autofocus: false,
                              style: TextStyle(
                                color: Colors.black87,
                                fontFamily: 'Oswald',
                              ),
                              //controller: msgController,
                              decoration: InputDecoration(
                                alignLabelWithHint: true,
                                hintText: "What do you want to say?",
                                hintStyle: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 15,
                                    fontFamily: 'Oswald',
                                    fontWeight: FontWeight.w300),
                                contentPadding:
                                    EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
                                border: InputBorder.none,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  post = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  width: 50,
                  margin:
                      EdgeInsets.only(top: 20, left: 25, right: 25, bottom: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
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
                margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 0),
                                height: 50,
                                //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                padding: EdgeInsets.all(10.0),
                                child: Icon(
                                  Icons.photo_camera,
                                  color: header,
                                  size: 15,
                                ),
                                decoration: new BoxDecoration(
                                  color: header, // border color
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 0),
                                height: 50,
                                //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                padding: EdgeInsets.all(10.0),
                                child: Icon(
                                  Icons.photo_camera,
                                  color: header,
                                  size: 15,
                                ),
                                decoration: new BoxDecoration(
                                  color: sub_white
                                      .withOpacity(0.7), // border color
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ],
                          ),
                          Text("Photo",
                              style: TextStyle(
                                  color: header,
                                  fontFamily: "Oswald",
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400))
                        ],
                      ),
                    ),
                    // Expanded(
                    //   child: GestureDetector(
                    //     onTap: () {
                    //       Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //               builder: (context) => CreatePost()));
                    //     },
                    //     child: Column(
                    //       children: <Widget>[
                    //         Container(
                    //           margin: EdgeInsets.only(left: 0),
                    //           height: 50,
                    //           padding: EdgeInsets.all(10.0),
                    //           child: Icon(
                    //             Icons.videocam,
                    //             color: Colors.white.withOpacity(0.6),
                    //             size: 15,
                    //           ),
                    //           decoration: new BoxDecoration(
                    //             color: Colors.grey
                    //                 .withOpacity(0.7), // border color
                    //             shape: BoxShape.circle,
                    //           ),
                    //         ),
                    //         Text("Video",
                    //             style: TextStyle(
                    //                 color: Colors.white.withOpacity(0.8),
                    //                 fontFamily: "Oswald",
                    //                 fontSize: 13))
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // Expanded(
                    //   child: Column(
                    //     children: <Widget>[
                    //       Container(
                    //         margin: EdgeInsets.only(left: 0),
                    //         height: 50,
                    //         padding: EdgeInsets.all(10.0),
                    //         child: Icon(
                    //           Icons.person,
                    //           color: Colors.white.withOpacity(0.6),
                    //           size: 15,
                    //         ),
                    //         decoration: new BoxDecoration(
                    //           color:
                    //               Colors.grey.withOpacity(0.7), // border color
                    //           shape: BoxShape.circle,
                    //         ),
                    //       ),
                    //       Text("Tag",
                    //           style: TextStyle(
                    //               color: Colors.white.withOpacity(0.8),
                    //               fontFamily: "Oswald",
                    //               fontSize: 13))
                    //     ],
                    //   ),
                    // ),
                    // Expanded(
                    //   child: Column(
                    //     children: <Widget>[
                    //       Container(
                    //         margin: EdgeInsets.only(left: 0),
                    //         height: 50,
                    //         padding: EdgeInsets.all(10.0),
                    //         child: Icon(
                    //           Icons.location_on,
                    //           color: Colors.white.withOpacity(0.6),
                    //           size: 15,
                    //         ),
                    //         decoration: new BoxDecoration(
                    //           color:
                    //               Colors.grey.withOpacity(0.7), // border color
                    //           shape: BoxShape.circle,
                    //         ),
                    //       ),
                    //       Text("Check in",
                    //           style: TextStyle(
                    //               color: Colors.white.withOpacity(0.8),
                    //               fontFamily: "Oswald",
                    //               fontSize: 13))
                    //     ],
                    //   ),
                    // ),
                    // Expanded(
                    //   child: Column(
                    //     children: <Widget>[
                    //       Container(
                    //         margin: EdgeInsets.only(left: 0),
                    //         height: 50,
                    //         padding: EdgeInsets.all(10.0),
                    //         child: Icon(
                    //           Icons.favorite,
                    //           color: Colors.white.withOpacity(0.6),
                    //           size: 15,
                    //         ),
                    //         decoration: new BoxDecoration(
                    //           color:
                    //               Colors.grey.withOpacity(0.7), // border color
                    //           shape: BoxShape.circle,
                    //         ),
                    //       ),
                    //       Text("Feelings",
                    //           style: TextStyle(
                    //               color: Colors.white.withOpacity(0.8),
                    //               fontFamily: "Oswald",
                    //               fontSize: 13))
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20, top: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          //snackBar(context);
                          postCheck();
                        },
                        child: Container(
                            padding: EdgeInsets.all(15),
                            margin:
                                EdgeInsets.only(left: 20, right: 20, top: 0),
                            decoration: BoxDecoration(
                                color: (post == "" || chk == "1")
                                    ? back_new
                                    : header,
                                border:
                                    Border.all(color: Colors.grey, width: 0.5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Text(
                              chk == "" ? "Post" : "Please wait...",
                              style: TextStyle(
                                  color: (post == "" || chk == "1")
                                      ? Colors.black26
                                      : Colors.white,
                                  fontSize: 15,
                                  fontFamily: 'BebasNeue',
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container()
        ],
      ),
    );
  }
}
