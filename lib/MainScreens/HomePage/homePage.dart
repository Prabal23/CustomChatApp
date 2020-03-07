import 'package:chatapp_new/MainScreens/BottomNavPages/FeedPage/feedPage.dart';
import 'package:chatapp_new/MainScreens/BottomNavPages/FriendsPage/friendsPage.dart';
import 'package:chatapp_new/MainScreens/BottomNavPages/GroupPage/groupPage.dart';
import 'package:chatapp_new/MainScreens/BottomNavPages/MainPage/myProfile.dart';
import 'package:chatapp_new/MainScreens/BottomNavPages/SettingsPage/ThemePage/themePage.dart';
import 'package:chatapp_new/MainScreens/BottomNavPages/SettingsPage/settingsPage.dart';
import 'package:chatapp_new/MainScreens/ChatPage/chatPage.dart';
import 'package:chatapp_new/MainScreens/NotifyPage/notifyPage.dart';
import 'package:chatapp_new/MainScreens/SearchPage/searchPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _selectedPage = 0;
  final pageOptions = [
    FeedPage(),
    FriendsPage(),
    GroupPage(),
    SettingsPage(),
    //ThemePage(),
    ProfileNewPage(),
  ];

  @override
  void initState() {
    sharedPrefcheck();
    super.initState();
  }

  void sharedPrefcheck() async {
    sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
      color = sharedPreferences.getString("color");
      print("Color check");
      print(color);
    });
    //print(theme);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        //backgroundColor: Colors.white,
        //key: _scaffoldKey,
        appBar: AppBar(
          //iconTheme: IconThemeData(color: header),
          automaticallyImplyLeading: false,
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
                          "Chat anytime",
                          style: TextStyle(
                              color:
                                  color == "1" ? Colors.white : Colors.black54,
                              fontSize: 20,
                              fontFamily: 'Oswald',
                              fontWeight: FontWeight.normal),
                        )),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SearchPage()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        //color: sub_white,
                        borderRadius: BorderRadius.circular(15)),
                    margin: EdgeInsets.only(right: 10),
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      Icons.search,
                      color: color == "1" ? Colors.grey[200] : Colors.black54,
                      size: 18,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NotifyPage()),
                    );
                  },
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            //color: sub_white,
                            borderRadius: BorderRadius.circular(15)),
                        padding: EdgeInsets.all(8),
                        child: Icon(
                          Icons.notifications,
                          color:
                              color == "1" ? Colors.grey[200] : Colors.black54,
                          size: 18,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            top: 1, bottom: 1, right: 5, left: 5),
                        margin: EdgeInsets.only(right: 10, left: 20),
                        decoration: BoxDecoration(
                            color: header,
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(
                          "2",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: 'Oswald',
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatPage()),
                    );
                  },
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            //color: sub_white,
                            borderRadius: BorderRadius.circular(15)),
                        padding: EdgeInsets.all(8),
                        child: Icon(
                          Icons.chat,
                          color:
                              color == "1" ? Colors.grey[200] : Colors.black54,
                          size: 18,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            top: 1, bottom: 1, right: 5, left: 5),
                        margin: EdgeInsets.only(right: 0, left: 20),
                        decoration: BoxDecoration(
                            color: header,
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(
                          "3",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: 'Oswald',
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[],
        ),
        //body: Text("lol")
        body: pageOptions[_selectedPage],
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              canvasColor: color == "1"
                  ? Colors.black.withOpacity(0.5)
                  : Colors.white.withOpacity(0.7),
              primaryColor: header,
              textTheme: Theme.of(context).textTheme.copyWith(
                  caption: new TextStyle(
                      color: color == "1" ? back_new : Colors.grey))),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedPage,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home, size: 20), title: SizedBox.shrink()),
              BottomNavigationBarItem(
                  icon: new Stack(children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                          top: 5,
                          right: _selectedPage == 1 ? 0 : 10,
                          left: _selectedPage == 1 ? 30 : 0),
                      child: new Icon(
                        Icons.group,
                        size: 20,
                      ),
                    ),
                    _selectedPage == 1
                        ? Container()
                        : Positioned(
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.only(
                                  top: 1, bottom: 1, right: 5, left: 5),
                              margin: EdgeInsets.only(
                                  right: 0, left: 0, bottom: 10),
                              decoration: BoxDecoration(
                                  color: header,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Text(
                                "12",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontFamily: 'Oswald',
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          )
                  ]),
                  title: SizedBox.shrink()),
              BottomNavigationBarItem(
                  icon: Icon(Icons.supervised_user_circle, size: 20),
                  title: SizedBox.shrink()),
              BottomNavigationBarItem(
                  //icon: Icon(Icons.settings, size: 20),
                  icon: Icon(Icons.settings, size: 20),
                  title: SizedBox.shrink()),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person, size: 20), title: SizedBox.shrink())
            ],
            onTap: (int index) {
              setState(() {
                _selectedPage = index;
              });
              //print(_selectedPage);
            },
          ),
        ),
      ),
    );
  }
}
