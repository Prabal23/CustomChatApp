import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:chatapp_new/LoginPage/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'dart:io';

import '../../main.dart';

class VerifyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return VerifyPageState();
  }
}

class VerifyPageState extends State<VerifyPage> {
  int page = 0;
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
        backgroundColor: back,
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
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.3),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25))),
                        margin: EdgeInsets.only(
                            top: 35, left: 0, right: 0, bottom: 0),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            //mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.only(top: 20, left: 20),
                                  child: Text(
                                    "Verify Password Change",
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
                                  margin: EdgeInsets.only(
                                      top: 12, left: 20, right: 20),
                                  child: Text(
                                    "We have sent you a sms with a verification code to the number +880 1689 588 341",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 13,
                                        fontFamily: 'Oswald',
                                        fontWeight: FontWeight.w300),
                                  )),
                              Container(
                                margin: EdgeInsets.only(bottom: 10, top: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  //mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        padding: EdgeInsets.all(10),
                                        margin: EdgeInsets.only(
                                            left: 20, right: 20, top: 5),
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.7),
                                            border: Border.all(
                                                color: Colors.grey, width: 0.5),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
                                        child: TextField(
                                          //controller: phoneController,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          style: TextStyle(
                                            color: Colors.black87,
                                            fontFamily: 'Oswald',
                                          ),
                                          decoration: InputDecoration(
                                            hintText: "Verification Code",
                                            hintStyle: TextStyle(
                                                color: Colors.black38,
                                                fontSize: 15,
                                                fontFamily: 'Oswald',
                                                fontWeight: FontWeight.w300),
                                            //labelStyle: TextStyle(color: Colors.white70),
                                            contentPadding: EdgeInsets.fromLTRB(
                                                10.0, 2.5, 20.0, 2.5),
                                            border: InputBorder.none,
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 20, top: 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () {
                                        _showDoneDialog();
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
                                            "Reset Password",
                                            style: TextStyle(
                                              color: Colors.white,
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Future<Null> _showDoneDialog() async {
    return showDialog<Null>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return new AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          title: Center(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: header, width: 1.5),
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white),
                        child: Icon(
                          Icons.done,
                          color: header,
                          size: 50,
                        )),
                    Container(
                        margin: EdgeInsets.only(top: 12),
                        child: Text(
                          "Password has been reset successfully",
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              });
                            },
                            child: Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.only(
                                    left: 0, right: 0, top: 20, bottom: 0),
                                decoration: BoxDecoration(
                                    color: header,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100))),
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
}
