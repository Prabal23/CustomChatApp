import 'package:chatapp_new/Cards/FeedCard/feedCard.dart';
import 'package:chatapp_new/Cards/MyFeedCard/MyFeedCard.dart';
import 'package:chatapp_new/MainScreens/CreatePost/createPost.dart';
import 'package:chatapp_new/MainScreens/EditProfilePage/editProfilePage.dart';
import 'package:chatapp_new/MainScreens/FriendListPage/friendListPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'dart:io';

import '../../../../main.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

enum PhotoCrop {
  free,
  picked,
  cropped,
}

class _ProfilePageState extends State<ProfilePage> {
  SharedPreferences sharedPreferences;
  String theme = "";
  Timer _timer;
  int _start = 3;
  bool loading = true;
  PhotoCrop state;
  Future<File> bannerFile;
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

  Future<Null> _pickImage() async {
    imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      setState(() {
        state = PhotoCrop.picked;
      });
    }
  }

  Future<Null> _pickBanner(ImageSource src) async {
    setState(() {
      bannerFile = ImagePicker.pickImage(source: src);
    });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(
              color: color == "1" ? Colors.white : Colors.black54),
          //automaticallyImplyLeading: false,
          backgroundColor: color == "1"
              ? Colors.black.withOpacity(0.5)
              : Colors.white.withOpacity(0.7),
          title: Container(
            margin: EdgeInsets.only(top: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 5, right: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      //color: Colors.black.withOpacity(0.5),
                    ),
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Profile",
                          style: TextStyle(
                              color:
                                  color == "1" ? Colors.white : Colors.black54,
                              fontSize: 20,
                              fontFamily: 'Oswald',
                              fontWeight: FontWeight.normal),
                        )),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[],
        ),
        body: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: background == "1"
                      ? color == "1"
                          ? AssetImage("assets/images/black.jpg")
                          : AssetImage("assets/images/white.jpg")
                      : theme == "1" || theme == null
                          ? AssetImage("assets/images/f4.jpg")
                          : theme == "2"
                              ? AssetImage("assets/images/f.jpg")
                              : theme == "3"
                                  ? AssetImage("assets/images/f6.jpg")
                                  : theme == "4"
                                      ? AssetImage("assets/images/f5.jpg")
                                      : theme == "5"
                                          ? AssetImage(
                                              "assets/images/friend8.jpg")
                                          : theme == "6"
                                              ? AssetImage(
                                                  "assets/images/f2.jpg")
                                              : theme == "7"
                                                  ? AssetImage(
                                                      "assets/images/f9.jpg")
                                                  : theme == "8"
                                                      ? AssetImage(
                                                          "assets/images/f10.png")
                                                      : theme == "9"
                                                          ? AssetImage(
                                                              "assets/images/pattern1.jpg")
                                                          : theme == "10"
                                                              ? AssetImage(
                                                                  "assets/images/pattern2.jpg")
                                                              : AssetImage(
                                                                  "assets/images/white.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: null,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.2)),
              child: null,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: color == "1"
                      ? Colors.black.withOpacity(0.3)
                      : Colors.white.withOpacity(0.2)),
              child: null,
            ),
            Container(
              decoration: BoxDecoration(
                  //color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0))),
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverToBoxAdapter(
                      child: SingleChildScrollView(
                    child: Container(
                        child: Column(
                      children: <Widget>[
                        SafeArea(
                          child: Stack(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Container(
                                    child: FutureBuilder<File>(
                                      future: bannerFile,
                                      builder: (BuildContext context,
                                          AsyncSnapshot<File> snapshot) {
                                        if (snapshot.connectionState ==
                                                ConnectionState.done &&
                                            snapshot.data != null) {
                                          return Container(
                                              height: 200,
                                              padding:
                                                  const EdgeInsets.all(0.0),
                                              margin: EdgeInsets.only(
                                                  top: 15, left: 15, right: 15),
                                              decoration: BoxDecoration(
                                                  //color: header,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  15),
                                                          topRight:
                                                              Radius.circular(
                                                                  15)),
                                                  image: DecorationImage(
                                                      image: FileImage(
                                                          snapshot.data),
                                                      fit: BoxFit.cover)),
                                              child: null);
                                        } else if (snapshot.error != null) {
                                          return const Text(
                                            'Error Picking Image',
                                            textAlign: TextAlign.center,
                                          );
                                        } else {
                                          return Container(
                                              height: 200,
                                              padding:
                                                  const EdgeInsets.all(0.0),
                                              margin: EdgeInsets.only(
                                                  top: 15, left: 15, right: 15),
                                              decoration: BoxDecoration(
                                                  //color: header,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  15),
                                                          topRight:
                                                              Radius.circular(
                                                                  15)),
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          'assets/images/f8.jpg'),
                                                      fit: BoxFit.cover)),
                                              child: null);
                                        }
                                      },
                                    ),
                                  ),
                                  Container(
                                      height: 200,
                                      padding: const EdgeInsets.all(0.0),
                                      margin: EdgeInsets.only(
                                          top: 15, left: 15, right: 15),
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.2),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15)),
                                      ),
                                      child: null),
                                  GestureDetector(
                                    onTap: () {
                                      _pickBanner(ImageSource.gallery);
                                    },
                                    child: Container(
                                      height: 205,
                                      width: MediaQuery.of(context).size.width,
                                      margin: EdgeInsets.only(right: 10),
                                      alignment: Alignment.bottomRight,
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: back_new,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          padding: EdgeInsets.all(4),
                                          margin: EdgeInsets.only(right: 15),
                                          child: Icon(
                                            Icons.photo_camera,
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            size: 20,
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  _pickImage();
                                },
                                child: Container(
                                  child: Center(
                                    child: Stack(
                                      children: <Widget>[
                                        state == PhotoCrop.free
                                            ? Container(
                                                margin: EdgeInsets.only(
                                                    right: 0, top: 135),
                                                //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                                padding: EdgeInsets.all(5.0),
                                                child: CircleAvatar(
                                                  radius: 65.0,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  backgroundImage: AssetImage(
                                                      'assets/images/man2.jpg'),
                                                ),
                                                decoration: new BoxDecoration(
                                                  color: Colors.grey[
                                                      300], // border color
                                                  shape: BoxShape.circle,
                                                ),
                                              )
                                            : (state == PhotoCrop.picked ||
                                                    state == PhotoCrop.cropped)
                                                ? Container(
                                                    margin: EdgeInsets.only(
                                                        right: 0, top: 135),
                                                    //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                                    padding:
                                                        EdgeInsets.all(5.0),
                                                    child: CircleAvatar(
                                                        radius: 65.0,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        backgroundImage:
                                                            FileImage(
                                                                imageFile)),
                                                    decoration:
                                                        new BoxDecoration(
                                                      color: Colors.grey[
                                                          300], // border color
                                                      shape: BoxShape.circle,
                                                    ),
                                                  )
                                                : Container(
                                                    margin: EdgeInsets.only(
                                                        right: 0, top: 135),
                                                    //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                                    padding:
                                                        EdgeInsets.all(5.0),
                                                    child: CircleAvatar(
                                                      radius: 65.0,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      backgroundImage: AssetImage(
                                                          'assets/images/man2.jpg'),
                                                    ),
                                                    decoration:
                                                        new BoxDecoration(
                                                      color: Colors.grey[
                                                          300], // border color
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ),
                                        Container(
                                            decoration: BoxDecoration(
                                                color: back_new,
                                                borderRadius:
                                                    BorderRadius.circular(25)),
                                            padding: EdgeInsets.all(5),
                                            margin: EdgeInsets.only(
                                                left: 100, top: 240),
                                            child: Icon(
                                              Icons.photo_camera,
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              size: 20,
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        state == PhotoCrop.picked
                            ? Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(right: 0),
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
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: back_new),
                                            padding: EdgeInsets.only(
                                                top: 5,
                                                bottom: 5,
                                                left: 10,
                                                right: 10),
                                            margin: EdgeInsets.only(
                                                right: 5, top: 20, bottom: 10),
                                            child: Row(
                                              children: <Widget>[
                                                Icon(Icons.crop,
                                                    size: 15,
                                                    color: Colors.black87),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5),
                                                    child: Text("Crop",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black54,
                                                            fontFamily:
                                                                "Oswald"))),
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
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: header),
                                            padding: EdgeInsets.only(
                                                top: 5,
                                                bottom: 5,
                                                left: 10,
                                                right: 10),
                                            margin: EdgeInsets.only(
                                                left: 5, top: 20, bottom: 10),
                                            child: Row(
                                              children: <Widget>[
                                                Icon(Icons.done,
                                                    size: 15,
                                                    color: Colors.white),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5),
                                                    child: Text("Done",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontFamily:
                                                                "Oswald"))),
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
                        Container(
                            margin:
                                EdgeInsets.only(top: 10, right: 20, left: 20),
                            child: Text(
                              "Paul Brian",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Oswald",
                                  color: color == "1"
                                      ? Colors.white
                                      : Colors.black.withOpacity(0.5)),
                            )),
                        Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Text(
                              "Software Engineer at Appifylab",
                              style: TextStyle(
                                  color: color == "1"
                                      ? Colors.white
                                      : Colors.black.withOpacity(0.5),
                                  fontWeight: FontWeight.w300,
                                  fontFamily: "Oswald"),
                            )),
                        // Container(
                        //   margin: EdgeInsets.only(top: 5),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //     children: <Widget>[
                        //       Expanded(
                        //         child: Container(
                        //           margin: EdgeInsets.only(
                        //               left: 15, top: 15, right: 5),
                        //           padding: EdgeInsets.all(5.0),
                        //           decoration: new BoxDecoration(
                        //               color: header.withOpacity(0.8),
                        //               border:
                        //                   Border.all(width: 0.5, color: header),
                        //               borderRadius:
                        //                   BorderRadius.all(Radius.circular(5))),
                        //           child: Row(
                        //             mainAxisAlignment: MainAxisAlignment.center,
                        //             children: <Widget>[
                        //               Icon(
                        //                 Icons.label_important,
                        //                 color: Colors.white,
                        //                 size: 15,
                        //               ),
                        //               Container(
                        //                 margin: EdgeInsets.only(left: 5),
                        //                 child: Text(
                        //                   "Timeline",
                        //                   style: TextStyle(
                        //                       color: Colors.white,
                        //                       fontFamily: "Oswald",
                        //                       fontWeight: FontWeight.w300,
                        //                       fontSize: 14),
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       ),
                        //       Expanded(
                        //         child: Container(
                        //           margin: EdgeInsets.only(
                        //               left: 5, right: 5, top: 15),
                        //           padding: EdgeInsets.all(5.0),
                        //           decoration: new BoxDecoration(
                        //               color: back_new.withOpacity(0.8),
                        //               border: Border.all(
                        //                   width: 0.5, color: Colors.white),
                        //               borderRadius:
                        //                   BorderRadius.all(Radius.circular(5))),
                        //           child: Row(
                        //             mainAxisAlignment: MainAxisAlignment.center,
                        //             children: <Widget>[
                        //               Icon(
                        //                 Icons.info_outline,
                        //                 color: Colors.black,
                        //                 size: 15,
                        //               ),
                        //               Container(
                        //                 margin: EdgeInsets.only(left: 5),
                        //                 child: Text(
                        //                   "About",
                        //                   style: TextStyle(
                        //                       color: Colors.black,
                        //                       fontFamily: "Oswald",
                        //                       fontWeight: FontWeight.w300,
                        //                       fontSize: 14),
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       ),
                        //       Expanded(
                        //         child: Container(
                        //           margin: EdgeInsets.only(
                        //               left: 5, right: 15, top: 15),
                        //           padding: EdgeInsets.all(5.0),
                        //           decoration: new BoxDecoration(
                        //               color: back_new.withOpacity(0.8),
                        //               border: Border.all(
                        //                   width: 0.5, color: Colors.white),
                        //               borderRadius:
                        //                   BorderRadius.all(Radius.circular(5))),
                        //           child: Row(
                        //             mainAxisAlignment: MainAxisAlignment.center,
                        //             children: <Widget>[
                        //               Icon(
                        //                 Icons.group,
                        //                 color: Colors.black,
                        //                 size: 17,
                        //               ),
                        //               Container(
                        //                 margin: EdgeInsets.only(left: 5),
                        //                 child: Text(
                        //                   "Friends",
                        //                   style: TextStyle(
                        //                       color: Colors.black,
                        //                       fontFamily: "Oswald",
                        //                       fontWeight: FontWeight.w300,
                        //                       fontSize: 14),
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // Container(
                        //   margin: EdgeInsets.only(top: 0),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //     children: <Widget>[
                        //       Expanded(
                        //         child: Container(
                        //           margin: EdgeInsets.only(
                        //               left: 15, top: 10, right: 5),
                        //           padding: EdgeInsets.all(5.0),
                        //           decoration: new BoxDecoration(
                        //               color: back_new.withOpacity(0.8),
                        //               border: Border.all(
                        //                   width: 0.5, color: Colors.white),
                        //               borderRadius:
                        //                   BorderRadius.all(Radius.circular(5))),
                        //           child: Row(
                        //             mainAxisAlignment: MainAxisAlignment.center,
                        //             children: <Widget>[
                        //               Icon(
                        //                 Icons.photo,
                        //                 color: Colors.black,
                        //                 size: 15,
                        //               ),
                        //               Container(
                        //                 margin: EdgeInsets.only(left: 5),
                        //                 child: Text(
                        //                   "Photos",
                        //                   style: TextStyle(
                        //                       color: Colors.black,
                        //                       fontFamily: "Oswald",
                        //                       fontWeight: FontWeight.w300,
                        //                       fontSize: 14),
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       ),
                        //       Expanded(
                        //         child: Container(
                        //           margin: EdgeInsets.only(
                        //               left: 5, right: 5, top: 10),
                        //           padding: EdgeInsets.all(5.0),
                        //           decoration: new BoxDecoration(
                        //               color: back_new.withOpacity(0.8),
                        //               border: Border.all(
                        //                   width: 0.5, color: Colors.white),
                        //               borderRadius:
                        //                   BorderRadius.all(Radius.circular(5))),
                        //           child: Row(
                        //             mainAxisAlignment: MainAxisAlignment.center,
                        //             children: <Widget>[
                        //               Icon(
                        //                 Icons.event_available,
                        //                 color: Colors.black,
                        //                 size: 15,
                        //               ),
                        //               Container(
                        //                 margin: EdgeInsets.only(left: 5),
                        //                 child: Text(
                        //                   "Events",
                        //                   style: TextStyle(
                        //                       color: Colors.black,
                        //                       fontFamily: "Oswald",
                        //                       fontWeight: FontWeight.w300,
                        //                       fontSize: 14),
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       ),
                        //       Expanded(
                        //         child: Container(
                        //           margin: EdgeInsets.only(
                        //               left: 5, right: 15, top: 10),
                        //           padding: EdgeInsets.all(5.0),
                        //           decoration: new BoxDecoration(
                        //               color: back_new.withOpacity(0.8),
                        //               border: Border.all(
                        //                   width: 0.5, color: Colors.white),
                        //               borderRadius:
                        //                   BorderRadius.all(Radius.circular(5))),
                        //           child: Row(
                        //             mainAxisAlignment: MainAxisAlignment.center,
                        //             children: <Widget>[
                        //               Icon(
                        //                 Icons.more_horiz,
                        //                 color: Colors.black,
                        //                 size: 17,
                        //               ),
                        //               Container(
                        //                 margin: EdgeInsets.only(left: 5),
                        //                 child: Text(
                        //                   "More",
                        //                   style: TextStyle(
                        //                       color: Colors.black,
                        //                       fontFamily: "Oswald",
                        //                       fontWeight: FontWeight.w300,
                        //                       fontSize: 14),
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        Container(
                          margin: EdgeInsets.only(top: 30, left: 20, right: 20),
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
                                            fontSize: 13))
                                  ],
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
                                                    CreatePost()));
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(left: 0),
                                        height: 50,
                                        //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                        padding: EdgeInsets.all(10.0),
                                        child: Icon(
                                          Icons.send,
                                          color: Colors.white.withOpacity(0.6),
                                          size: 15,
                                        ),
                                        decoration: new BoxDecoration(
                                          color: Colors.grey
                                              .withOpacity(0.7), // border color
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                    Text("Create Post",
                                        style: TextStyle(
                                            color: color == "1"
                                                ? Colors.white.withOpacity(0.8)
                                                : Colors.black.withOpacity(0.5),
                                            fontFamily: "Oswald",
                                            fontSize: 13))
                                  ],
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
                                          color: Colors.white.withOpacity(0.6),
                                          size: 15,
                                        ),
                                        decoration: new BoxDecoration(
                                          color: Colors.grey
                                              .withOpacity(0.7), // border color
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                    Text("Edit Profile",
                                        style: TextStyle(
                                            color: color == "1"
                                                ? Colors.white.withOpacity(0.8)
                                                : Colors.black.withOpacity(0.5),
                                            fontFamily: "Oswald",
                                            fontSize: 13))
                                  ],
                                ),
                              ),
                              // Expanded(
                              //   child: Column(
                              //     children: <Widget>[
                              //       Container(
                              //         margin: EdgeInsets.only(left: 0),
                              //         height: 50,
                              //         //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                              //         padding: EdgeInsets.all(5.0),
                              //         child: Icon(
                              //           Icons.more_horiz,
                              //           color: Colors.white.withOpacity(0.6),
                              //         ),
                              //         decoration: new BoxDecoration(
                              //           color: Colors.grey
                              //               .withOpacity(0.7), // border color
                              //           shape: BoxShape.circle,
                              //         ),
                              //       ),
                              //       Text("More",
                              //           style: TextStyle(
                              //               color:
                              //                   Colors.white.withOpacity(0.8),
                              //               fontFamily: "Oswald",
                              //               fontSize: 13))
                              //     ],
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        Container(
                            width: 50,
                            margin: EdgeInsets.only(
                                top: 25, left: 25, right: 25, bottom: 0),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
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
                          margin: EdgeInsets.only(left: 15, right: 15, top: 20),
                          child: Row(
                            children: <Widget>[
                              Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Icon(Icons.work,
                                      size: 17,
                                      color: color == "1"
                                          ? Colors.white
                                          : Colors.black.withOpacity(0.5))),
                              Expanded(
                                child: Text.rich(
                                  TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text:
                                              "Former Android Application Developer at",
                                          style: TextStyle(
                                              color: color == "1"
                                                  ? Colors.white
                                                  : Colors.black
                                                      .withOpacity(0.5),
                                              fontSize: 15,
                                              fontFamily: "Oswald",
                                              fontWeight: FontWeight.w300)),
                                      TextSpan(
                                          text: " IT Lab Solutions Ltd",
                                          style: TextStyle(
                                              color: color == "1"
                                                  ? Colors.white
                                                  : Colors.black
                                                      .withOpacity(0.5),
                                              fontSize: 15,
                                              fontFamily: "Oswald",
                                              fontWeight: FontWeight.w400)),
                                      // can add more TextSpans here...
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15, right: 15, top: 10),
                          child: Row(
                            children: <Widget>[
                              Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Icon(Icons.work,
                                      size: 17,
                                      color: color == "1"
                                          ? Colors.white
                                          : Colors.black.withOpacity(0.5))),
                              Expanded(
                                child: Text.rich(
                                  TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: "Former student at",
                                          style: TextStyle(
                                              color: color == "1"
                                                  ? Colors.white
                                                  : Colors.black
                                                      .withOpacity(0.5),
                                              fontSize: 15,
                                              fontFamily: "Oswald",
                                              fontWeight: FontWeight.w300)),
                                      TextSpan(
                                          text:
                                              " Computer Science and Engineering",
                                          style: TextStyle(
                                              color: color == "1"
                                                  ? Colors.white
                                                  : Colors.black
                                                      .withOpacity(0.5),
                                              fontSize: 15,
                                              fontFamily: "Oswald",
                                              fontWeight: FontWeight.w400)),
                                      // can add more TextSpans here...
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                          child: Row(
                            children: <Widget>[
                              Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Icon(Icons.book,
                                      size: 17,
                                      color: color == "1"
                                          ? Colors.white
                                          : Colors.black.withOpacity(0.5))),
                              Expanded(
                                child: Text.rich(
                                  TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: "Studied at",
                                          style: TextStyle(
                                              color: color == "1"
                                                  ? Colors.white
                                                  : Colors.black
                                                      .withOpacity(0.5),
                                              fontSize: 15,
                                              fontFamily: "Oswald",
                                              fontWeight: FontWeight.w300)),
                                      TextSpan(
                                          text: " Leading University, Sylhet",
                                          style: TextStyle(
                                              color: color == "1"
                                                  ? Colors.white
                                                  : Colors.black
                                                      .withOpacity(0.5),
                                              fontSize: 15,
                                              fontFamily: "Oswald",
                                              fontWeight: FontWeight.w400)),
                                      // can add more TextSpans here...
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                          child: Row(
                            children: <Widget>[
                              Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Icon(Icons.book,
                                      size: 17,
                                      color: color == "1"
                                          ? Colors.white
                                          : Colors.black.withOpacity(0.5))),
                              Expanded(
                                child: Text.rich(
                                  TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: "Studied at",
                                          style: TextStyle(
                                              color: color == "1"
                                                  ? Colors.white
                                                  : Colors.black
                                                      .withOpacity(0.5),
                                              fontSize: 15,
                                              fontFamily: "Oswald",
                                              fontWeight: FontWeight.w300)),
                                      TextSpan(
                                          text: " MC College, Sylhet",
                                          style: TextStyle(
                                              color: color == "1"
                                                  ? Colors.white
                                                  : Colors.black
                                                      .withOpacity(0.5),
                                              fontSize: 15,
                                              fontFamily: "Oswald",
                                              fontWeight: FontWeight.w400)),
                                      // can add more TextSpans here...
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                          child: Row(
                            children: <Widget>[
                              Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Icon(Icons.book,
                                      size: 17,
                                      color: color == "1"
                                          ? Colors.white
                                          : Colors.black.withOpacity(0.5))),
                              Expanded(
                                child: Text.rich(
                                  TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: "Studied at",
                                          style: TextStyle(
                                              color: color == "1"
                                                  ? Colors.white
                                                  : Colors.black
                                                      .withOpacity(0.5),
                                              fontSize: 15,
                                              fontFamily: "Oswald",
                                              fontWeight: FontWeight.w300)),
                                      TextSpan(
                                          text:
                                              " Sylhet Govt. Pilot High School, Sylhet",
                                          style: TextStyle(
                                              color: color == "1"
                                                  ? Colors.white
                                                  : Colors.black
                                                      .withOpacity(0.5),
                                              fontSize: 15,
                                              fontFamily: "Oswald",
                                              fontWeight: FontWeight.w400)),
                                      // can add more TextSpans here...
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                          child: Row(
                            children: <Widget>[
                              Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Icon(Icons.more_horiz,
                                      size: 17,
                                      color: color == "1"
                                          ? Colors.white
                                          : Colors.black.withOpacity(0.5))),
                              Expanded(
                                child: Text.rich(
                                  TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: "See Your About Info",
                                          style: TextStyle(
                                              color: color == "1"
                                                  ? Colors.white
                                                  : Colors.black
                                                      .withOpacity(0.5),
                                              fontSize: 15,
                                              fontFamily: "Oswald",
                                              fontWeight: FontWeight.w300)),

                                      // can add more TextSpans here...
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Container(
                        //     alignment: Alignment.center,
                        //     width: MediaQuery.of(context).size.width,
                        //     padding: EdgeInsets.all(10),
                        //     decoration: BoxDecoration(
                        //         color: header.withOpacity(0.8),
                        //         borderRadius:
                        //             BorderRadius.all(Radius.circular(5))),
                        //     margin: EdgeInsets.all(15),
                        //     child: Text("Edit Public Details",
                        //         style: TextStyle(
                        //             color: Colors.white,
                        //             fontFamily: "Oswald",
                        //             fontWeight: FontWeight.w300,
                        //             fontSize: 16))),

                        // Container(
                        //     width: 50,
                        //     margin: EdgeInsets.only(
                        //         top: 25, left: 25, right: 25, bottom: 0),
                        //     decoration: BoxDecoration(
                        //         borderRadius:
                        //             BorderRadius.all(Radius.circular(15.0)),
                        //         color: header,
                        //         boxShadow: [
                        //           BoxShadow(
                        //             blurRadius: 1.0,
                        //             color: header,
                        //             //offset: Offset(6.0, 7.0),
                        //           ),
                        //         ],
                        //         border: Border.all(width: 0.5, color: header))),
                        // Container(
                        //   margin:
                        //       EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 10),
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: <Widget>[
                        //       Row(
                        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //         children: <Widget>[
                        //           Text("Friends",
                        //               style: TextStyle(
                        //                   color: Colors.black,
                        //                   fontWeight: FontWeight.bold,
                        //                   fontSize: 20)),
                        //           Text(
                        //             "All Friends",
                        //             style: TextStyle(color: header, fontSize: 17),
                        //           )
                        //         ],
                        //       ),
                        //       Container(
                        //         margin: EdgeInsets.only(top: 3),
                        //         child: Text(
                        //           "250 Friends",
                        //           style: TextStyle(color: Colors.black54, fontSize: 15),
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // ),
                        // // Container(
                        // //     alignment: Alignment.center,
                        // //     width: MediaQuery.of(context).size.width,
                        // //     padding: EdgeInsets.all(10),
                        // //     decoration: BoxDecoration(
                        // //         color: Colors.grey.withOpacity(0.2),
                        // //         borderRadius: BorderRadius.all(Radius.circular(5))),
                        // //     margin: EdgeInsets.all(10),
                        // //     child: Text("See All Friends",
                        // //         style: TextStyle(
                        // //             color: Colors.black,
                        // //             fontWeight: FontWeight.bold,
                        // //             fontSize: 16))),
                        // Container(
                        //     height: 2,
                        //     margin: EdgeInsets.only(top: 10, bottom: 20),
                        //     child: Divider(
                        //       color: Colors.grey[300],
                        //     )),
                        // Container(
                        //   margin:
                        //       EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 10),
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: <Widget>[
                        //       Row(
                        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //         children: <Widget>[
                        //           Text("Photos",
                        //               style: TextStyle(
                        //                   color: Colors.black,
                        //                   fontWeight: FontWeight.bold,
                        //                   fontSize: 20)),
                        //           Text(
                        //             "See Photos",
                        //             style: TextStyle(color: header, fontSize: 17),
                        //           )
                        //         ],
                        //       ),
                        //       Container(
                        //         margin: EdgeInsets.only(top: 3),
                        //         child: Text(
                        //           "12 Albums",
                        //           style: TextStyle(color: Colors.black54, fontSize: 15),
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // ),
                        // Container(
                        //     height: 2,
                        //     margin: EdgeInsets.only(top: 10, bottom: 20),
                        //     child: Divider(
                        //       color: Colors.grey[300],
                        //     )),
                        // Container(
                        //   margin:
                        //       EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 10),
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: <Widget>[
                        //       Row(
                        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //         children: <Widget>[
                        //           Text("Events",
                        //               style: TextStyle(
                        //                   color: Colors.black,
                        //                   fontWeight: FontWeight.bold,
                        //                   fontSize: 20)),
                        //           Text(
                        //             "See Events",
                        //             style: TextStyle(color: header, fontSize: 17),
                        //           )
                        //         ],
                        //       ),
                        //       Container(
                        //         margin: EdgeInsets.only(top: 3),
                        //         child: Text(
                        //           "3 Events This Week",
                        //           style: TextStyle(color: Colors.black54, fontSize: 15),
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // ),
                        // Container(
                        //     height: 2,
                        //     margin: EdgeInsets.only(top: 10, bottom: 20),
                        //     child: Divider(
                        //       color: Colors.grey[300],
                        //     )),
                        Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          //color: sub_white,
                          child: Container(
                            //color: Colors.white,
                            child: Column(
                              children: <Widget>[
                                Container(
                                    width: 50,
                                    margin: EdgeInsets.only(
                                        top: 20,
                                        left: 25,
                                        right: 25,
                                        bottom: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15.0)),
                                        color: header,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 1.0,
                                            color: header,
                                            //offset: Offset(6.0, 7.0),
                                          ),
                                        ],
                                        border: Border.all(
                                            width: 0.5, color: header))),
                                Column(
                                  children: <Widget>[
                                    Container(
                                        alignment: Alignment.centerLeft,
                                        margin:
                                            EdgeInsets.only(top: 15, left: 20),
                                        child: Text(
                                          "Friends",
                                          style: TextStyle(
                                              color: color == "1"
                                                  ? Colors.white
                                                  : Colors.black
                                                      .withOpacity(0.5),
                                              fontSize: 20,
                                              fontFamily: 'Oswald',
                                              fontWeight: FontWeight.normal),
                                        )),
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          width: 30,
                                          margin: EdgeInsets.only(
                                              top: 10, left: 20),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15.0)),
                                              color: color == "1"
                                                  ? Colors.white
                                                  : Colors.black
                                                      .withOpacity(0.5),
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 3.0,
                                                  color: color == "1"
                                                      ? Colors.white
                                                      : Colors.black
                                                          .withOpacity(0.5),
                                                  //offset: Offset(6.0, 7.0),
                                                ),
                                              ],
                                              border: Border.all(
                                                  width: 0.5,
                                                  color: color == "1"
                                                      ? Colors.white
                                                      : Colors.black
                                                          .withOpacity(0.5))),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                            alignment: Alignment.centerLeft,
                                            margin: EdgeInsets.only(
                                                top: 12, left: 20, bottom: 0),
                                            child: Text(
                                              "3 friends",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  color: color == "1"
                                                      ? Colors.white70
                                                      : Colors.black
                                                          .withOpacity(0.5),
                                                  fontSize: 13,
                                                  fontFamily: 'Oswald',
                                                  fontWeight: FontWeight.w400),
                                            )),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        FriendListPage()));
                                          },
                                          child: Container(
                                              alignment: Alignment.centerLeft,
                                              margin: EdgeInsets.only(
                                                  top: 12,
                                                  right: 20,
                                                  bottom: 0),
                                              child: Row(
                                                children: <Widget>[
                                                  Text(
                                                    "See all",
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        color: color == "1"
                                                            ? back_new
                                                            : Colors.black
                                                                .withOpacity(
                                                                    0.5),
                                                        fontSize: 13,
                                                        fontFamily: 'Oswald',
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  Container(
                                                    margin:
                                                        EdgeInsets.only(top: 3),
                                                    child: Icon(
                                                        Icons.chevron_right,
                                                        color: color == "1"
                                                            ? back_new
                                                            : Colors.black
                                                                .withOpacity(
                                                                    0.5),
                                                        size: 17),
                                                  )
                                                ],
                                              )),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
                  )),
                  SliverPadding(
                    padding: EdgeInsets.only(right: 20, left: 5),
                    sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 120.0,
                        mainAxisSpacing: 0.0,
                        crossAxisSpacing: 0.0,
                        childAspectRatio: 1.0,
                      ),
                      delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => HotelSearchPage()),
                            // );
                          },
                          child: new Container(
                            margin: EdgeInsets.only(
                                left: 15, right: 0, top: 5, bottom: 10),
                            padding: EdgeInsets.only(left: 0),
                            height: 100,
                            width: 90,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: index == 0
                                    ? AssetImage('assets/images/user.png')
                                    : index == 1
                                        ? AssetImage('assets/images/man4.jpg')
                                        : AssetImage('assets/images/user.png'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3.0,
                                  color: Colors.black.withOpacity(.5),
                                  //offset: Offset(6.0, 7.0),
                                ),
                              ],
                              // border: Border.all(width: 0.2, color: Colors.grey)
                            ),
                            child: Stack(
                              children: <Widget>[
                                Container(
                                    margin: EdgeInsets.only(left: 0),
                                    padding: EdgeInsets.only(left: 0),
                                    height: 110,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.3),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                    )),
                                Container(
                                    alignment: Alignment.bottomLeft,
                                    margin: EdgeInsets.only(
                                        top: 10, left: 10, bottom: 5),
                                    child: Text(
                                      index == 0
                                          ? "John Louis"
                                          : index == 1
                                              ? "David King"
                                              : "Daniel Ryan",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontFamily: 'Oswald',
                                          fontWeight: FontWeight.w300),
                                    )),
                              ],
                            ),
                          ),
                        );
                      }, childCount: loading ? 1 : 3),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            width: 50,
                            margin: EdgeInsets.only(
                                top: 20, left: 25, right: 25, bottom: 20),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                color: header,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 1.0,
                                    color: header,
                                    //offset: Offset(6.0, 7.0),
                                  ),
                                ],
                                border: Border.all(width: 0.5, color: header))),
                      ],
                    ),
                  ),
                  // SliverPadding(
                  //   padding: EdgeInsets.only(right: 20, left: 5),
                  //   sliver: SliverGrid(
                  //     gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  //       maxCrossAxisExtent: 200.0,
                  //       mainAxisSpacing: 0.0,
                  //       crossAxisSpacing: 0.0,
                  //       childAspectRatio: 1.0,
                  //     ),
                  //     delegate: SliverChildBuilderDelegate(
                  //         (BuildContext context, int index) {
                  //       return GestureDetector(
                  //         onTap: () {
                  //           // Navigator.push(
                  //           //   context,
                  //           //   MaterialPageRoute(
                  //           //       builder: (context) => HotelSearchPage()),
                  //           // );
                  //         },
                  //         child: new Container(
                  //           margin: EdgeInsets.only(
                  //               left: 15, right: 0, top: 5, bottom: 10),
                  //           padding: EdgeInsets.only(left: 0),
                  //           height: 100,
                  //           width: 100,
                  //           decoration: BoxDecoration(
                  //             image: DecorationImage(
                  //               image: index == 0
                  //                   ? AssetImage("assets/images/f6.jpg")
                  //                   : AssetImage("assets/images/f7.jpg"),
                  //               fit: BoxFit.cover,
                  //             ),
                  //             borderRadius:
                  //                 BorderRadius.all(Radius.circular(5.0)),
                  //             color: Colors.white,
                  //             boxShadow: [
                  //               BoxShadow(
                  //                 blurRadius: 3.0,
                  //                 color: Colors.black.withOpacity(.5),
                  //                 //offset: Offset(6.0, 7.0),
                  //               ),
                  //             ],
                  //             // border: Border.all(width: 0.2, color: Colors.grey)
                  //           ),
                  //           child: Stack(
                  //             children: <Widget>[
                  //               Container(
                  //                   margin: EdgeInsets.only(left: 0),
                  //                   padding: EdgeInsets.only(left: 0),
                  //                   height: 160,
                  //                   width: 170,
                  //                   decoration: BoxDecoration(
                  //                     color: Colors.black.withOpacity(0.3),
                  //                     borderRadius: BorderRadius.all(
                  //                         Radius.circular(5.0)),
                  //                   )),
                  //               Container(
                  //                   alignment: Alignment.bottomLeft,
                  //                   margin: EdgeInsets.only(
                  //                       top: 10, left: 10, bottom: 5),
                  //                   child: Text(
                  //                     index == 0 ? "Photos" : "Events",
                  //                     maxLines: 1,
                  //                     overflow: TextOverflow.ellipsis,
                  //                     style: TextStyle(
                  //                         color: Colors.white,
                  //                         fontSize: 20,
                  //                         fontFamily: 'Oswald',
                  //                         fontWeight: FontWeight.bold),
                  //                   )),
                  //             ],
                  //           ),
                  //         ),
                  //       );
                  //     }, childCount: 2),
                  //   ),
                  // ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: <Widget>[
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: <Widget>[
                        //     Container(
                        //         width: 50,
                        //         margin: EdgeInsets.only(
                        //             top: 15, left: 25, right: 25, bottom: 10),
                        //         decoration: BoxDecoration(
                        //             borderRadius:
                        //                 BorderRadius.all(Radius.circular(15.0)),
                        //             color: header,
                        //             boxShadow: [
                        //               BoxShadow(
                        //                 blurRadius: 1.0,
                        //                 color: header,
                        //                 //offset: Offset(6.0, 7.0),
                        //               ),
                        //             ],
                        //             border:
                        //                 Border.all(width: 0.5, color: header))),
                        //   ],
                        // ),
                        Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(top: 15, left: 20),
                            child: Text(
                              "Timeline",
                              style: TextStyle(
                                  color: color == "1"
                                      ? Colors.white
                                      : Colors.black.withOpacity(0.5),
                                  fontSize: 20,
                                  fontFamily: 'Oswald',
                                  fontWeight: FontWeight.normal),
                            )),
                        Row(
                          children: <Widget>[
                            Container(
                              width: 30,
                              margin: EdgeInsets.only(
                                  top: 10, left: 20, bottom: 10),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                  color: color == "1"
                                      ? Colors.white
                                      : Colors.black.withOpacity(0.5),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 3.0,
                                      color: color == "1"
                                          ? Colors.white
                                          : Colors.black.withOpacity(0.5),
                                      //offset: Offset(6.0, 7.0),
                                    ),
                                  ],
                                  border: Border.all(
                                      width: 0.5,
                                      color: color == "1"
                                          ? Colors.white
                                          : Colors.black.withOpacity(0.5))),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return MyFeedCard(loading, index);
                    }, childCount: 2),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
