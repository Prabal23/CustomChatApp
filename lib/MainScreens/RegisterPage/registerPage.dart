import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:chatapp_new/Cards/RegisterCard/registerCard.dart';
import 'package:chatapp_new/MainScreens/LoginPage/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegisterPageState();
  }
}

class RegisterPageState extends State<RegisterPage> {
  int count = 0, tnc = 0;
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
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: 5),
                    child: BackButton(color: Colors.white),
                  ),
                  RegisterCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
