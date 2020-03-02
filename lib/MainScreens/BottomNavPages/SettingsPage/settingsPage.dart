import 'package:chatapp_new/MainScreens/ColorPage/ColorPage.dart';
import 'package:chatapp_new/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

import 'ThemePage/themePage.dart';

class SettingsPage extends StatefulWidget {
  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  SharedPreferences sharedPreferences;
  String theme = "";

  @override
  void initState() {
    sharedPrefcheck();
    super.initState();
  }

  void sharedPrefcheck() async {
    sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
      theme = sharedPreferences.getString("theme");
    });
    //print(theme);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: theme == "1" || theme == null
                    ? AssetImage("assets/images/f4.jpg")
                    : theme == "2"
                        ? AssetImage("assets/images/f.jpg")
                        : theme == "3"
                            ? AssetImage("assets/images/f6.jpg")
                            : theme == "4"
                                ? AssetImage("assets/images/f5.jpg")
                                : theme == "5"
                                    ? AssetImage("assets/images/friend8.jpg")
                                    : theme == "6"
                                        ? AssetImage("assets/images/f2.jpg")
                                        : theme == "7"
                                            ? AssetImage("assets/images/f9.jpg")
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
            decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5)),
            child: null,
          ),
          Container(
            decoration: BoxDecoration(
                color: color == "1"
                    ? Colors.black.withOpacity(0.3)
                    : Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0), topRight: Radius.circular(0))),
            margin: EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 0),
            child: CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Column(
                    children: <Widget>[
                      Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(top: 15, left: 20),
                          child: Text(
                            "Settings",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'Oswald',
                                fontWeight: FontWeight.normal),
                          )),
                      Row(
                        children: <Widget>[
                          Container(
                            width: 30,
                            margin:
                                EdgeInsets.only(top: 10, left: 20, bottom: 15),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 3.0,
                                    color: Colors.white,
                                    //offset: Offset(6.0, 7.0),
                                  ),
                                ],
                                border: Border.all(
                                    width: 0.5,
                                    color: Colors.white)),
                          ),
                        ],
                      ),
                      // SizedBox(
                      //   width: 200.0,
                      //   height: 100.0,
                      //   child: Shimmer.fromColors(
                      //     baseColor: Colors.grey,
                      //     highlightColor: Colors.white,
                      //     child: Column(
                      //       children: <Widget>[
                      //         Text(
                      //           'Shimmer',
                      //           textAlign: TextAlign.center,
                      //           style: TextStyle(
                      //             fontSize: 40.0,
                      //             fontWeight: FontWeight.bold,
                      //           ),
                      //         ),
                      //         Container(
                      //           height: 20,
                      //           width: 20,
                      //           child: ClipOval(
                      //             child: Container(
                      //               height: 64,
                      //               width: 64,
                      //               color: Colors.black,
                      //             ),
                      //           ),
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        if (index == 0) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ThemePage()));
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ColorPage()));
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        decoration: BoxDecoration(
                          color: color == "1"
                              ? Colors.black.withOpacity(0.3)
                              : Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(15),
                          //border: Border.all(width: 0.8, color: Colors.grey[300]),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 1.0,
                              color: color == "1"
                                  ? Colors.black38
                                  : Colors.white70,
                              //offset: Offset(6.0, 7.0),
                            ),
                          ],
                        ),
                        margin: EdgeInsets.only(
                            top: 2.5, bottom: 2.5, left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                //color: Colors.red,
                                margin: EdgeInsets.only(
                                    left: 20, right: 20, top: 0),
                                padding: EdgeInsets.only(right: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            index == 0 ? "Background" : "Theme",
                                            // : index == 1
                                            //     ? "General"
                                            //     : index == 2
                                            //         ? "Security"
                                            //         : index == 3
                                            //             ? "Terms and conditions"
                                            //             : "Privacy Policy",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: color == "1"
                                                    ? Colors.white
                                                    : Colors.black54,
                                                fontFamily: 'Oswald',
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.all(2),
                                margin: EdgeInsets.only(right: 15),
                                child: Icon(
                                  Icons.chevron_right,
                                  color: color == "1"
                                      ? Colors.white70
                                      : Colors.black45,
                                  size: 17,
                                ))
                          ],
                        ),
                      ),
                    );
                  }, childCount: 2),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
