import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:chatapp_new/MainScreens/LoginPage/loginPage.dart';
import 'package:chatapp_new/MainScreens/RegisterPage/registerPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';

class OptionPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OptionPageState();
  }
}

class OptionPageState extends State<OptionPage> {
  SharedPreferences sharedPreferences;
  List imgList = ["assets/images/p5.jpg", "assets/images/l1.jpg"];
  void imageChange(int index) {}
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
      //backgroundColor: back_new,
      body: SafeArea(
        child: Stack(
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
                                              ? AssetImage(
                                                  "assets/images/f9.jpg")
                                              : theme == "8"
                                                  ? AssetImage(
                                                      "assets/images/f10.png")
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
              margin: EdgeInsets.only(top: 5),
              child: BackButton(color: Colors.white),
            ),
            Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25))),
                      margin: EdgeInsets.only(top: 0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(top: 20, left: 20),
                                child: Text(
                                  "Be together\nanytime, anywhere",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontFamily: 'Oswald',
                                      fontWeight: FontWeight.normal),
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
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(top: 12, left: 20),
                                child: Text(
                                  "Make new friends, connect with them and share your thoughts",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 13,
                                      fontFamily: 'Oswald',
                                      fontWeight: FontWeight.w300),
                                )),
                            Container(
                              margin: EdgeInsets.only(bottom: 20, top: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                //mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()),
                                      );
                                    },
                                    child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        padding: EdgeInsets.all(15),
                                        margin: EdgeInsets.only(
                                            left: 20, right: 20),
                                        decoration: BoxDecoration(
                                            color: header,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
                                        child: Text(
                                          "Login",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontFamily: 'BebasNeue',
                                          ),
                                          textAlign: TextAlign.center,
                                        )),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                RegisterPage()),
                                      );
                                    },
                                    child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        padding: EdgeInsets.all(15),
                                        margin: EdgeInsets.only(
                                            left: 20, right: 20, top: 10),
                                        decoration: BoxDecoration(
                                            color: back_new,
                                            // boxShadow: [
                                            //   BoxShadow(
                                            //     blurRadius: 5.0,
                                            //     color: Colors.black.withOpacity(.5),
                                            //     //offset: Offset(6.0, 7.0),
                                            //   ),
                                            // ],
                                            border: Border.all(
                                                color: Colors.grey, width: 0.5),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
                                        child: Text(
                                          "Create Account",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17,
                                            fontFamily: 'BebasNeue',
                                          ),
                                          textAlign: TextAlign.center,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
