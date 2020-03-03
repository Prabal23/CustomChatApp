import 'package:custom_switch_button/custom_switch_button.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../main.dart';

class ThemePage extends StatefulWidget {
  @override
  ThemePageState createState() => ThemePageState();
}

class ThemePageState extends State<ThemePage> {
  SharedPreferences sharedPreferences;
  String theme = "";
  bool isChecked = false;

  @override
  void initState() {
    sharedPrefcheck();
    super.initState();
  }

  void sharedPrefcheck() async {
    sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
      theme = sharedPreferences.getString("theme");
      background = sharedPreferences.getString("background");
      if (background == "2") {
        isChecked = true;
      }
    });
    //print(theme);
  }

  void sharedPrefput(int index) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    theme = "$index";

    localStorage.setString("theme", theme);
    print("theme");
    print(theme);
  }

  void sharedPrefbackground(int index) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    background = "$index";

    localStorage.setString("background", background);
    print("background");
    print(background);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme:
            IconThemeData(color: color == "1" ? Colors.white : Colors.black54),
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
                        "Background",
                        style: TextStyle(
                            color: color == "1" ? Colors.white : Colors.black54,
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
                                            ? AssetImage("assets/images/f2.jpg")
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(top: 15, left: 20),
                                child: Text(
                                  "Select Picture",
                                  style: TextStyle(
                                      color: background == "1"
                                          ? color == "1"
                                              ? Colors.white
                                              : Colors.black54
                                          : Colors.white,
                                      fontSize: 18,
                                      fontFamily: 'Oswald',
                                      fontWeight: FontWeight.normal),
                                )),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isChecked = !isChecked;
                                  if (isChecked) {
                                    sharedPrefbackground(2);
                                  } else {
                                    sharedPrefbackground(1);
                                  }
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.only(right: 20, top: 15),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                        alignment: Alignment.centerLeft,
                                        margin: EdgeInsets.only(right: 5),
                                        child: Text(
                                          "Background",
                                          style: TextStyle(
                                              color: background == "1"
                                                  ? color == "1"
                                                      ? Colors.white
                                                      : Colors.black54
                                                  : Colors.white,
                                              fontSize: 13,
                                              fontFamily: 'Oswald',
                                              fontWeight: FontWeight.w300),
                                        )),
                                    CustomSwitchButton(
                                      // buttonWidth: 40,
                                      // buttonHeight: 20,
                                      backgroundColor: !isChecked
                                          ? Colors.grey.withOpacity(0.5)
                                          : back_new,
                                      unCheckedColor:
                                          Colors.grey.withOpacity(0.7),
                                      animationDuration:
                                          Duration(milliseconds: 400),
                                      checkedColor: header,
                                      checked: isChecked,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            width: 30,
                            margin:
                                EdgeInsets.only(top: 10, left: 20, bottom: 15),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                color: background == "1"
                                    ? color == "1"
                                        ? Colors.white
                                        : Colors.black54
                                    : Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 3.0,
                                    color: background == "1"
                                        ? color == "1"
                                            ? Colors.white
                                            : Colors.black54
                                        : Colors.white,
                                    //offset: Offset(6.0, 7.0),
                                  ),
                                ],
                                border: Border.all(
                                    width: 0.5,
                                    color: background == "1"
                                        ? color == "1"
                                            ? Colors.white
                                            : Colors.black54
                                        : Colors.white)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  sliver: Container(
                    child: SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              int i = index;
                              setState(() {
                                i++;
                              });
                              sharedPrefput(i);
                              //print(theme);
                              print(index);
                              print(i);
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 5),
                              child: Padding(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: Container(
                                  //color: Colors.blue,
                                  margin: EdgeInsets.only(
                                      left: 0, right: 0, bottom: 0, top: 0),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    // color: Colors.white,
                                    // boxShadow: [
                                    //   BoxShadow(
                                    //     blurRadius: 3.0,
                                    //     color:
                                    //         Colors.black.withOpacity(.2),
                                    //     //offset: Offset(6.0, 7.0),
                                    //   ),
                                    // ],
                                    // border: Border.all(width: 0.2, color: Colors.grey)
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Stack(
                                        children: <Widget>[
                                          Container(
                                              padding: EdgeInsets.only(left: 0),
                                              height: 125,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: index == 0
                                                        ? AssetImage(
                                                            "assets/images/f4.jpg")
                                                        : index == 1
                                                            ? AssetImage(
                                                                "assets/images/f.jpg")
                                                            : index == 2
                                                                ? AssetImage(
                                                                    "assets/images/f6.jpg")
                                                                : index == 3
                                                                    ? AssetImage(
                                                                        "assets/images/f5.jpg")
                                                                    : index == 4
                                                                        ? AssetImage(
                                                                            "assets/images/friend8.jpg")
                                                                        : index ==
                                                                                5
                                                                            ? AssetImage(
                                                                                "assets/images/f2.jpg")
                                                                            : index == 6
                                                                                ? AssetImage("assets/images/f9.jpg")
                                                                                : index == 7 ? AssetImage("assets/images/f10.png") : index == 8 ? AssetImage("assets/images/pattern1.jpg") : AssetImage("assets/images/pattern2.jpg"),
                                                    fit: BoxFit.cover,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft: Radius
                                                              .circular(15.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  15.0),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  15.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  15.0)),
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      width: 0.2,
                                                      color: Colors.grey)),
                                              child: null),
                                          (theme == null || theme == "1") &&
                                                  index == 0
                                              ? Container(
                                                  decoration: BoxDecoration(
                                                      color: header,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(15),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          10))),
                                                  padding: EdgeInsets.all(3),
                                                  child: Icon(
                                                    Icons.done,
                                                    color: Colors.white,
                                                    size: 20,
                                                  ),
                                                )
                                              : theme == "2" && index == 1
                                                  ? Container(
                                                      decoration: BoxDecoration(
                                                          color: header,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          15),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          10))),
                                                      padding:
                                                          EdgeInsets.all(3),
                                                      child: Icon(
                                                        Icons.done,
                                                        color: Colors.white,
                                                        size: 20,
                                                      ),
                                                    )
                                                  : theme == "3" && index == 2
                                                      ? Container(
                                                          decoration: BoxDecoration(
                                                              color: header,
                                                              borderRadius: BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          15),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          10))),
                                                          padding:
                                                              EdgeInsets.all(3),
                                                          child: Icon(
                                                            Icons.done,
                                                            color: Colors.white,
                                                            size: 20,
                                                          ),
                                                        )
                                                      : theme == "4" &&
                                                              index == 3
                                                          ? Container(
                                                              decoration: BoxDecoration(
                                                                  color: header,
                                                                  borderRadius: BorderRadius.only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              15),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              10))),
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(3),
                                                              child: Icon(
                                                                Icons.done,
                                                                color: Colors
                                                                    .white,
                                                                size: 20,
                                                              ),
                                                            )
                                                          : theme == "5" &&
                                                                  index == 4
                                                              ? Container(
                                                                  decoration: BoxDecoration(
                                                                      color:
                                                                          header,
                                                                      borderRadius: BorderRadius.only(
                                                                          topLeft: Radius.circular(
                                                                              15),
                                                                          bottomRight:
                                                                              Radius.circular(10))),
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              3),
                                                                  child: Icon(
                                                                    Icons.done,
                                                                    color: Colors
                                                                        .white,
                                                                    size: 20,
                                                                  ),
                                                                )
                                                              : theme == "6" &&
                                                                      index == 5
                                                                  ? Container(
                                                                      decoration: BoxDecoration(
                                                                          color:
                                                                              header,
                                                                          borderRadius: BorderRadius.only(
                                                                              topLeft: Radius.circular(15),
                                                                              bottomRight: Radius.circular(10))),
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              3),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .done,
                                                                        color: Colors
                                                                            .white,
                                                                        size:
                                                                            20,
                                                                      ),
                                                                    )
                                                                  : theme == "7" &&
                                                                          index ==
                                                                              6
                                                                      ? Container(
                                                                          decoration: BoxDecoration(
                                                                              color: header,
                                                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomRight: Radius.circular(10))),
                                                                          padding:
                                                                              EdgeInsets.all(3),
                                                                          child:
                                                                              Icon(
                                                                            Icons.done,
                                                                            color:
                                                                                Colors.white,
                                                                            size:
                                                                                20,
                                                                          ),
                                                                        )
                                                                      : theme == "8" &&
                                                                              index == 7
                                                                          ? Container(
                                                                              decoration: BoxDecoration(color: header, borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomRight: Radius.circular(10))),
                                                                              padding: EdgeInsets.all(3),
                                                                              child: Icon(
                                                                                Icons.done,
                                                                                color: Colors.white,
                                                                                size: 20,
                                                                              ),
                                                                            )
                                                                          : theme == "9" && index == 8
                                                                              ? Container(
                                                                                  decoration: BoxDecoration(color: header, borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomRight: Radius.circular(10))),
                                                                                  padding: EdgeInsets.all(3),
                                                                                  child: Icon(
                                                                                    Icons.done,
                                                                                    color: Colors.white,
                                                                                    size: 20,
                                                                                  ),
                                                                                )
                                                                              : theme == "10" && index == 9
                                                                                  ? Container(
                                                                                      decoration: BoxDecoration(color: header, borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomRight: Radius.circular(10))),
                                                                                      padding: EdgeInsets.all(3),
                                                                                      child: Icon(
                                                                                        Icons.done,
                                                                                        color: Colors.white,
                                                                                        size: 20,
                                                                                      ),
                                                                                    )
                                                                                  : Container()
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        childCount: 10,
                      ),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 190.0,
                        mainAxisSpacing: 0.0,
                        crossAxisSpacing: 0.0,
                        childAspectRatio: 1.0,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
