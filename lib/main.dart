import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'MainScreens/StartingPage/startingPage.dart';

String color = "", background = "";

void main() => runApp(MyApp());

Color header = Color(0xFFED8779);
Color back = Color(0xFFF6F6F6);
Color back_new = Color(0xFFF3E1D7);
Color subheader = Color(0xFF54D3C2);
//Color fb = Color(0xFF3B5999);
Color fb = Color(0xFF1877F2);
Color sub_white = Color(0xFFf4f4f4);
Color golden = Color(0xFFCFB53B);
Color chat_back = Color(0xFFEAE7E2);
Color my_chat = Color(0xFF01AFF4);
Color person_chat = Color(0xFFE9EBED);
Color chat_page_back = Color(0xFFFFFFFF);

var friendname = List<String>();
SharedPreferences sharedPreferences;
List<String> user = [];
List<String> name = [
  "John Smith",
  "David Ryan",
  "Simon Wright",
  "Mike Johnson",
  "Daniel Smith"
];

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppPageState();
  }
}

class MyAppPageState extends State<MyApp> {
  @override
  void initState() {
    if (color == null || color == "null" || color == "") {
      sharedPrefColorput();
    } else {
      sharedPrefcheck();
    }

    super.initState();
  }

  void sharedPrefColorput() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    setState(() {
      color = "1";

      localStorage.setString("color", color);
      print("color");
      print(color);
      sharedPrefcheck();
    });
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
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: header),
      home: StartingPage(),
    );
  }
}
