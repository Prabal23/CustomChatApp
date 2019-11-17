import 'package:chatapp_new/MainScreens/OptionPage/optionPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';

class StartingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StartingPageState();
  }
}

class StartingPageState extends State<StartingPage> {
  String theme = "";
  
  @override
  void initState() {
    sharedPrefcheck();
    super.initState();
  }

  void sharedPrefcheck() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    //localStorage.remove("theme");
    setState(() {
     theme = localStorage.getString("theme"); 
    });
    //print("object $theme +");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: back_new,
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: <Widget>[
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 80),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(top: 0),
                              child: Text(
                                "Chat anytime",
                                style: TextStyle(
                                    color: header,
                                    fontSize: 30,
                                    fontFamily: 'Oswald',
                                    fontWeight: FontWeight.normal),
                              )),
                          Container(
                              margin: EdgeInsets.only(top: 0),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                      width: 85,
                                      margin: EdgeInsets.only(
                                          top: 15, left: 0, right: 25),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15.0)),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 3.0,
                                              color: header,
                                              //offset: Offset(6.0, 7.0),
                                            ),
                                          ],
                                          border: Border.all(
                                              width: 0.3, color: header))),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Stay connected and plan things easily",
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                        fontFamily: 'Oswald',
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          Stack(
                            children: <Widget>[
                              Center(
                                child: Container(
                                  margin: EdgeInsets.only(left: 30, top: 25),
                                  height: 380,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        bottomLeft: Radius.circular(15)),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/friend.jpg"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: null,
                                ),
                              ),
                              Center(
                                child: Container(
                                  margin: EdgeInsets.only(left: 30, top: 25),
                                  height: 380,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          bottomLeft: Radius.circular(15)),
                                      color: Colors.white.withOpacity(0.3)),
                                  child: null,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 30, top: 377),
                                height: 80,
                                alignment: Alignment.bottomRight,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => OptionPage()),
                                    );
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            padding: EdgeInsets.all(15),
                                            margin: EdgeInsets.only(
                                                left: 20, right: 0),
                                            decoration: BoxDecoration(
                                                color: header,
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15),
                                                    bottomLeft:
                                                        Radius.circular(15))),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 3, right: 5),
                                                  child: Text(
                                                    "Get Started",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontFamily: 'BebasNeue',
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                Icon(Icons.arrow_forward,
                                                    color: Colors.white,
                                                    size: 17)
                                              ],
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
