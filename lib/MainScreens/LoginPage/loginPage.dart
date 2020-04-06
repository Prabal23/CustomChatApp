import 'package:chatapp_new/Forms/LoginForm/loginForm.dart';
import 'package:chatapp_new/MainScreens/HomePage/homePage.dart';
import 'package:chatapp_new/MainScreens/RegisterPage/registerPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';
import 'ForgotPassPage/forgotPassPage.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
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
              decoration: BoxDecoration(
                  color: color == "1"
                      ? Colors.grey.withOpacity(0.5)
                      : Colors.white70),
              child: null,
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: 5),
                    child: BackButton(
                        color: color == "1" ? Colors.white : Colors.black54),
                  ),
                  LoginForm(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
