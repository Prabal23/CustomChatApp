import 'package:chatapp_new/MainScreens/HomePage/homePage.dart';
import 'package:chatapp_new/MainScreens/LoginPage/ForgotPassPage/forgotPassPage.dart';
import 'package:chatapp_new/MainScreens/RegisterPage/registerPage.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  int count = 0;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          margin: EdgeInsets.only(top: 35, left: 0, right: 0, bottom: 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: 20, left: 20),
                    child: Text(
                      "Sign in",
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
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3.0,
                              color: Colors.white,
                              //offset: Offset(6.0, 7.0),
                            ),
                          ],
                          border: Border.all(width: 0.5, color: Colors.white)),
                    ),
                  ],
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: 12, left: 20),
                    child: Text(
                      "Login with your account email and password",
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
                          margin: EdgeInsets.only(left: 20, right: 20, top: 5),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.7),
                              border:
                                  Border.all(color: Colors.grey, width: 0.5),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: TextField(
                            //controller: phoneController,
                            keyboardType: TextInputType.emailAddress,
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
                              contentPadding:
                                  EdgeInsets.fromLTRB(10.0, 2.5, 20.0, 2.5),
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
                          margin: EdgeInsets.only(left: 20, right: 20, top: 5),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.7),
                              border:
                                  Border.all(color: Colors.grey, width: 0.5),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Row(
                            children: <Widget>[
                              Flexible(
                                child: TextField(
                                  //controller: phoneController,
                                  keyboardType: TextInputType.text,
                                  obscureText: count % 2 != 0 ? false : true,
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
                                        fontWeight: FontWeight.w300),
                                    //labelStyle: TextStyle(color: Colors.white70),
                                    contentPadding: EdgeInsets.fromLTRB(
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
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPassPage()));
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 5, right: 20),
                      child: Text(
                        "Forget Pasword?",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontFamily: 'Oswald',
                            fontWeight: FontWeight.w300),
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20, top: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()),
                          );
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.all(15),
                            margin: EdgeInsets.only(left: 20, right: 20),
                            decoration: BoxDecoration(
                                color: header,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Text(
                              "Sign in",
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
                        "Don't have an account?",
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
                                builder: (context) => RegisterPage()),
                          );
                        },
                        child: Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text(
                              "Sign up",
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
    );
  }
}
