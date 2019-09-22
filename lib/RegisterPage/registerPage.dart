import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:chatapp_new/LoginPage/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

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
                                  "Sign up",
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
                                  "Create account and start making friends worldwide",
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
                                      width: MediaQuery.of(context).size.width,
                                      padding: EdgeInsets.all(10),
                                      margin: EdgeInsets.only(
                                          left: 20, right: 20, top: 5),
                                      decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.7),
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
                                          hintText: "First name *",
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
                              margin: EdgeInsets.only(bottom: 10, top: 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                //mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                      width: MediaQuery.of(context).size.width,
                                      padding: EdgeInsets.all(10),
                                      margin: EdgeInsets.only(
                                          left: 20, right: 20, top: 5),
                                      decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.7),
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
                                          hintText: "Last name *",
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
                              margin: EdgeInsets.only(bottom: 10, top: 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                //mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                      width: MediaQuery.of(context).size.width,
                                      padding: EdgeInsets.all(10),
                                      margin: EdgeInsets.only(
                                          left: 20, right: 20, top: 5),
                                      decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.7),
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
                                          hintText: "Email *",
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
                              margin: EdgeInsets.only(bottom: 10, top: 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                //mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                      width: MediaQuery.of(context).size.width,
                                      padding: EdgeInsets.all(10),
                                      margin: EdgeInsets.only(
                                          left: 20, right: 20, top: 5),
                                      decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.7),
                                          border: Border.all(
                                              color: Colors.grey, width: 0.5),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15))),
                                      child: Row(
                                        children: <Widget>[
                                          Flexible(
                                            child: TextField(
                                              //controller: phoneController,
                                              keyboardType: TextInputType.text,
                                              obscureText:
                                                  count % 2 != 0 ? false : true,
                                              style: TextStyle(
                                                color: Colors.black87,
                                                fontFamily: 'Oswald',
                                              ),
                                              decoration: InputDecoration(
                                                hintText: "Password *",
                                                hintStyle: TextStyle(
                                                    color: Colors.black38,
                                                    fontSize: 15,
                                                    fontFamily: 'Oswald',
                                                    fontWeight:
                                                        FontWeight.w300),
                                                //labelStyle: TextStyle(color: Colors.white70),
                                                contentPadding:
                                                    EdgeInsets.fromLTRB(
                                                        10.0, 0.0, 20.0, 0.0),
                                                border: InputBorder.none,
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                count++;
                                              });
                                            },
                                            child: Container(
                                                padding: EdgeInsets.all(4),
                                                child: Icon(
                                                  count % 2 != 0
                                                      ? Icons.visibility
                                                      : Icons.visibility_off,
                                                  size: 22,
                                                  color: count % 2 != 0
                                                      ? header
                                                      : Colors.black38,
                                                )),
                                          )
                                        ],
                                      )),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10, top: 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                //mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                      width: MediaQuery.of(context).size.width,
                                      padding: EdgeInsets.all(10),
                                      margin: EdgeInsets.only(
                                          left: 20, right: 20, top: 5),
                                      decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.7),
                                          border: Border.all(
                                              color: Colors.grey, width: 0.5),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15))),
                                      child: TextField(
                                        //controller: phoneController,
                                        keyboardType: TextInputType.text,
                                        obscureText: true,
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontFamily: 'Oswald',
                                        ),
                                        decoration: InputDecoration(
                                          hintText: "Confirm Password *",
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
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  tnc++;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 35, top: 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      padding: EdgeInsets.all(1),
                                      decoration: BoxDecoration(
                                          color: tnc % 2 == 0
                                              ? Colors.white
                                              : header,
                                          border: Border.all(
                                              color: tnc % 2 == 0
                                                  ? Colors.grey
                                                  : header),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                      child: Icon(
                                        Icons.done,
                                        size: 12,
                                        color: tnc % 2 == 0
                                            ? Colors.black38
                                            : Colors.white,
                                      ),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(
                                            right: 20, left: 5, top: 10),
                                        child: Row(
                                          children: <Widget>[
                                            Text(
                                              "Agree with our ",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white70,
                                                  fontSize: 12,
                                                  fontFamily: 'Oswald',
                                                  fontWeight: FontWeight.w300),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                // Navigator.push(
                                                //   context,
                                                //   MaterialPageRoute(
                                                //       builder: (context) => TnCPage()),
                                                // );
                                              },
                                              child: Container(
                                                child: Text(
                                                  "Terms & Conditions",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: header,
                                                      fontSize: 12,
                                                      decoration: TextDecoration
                                                          .underline,
                                                      fontFamily: 'Oswald',
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 20, top: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(builder: (context) => LoginPage()),
                                      // );
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
                                          "Sign Up",
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
                            Container(
                              margin: EdgeInsets.only(top: 0, bottom: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                      child: Text(
                                    "Already have an account?",
                                    style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 14,
                                        fontFamily: 'Oswald',
                                        fontWeight: FontWeight.w300),
                                  )),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()),
                                      );
                                    },
                                    child: Container(
                                        margin: EdgeInsets.only(left: 5),
                                        child: Text(
                                          "Sign in",
                                          style: TextStyle(
                                              color: header,
                                              fontSize: 14,
                                              fontFamily: 'Oswald',
                                              fontWeight: FontWeight.w400),
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
      ),
    );
  }
}
