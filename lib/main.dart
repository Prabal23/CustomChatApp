import 'package:flutter/material.dart';

import 'MainScreens/StartingPage/startingPage.dart';

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
List<String> user = [];
List<String> name = [
  "John Smith",
  "David Ryan",
  "Simon Wright",
  "Mike Johnson",
  "Daniel Smith"
];

String color = "", background = "";

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
