import 'package:chatapp_new/MainScreens/CreatePost/createPost.dart';
import 'package:chatapp_new/MainScreens/EditProfilePage/editProfilePage.dart';
import 'package:chatapp_new/MainScreens/ProfilePage/MyProfile/DetailsPage/detailsPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:intl/intl.dart';
import 'dart:io';

import '../../../main.dart';

class ProfileNewPage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

enum PhotoCrop {
  free,
  picked,
  cropped,
}

class _ProfilePageState extends State<ProfileNewPage> {
  SharedPreferences sharedPreferences;
  String theme = "";
  Timer _timer;
  int _start = 3;
  bool loading = true;
  PhotoCrop state;

  File imageFile;

  @override
  void initState() {
    sharedPrefcheck();
    timerCheck();
    state = PhotoCrop.free;
    super.initState();
  }

  void sharedPrefcheck() async {
    sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
      theme = sharedPreferences.getString("theme");
    });
    //print(theme);
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
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:
                      // state == PhotoCrop.free
                      //     ? theme == "1" || theme == null
                      //         ? AssetImage("assets/images/f4.jpg")
                      //         : theme == "2"
                      //             ? AssetImage("assets/images/f.jpg")
                      //             : theme == "3"
                      //                 ? AssetImage("assets/images/f6.jpg")
                      //                 : theme == "4"
                      //                     ? AssetImage("assets/images/f5.jpg")
                      //                     : theme == "5"
                      //                         ? AssetImage(
                      //                             "assets/images/friend8.jpg")
                      //                         : theme == "6"
                      //                             ? AssetImage(
                      //                                 "assets/images/f2.jpg")
                      //                             : theme == "7"
                      //                                 ? AssetImage(
                      //                                     "assets/images/f9.jpg")
                      //                                 : theme == "8"
                      //                                     ? AssetImage(
                      //                                         "assets/images/f10.png")
                      //                                     : theme == "9"
                      //                                         ? AssetImage(
                      //                                             "assets/images/pattern1.jpg")
                      //                                         : theme == "10"
                      //                                             ? AssetImage(
                      //                                                 "assets/images/pattern2.jpg")
                      //                                             : AssetImage(
                      //                                                 "assets/images/white.jpg")
                      //     :
                      imageFile == null
                          ? AssetImage("assets/images/man2.jpg")
                          : FileImage(imageFile),
                  fit: BoxFit.cover,
                ),
              ),
              child: null,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.3)),
              child: null,
            ),

            // Container(
            //   width: MediaQuery.of(context).size.width,
            //   margin: EdgeInsets.only(top: 70),
            //   decoration: BoxDecoration(color: Colors.black.withOpacity(0.3), borderRadius: BorderRadius.only(
            //           topLeft: Radius.circular(25),
            //           topRight: Radius.circular(25))),
            //   child: null,
            // ),
            Container(
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  color: color == "1"
                      ? Colors.black.withOpacity(0.3)
                      : Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0))),
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(),
                      Container(
                        alignment: Alignment.bottomCenter,
                        decoration: BoxDecoration(
                            color: color == "1"
                                ? Colors.black.withOpacity(0.5)
                                : Colors.white.withOpacity(0.75),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25))),
                        margin: EdgeInsets.only(top: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(top: 20, left: 20),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        "Paul Brian",
                                        style: TextStyle(
                                            color: color == "1"
                                                ? Colors.white
                                                : Colors.black54,
                                            fontSize: 22,
                                            fontFamily: 'Oswald',
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                  ],
                                )),
                            Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(top: 0, left: 20),
                                child: Text(
                                  "Software Engineer at Appifylab",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: color == "1"
                                          ? Colors.white70
                                          : Colors.black87,
                                      fontSize: 13,
                                      fontFamily: 'Oswald',
                                      fontWeight: FontWeight.w300),
                                )),
                            Row(
                              children: <Widget>[
                                Container(
                                  width: 30,
                                  margin: EdgeInsets.only(top: 10, left: 20),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 3.0,
                                          color: Colors.white,
                                          //offset: Offset(6.0, 7.0),
                                        ),
                                      ],
                                      border: Border.all(
                                          width: 0.5, color: Colors.white)),
                                ),
                              ],
                            ),
                            Container(
                              margin:
                                  EdgeInsets.only(top: 10, left: 20, right: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                              padding: EdgeInsets.all(5.0),
                                              child: Icon(
                                                Icons.add,
                                                color: header,
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
                                              padding: EdgeInsets.all(5.0),
                                              child: Icon(
                                                Icons.add,
                                                color: header,
                                              ),
                                              decoration: new BoxDecoration(
                                                color: sub_white.withOpacity(
                                                    0.7), // border color
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text("Add to story",
                                            style: TextStyle(
                                                color: header,
                                                fontFamily: "Oswald",
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400))
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CreatePost()));
                                      },
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only(left: 0),
                                            height: 50,
                                            //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                            padding: EdgeInsets.all(10.0),
                                            child: Icon(
                                              Icons.send,
                                              color:
                                                  Colors.white.withOpacity(0.6),
                                              size: 15,
                                            ),
                                            decoration: new BoxDecoration(
                                              color: Colors.grey.withOpacity(
                                                  0.7), // border color
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          Text("Create Post",
                                              style: TextStyle(
                                                  color: color == "1"
                                                      ? Colors.white
                                                          .withOpacity(0.8)
                                                      : Colors.black54
                                                          .withOpacity(0.6),
                                                  fontFamily: "Oswald",
                                                  fontSize: 13))
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        EditProfilePage()));
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(left: 0),
                                            height: 50,
                                            //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                            padding: EdgeInsets.all(10.0),
                                            child: Icon(
                                              Icons.edit,
                                              color:
                                                  Colors.white.withOpacity(0.6),
                                              size: 15,
                                            ),
                                            decoration: new BoxDecoration(
                                              color: Colors.grey.withOpacity(
                                                  0.7), // border color
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ),
                                        Text("Edit Profile",
                                            style: TextStyle(
                                                color: color == "1"
                                                    ? Colors.white
                                                        .withOpacity(0.8)
                                                    : Colors.black54
                                                        .withOpacity(0.6),
                                                fontFamily: "Oswald",
                                                fontSize: 13))
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        _pickImage();
                                      },
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only(left: 0),
                                            height: 50,
                                            //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                            padding: EdgeInsets.all(10.0),
                                            child: Icon(
                                              Icons.photo_camera,
                                              color:
                                                  Colors.white.withOpacity(0.6),
                                              size: 15,
                                            ),
                                            decoration: new BoxDecoration(
                                              color: Colors.grey.withOpacity(
                                                  0.7), // border color
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          Text("Profile Photo",
                                              style: TextStyle(
                                                  color: color == "1"
                                                      ? Colors.white
                                                          .withOpacity(0.8)
                                                      : Colors.black54
                                                          .withOpacity(0.6),
                                                  fontFamily: "Oswald",
                                                  fontSize: 13))
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10, top: 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                //mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProfilePage()),
                                        );
                                      },
                                      child: Container(
                                          padding: EdgeInsets.all(10),
                                          margin: EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                              top: 0,
                                              bottom: 10),
                                          decoration: BoxDecoration(
                                              color: back_new,
                                              border: Border.all(
                                                  color: Colors.grey,
                                                  width: 0.5),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15))),
                                          child: Text(
                                            "View Profile",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 80,
              color: state == PhotoCrop.picked
                  ? Colors.black.withOpacity(0.3)
                  : Colors.transparent,
              child: state == PhotoCrop.picked
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin:
                              EdgeInsets.only(bottom: 10, left: 10, top: 10),
                          width: 60,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: FileImage(imageFile),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: null,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  _cropImage();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      //shape: BoxShape.circle,
                                      borderRadius: BorderRadius.circular(15),
                                      color: back_new),
                                  padding: EdgeInsets.only(
                                      top: 5, bottom: 5, left: 10, right: 10),
                                  margin: EdgeInsets.only(
                                      right: 5, top: 20, bottom: 10),
                                  child: Row(
                                    children: <Widget>[
                                      Icon(Icons.crop,
                                          size: 15, color: Colors.black87),
                                      Container(
                                          margin: EdgeInsets.only(left: 5),
                                          child: Text("Crop",
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontFamily: "Oswald"))),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    state = PhotoCrop.cropped;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      //shape: BoxShape.circle,
                                      borderRadius: BorderRadius.circular(15),
                                      color: header),
                                  padding: EdgeInsets.only(
                                      top: 5, bottom: 5, left: 10, right: 10),
                                  margin: EdgeInsets.only(
                                      left: 5, top: 20, bottom: 10),
                                  child: Row(
                                    children: <Widget>[
                                      Icon(Icons.done,
                                          size: 15, color: Colors.white),
                                      Container(
                                          margin: EdgeInsets.only(left: 5),
                                          child: Text("Done",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: "Oswald"))),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  : Container(),
            )
          ],
        ));
  }

  Widget _buildButtonIcon() {
    if (state == PhotoCrop.free) {
      return GestureDetector(
        onTap: () {
          _pickImage();
        },
        child: Stack(
          children: <Widget>[
            new Container(
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 5, color: Colors.blue[100]),
                          top: BorderSide(width: 5, color: Colors.blue[100]),
                          left: BorderSide(width: 5, color: Colors.blue[100]),
                          right: BorderSide(width: 5, color: Colors.blue[100]),
                        ),
                        shape: BoxShape.circle),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/man.png',
                        height: 85,
                        width: 85,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              child: Container(
                  width: 35,
                  height: 35,
                  margin: EdgeInsets.only(top: 60, left: 70),
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF01D56A),
                  ),
                  child: Icon(
                    Icons.photo_camera,
                    color: Color(0xFFFFFFFF),
                  )),
            )
          ],
        ),
      );
    }
    // return Icon(Icons.add);
    else if (state == PhotoCrop.picked)
      return Column(
        children: <Widget>[
          imageFile != null ? Image.file(imageFile) : Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.teal),
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.only(left: 20, top: 20, bottom: 20),
                child: Center(
                  child: IconButton(
                    icon: Icon(
                      Icons.crop,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      _cropImage();
                    },
                  ),
                ),
              ),
              Container(
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.teal),
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.only(right: 20, top: 20, bottom: 20),
                child: Center(
                  child: IconButton(
                    icon: Icon(Icons.done, color: Colors.white),
                    onPressed: () {
                      setState(() {
                        state = PhotoCrop.cropped;
                      });
                    },
                  ),
                ),
              ),
            ],
          )
        ],
      ); //Icon(Icons.crop);
    else if (state == PhotoCrop.cropped) {
      return GestureDetector(
        onTap: () {
          _pickImage();
        },
        child: Stack(
          children: <Widget>[
            new Container(
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 5, color: Colors.blue[100]),
                          top: BorderSide(width: 5, color: Colors.blue[100]),
                          left: BorderSide(width: 5, color: Colors.blue[100]),
                          right: BorderSide(width: 5, color: Colors.blue[100]),
                        ),
                        shape: BoxShape.circle),
                    child: ClipOval(
                        child: Image.file(
                      imageFile,
                      height: 85,
                      width: 85,
                      fit: BoxFit.cover,
                    )
                        //  Image.asset(
                        //    imageFile,
                        //  // 'assets/images/nen.jpg',
                        //   height: 85,
                        //   width: 85,
                        //   fit: BoxFit.cover,
                        // ),
                        ),
                  ),
                ],
              ),
            ),
            Positioned(
              child: Container(
                  width: 35,
                  height: 35,
                  margin: EdgeInsets.only(top: 60, left: 70),
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF01D56A),
                  ),
                  child: Icon(
                    Icons.photo_camera,
                    color: Color(0xFFFFFFFF),
                  )),
            )
          ],
        ),
      );
    } // imageFile != null ? Image.file(imageFile) : Container(); //Icon(Icons.clear);
    else
      return Container();
  }

  Future<Null> _pickImage() async {
    imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      setState(() {
        state = PhotoCrop.picked;
      });
    }
  }

  Future<Null> _cropImage() async {
    File croppedFile = await ImageCropper.cropImage(
      sourcePath: imageFile.path,
      toolbarTitle: 'Cropper',
      toolbarColor: Colors.black.withOpacity(0.5),
      toolbarWidgetColor: Colors.white,
    );
    if (croppedFile != null) {
      imageFile = croppedFile;
      setState(() {
        // state = PhotoCrop.free;
        state = PhotoCrop.cropped;
      });
    }
  }
}
